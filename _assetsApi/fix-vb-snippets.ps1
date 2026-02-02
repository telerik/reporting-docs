<#
.SYNOPSIS
    Fixes empty VB code snippets in DocFX-generated YML files by extracting code from source files.

.DESCRIPTION
    DocFX has a bug where it doesn't copy VB code examples from XML files to YML files.
    This script finds empty VB snippets, locates the source code via XML documentation,
    extracts the code from the region, and embeds it into the YML files.

.PARAMETER MetadataPath
    Path to the metadata directory containing YML files.

.PARAMETER BinPath
    Path to the Bin directory containing XML documentation files.

.PARAMETER SnippetBasePath
    Base path where the code snippet source files are located.

.EXAMPLE
    .\fix-vb-snippets.ps1
    .\fix-vb-snippets.ps1 -MetadataPath "C:\Work\reporting-docs\_assetsApi\metadata" -BinPath "C:\Work\reporting-docs\_assetsApi\Bin" -SnippetBasePath "C:\Work\reporting"
#>

param(
    [string]$MetadataPath = "$PSScriptRoot\metadata",
    [string]$BinPath = "$PSScriptRoot\Bin",
    [string]$SnippetBasePath = "C:\Work\reporting"
)

function Get-MemberUidFromContext {
    param(
        [string[]]$Lines,
        [int]$LineIndex
    )
    
    # Search backwards from the empty VB snippet to find the member UID
    # First try to find commentId (which has the prefix like P:, M:, E:)
    # If not found, fall back to uid
    for ($i = $LineIndex; $i -ge 0; $i--) {
        $line = $Lines[$i]
        if ($line -match '^\s*commentId:\s+(.+)$') {
            return $Matches[1]
        }
        if ($line -match '^\s*- uid:\s+(.+)$') {
            # This is a section start, stop here
            # If we haven't found commentId by now, try using uid
            # but we need to infer the prefix
            break
        }
    }
    
    return $null
}

function Get-VBCodeReferenceFromXml {
    param(
        [string]$XmlPath,
        [string]$MemberUid
    )
    
    Write-Verbose "Searching for member: $MemberUid in $XmlPath"
    
    # Load XML content
    if (-not (Test-Path $XmlPath)) {
        Write-Warning "XML file not found: $XmlPath"
        return $null
    }
    
    $xmlContent = Get-Content $XmlPath -Raw
    
    # Convert UID format to XML member name format
    # e.g., "Telerik.Reporting.Processing.ReportProcessor.PrintReport(...)" 
    # to "M:Telerik.Reporting.Processing.ReportProcessor.PrintReport(...)"
    $memberName = $MemberUid
    
    # Find the member section
    if ($xmlContent -match "(?s)<member name=`"$([regex]::Escape($MemberUid))`">(.+?)</member>") {
        $memberContent = $Matches[1]
        
        # Look for VB code tag with source and region
        if ($memberContent -match '<code lang="VB" source="([^"]+)" region="([^"]+)"\s*/>') {
            return @{
                Source = $Matches[1]
                Region = $Matches[2]
            }
        }
    }
    
    return $null
}

function Get-CodeFromRegion {
    param(
        [string]$FilePath,
        [string]$RegionName
    )
    
    if (-not (Test-Path $FilePath)) {
        Write-Warning "Source file not found: $FilePath"
        return $null
    }
    
    Write-Verbose "Extracting region '$RegionName' from: $FilePath"
    
    $lines = Get-Content $FilePath
    $inRegion = $false
    $codeLines = @()
    $regionDepth = 0
    
    # VB uses '#region (case-insensitive) and can have comment markers
    $regionPattern = "^\s*'?\s*#\s*[Rr]egion\s+[`"']?$([regex]::Escape($RegionName))[`"']?\s*$"
    $anyRegionPattern = "^\s*'?\s*#\s*[Rr]egion\s+"
    $endRegionPattern = "^\s*'?\s*#\s*[Ee]nd\s*[Rr]egion"
    
    foreach ($line in $lines) {
        if ($line -match $regionPattern) {
            $inRegion = $true
            $regionDepth = 1
            continue
        }
        
        if ($inRegion) {
            # Check for nested regions or end region BEFORE adding the line
            if ($line -match $anyRegionPattern) {
                $regionDepth++
                # Still add this line as it's a nested region marker
                $codeLines += $line
            }
            elseif ($line -match $endRegionPattern) {
                $regionDepth--
                if ($regionDepth -eq 0) {
                    # We've reached the end of our target region
                    # Don't add this line, just break
                    break
                }
                # Add end region lines for nested regions
                $codeLines += $line
            }
            else {
                # Add regular code lines
                $codeLines += $line
            }
        }
    }
    
    if ($codeLines.Count -eq 0) {
        Write-Warning "Region '$RegionName' not found or empty in: $FilePath"
        return $null
    }
    
    # Join the lines and return
    return $codeLines -join "`n"
}

function Get-XmlFileForNamespace {
    param(
        [string]$BinPath,
        [string]$MemberUid
    )
    
    # Extract namespace from UID (e.g., "Telerik.Reporting.Processing.ReportProcessor" -> "Telerik.Reporting")
    $parts = $MemberUid -split '\.'
    
    # Try to determine the assembly name from the namespace
    # Most likely patterns:
    # - Telerik.Reporting.* -> Telerik.Reporting.xml
    # - Telerik.ReportViewer.* -> Telerik.ReportViewer.*.xml
    
    $possibleXmlFiles = @()
    
    # Try exact matches first
    if ($MemberUid -match '^(Telerik\.[^.]+(\.[^.]+)?)\.') {
        $baseNamespace = $Matches[1]
        $xmlFile = Join-Path $BinPath "$baseNamespace.xml"
        if (Test-Path $xmlFile) {
            $possibleXmlFiles += $xmlFile
        }
    }
    
    # Get all XML files in Bin directory (top level only)
    $allXmlFiles = Get-ChildItem -Path $BinPath -Filter "*.xml" -File
    
    # Return most likely file first, then all others
    return $possibleXmlFiles + $allXmlFiles.FullName | Select-Object -Unique
}

function Fix-EmptyVBSnippets {
    param(
        [string]$YmlPath,
        [string]$BinPath,
        [string]$SnippetBasePath
    )
    
    Write-Host "Processing: $YmlPath" -ForegroundColor Cyan
    
    $lines = Get-Content $YmlPath
    $modified = $false
    $fixCount = 0
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        # Check if this is an empty VB snippet OR a snippet with source/region attributes
        if ($line -match '^\s*<pre><code class="lang-vb"( source="[^"]*" region="[^"]*")?></code></pre>\s*$') {
            Write-Host "  Found VB snippet to fix at line $($i + 1)" -ForegroundColor Yellow
            
            # Get the member UID from context
            $memberUid = Get-MemberUidFromContext -Lines $lines -LineIndex $i
            
            if ($memberUid) {
                Write-Host "  Member UID: $memberUid" -ForegroundColor Gray
                
                # Get potential XML files
                $xmlFiles = Get-XmlFileForNamespace -BinPath $BinPath -MemberUid $memberUid
                
                $vbCodeRef = $null
                foreach ($xmlFile in $xmlFiles) {
                    $vbCodeRef = Get-VBCodeReferenceFromXml -XmlPath $xmlFile -MemberUid $memberUid
                    if ($vbCodeRef) {
                        Write-Host "  Found VB code reference in: $xmlFile" -ForegroundColor Green
                        break
                    }
                }
                
                if ($vbCodeRef) {
                    # Construct full path to source file
                    $sourcePath = Join-Path $SnippetBasePath $vbCodeRef.Source
                    
                    # Extract the code from the region
                    $code = Get-CodeFromRegion -FilePath $sourcePath -RegionName $vbCodeRef.Region
                    
                    if ($code) {
                        # Replace the empty snippet with the actual code
                        $indent = if ($line -match '^(\s+)') { $Matches[1] } else { '' }
                        
                        # Build the replacement with proper indentation
                        $codeLines = $code -split "`n"
                        $indentedCode = ($codeLines | ForEach-Object { $_ }) -join "`n$indent"
                        
                        $replacement = "${indent}<pre><code class=`"lang-vb`">$indentedCode</code></pre>"
                        $lines[$i] = $replacement
                        $modified = $true
                        $fixCount++
                        Write-Host "  ✓ Fixed with code from: $($vbCodeRef.Source) [$($vbCodeRef.Region)]" -ForegroundColor Green
                    } else {
                        Write-Warning "  Could not extract code from region '$($vbCodeRef.Region)' in: $sourcePath"
                    }
                } else {
                    Write-Warning "  Could not find VB code reference for member: $memberUid"
                }
            } else {
                Write-Warning "  Could not determine member UID for empty VB snippet at line $($i + 1)"
            }
        }
    }
    
    if ($modified) {
        # Write the modified content back to the file
        $lines | Set-Content -Path $YmlPath -Encoding UTF8
        Write-Host "✓ Fixed $fixCount snippet(s) in file" -ForegroundColor Green
    } else {
        Write-Host "  No changes needed" -ForegroundColor Gray
    }
    
    return $fixCount
}

# Main execution
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "DocFX VB Code Snippet Fixer" -ForegroundColor Cyan
Write-Host "Snippet Base Path: $SnippetBasePath" -ForegroundColor Gray
Write-Host ""

# Get all YML files
$ymlFiles = Get-ChildItem -Path $MetadataPath -Filter "*.yml" -Recurse

Write-Host "Found $($ymlFiles.Count) YML file(s)" -ForegroundColor Gray
Write-Host ""

$totalFixed = 0
foreach ($ymlFile in $ymlFiles) {
    $totalFixed += Fix-EmptyVBSnippets -YmlPath $ymlFile.FullName -BinPath $BinPath -SnippetBasePath $SnippetBasePath
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "✓ Complete! Fixed $totalFixed snippet(s) total" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
