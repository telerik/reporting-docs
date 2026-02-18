# VB Code Snippet Fixer for DocFX

## Overview

This PowerShell script fixes a DocFX bug where VB code examples are not copied from XML documentation files to YML files, leaving empty code snippets.

## What It Does

1. Scans all YML files in the metadata directory
2. Finds empty VB code snippets: `<pre><code class="lang-vb"></code></pre>`
3. Locates the corresponding member UID in the YML structure
4. Searches XML documentation files in the Bin directory for VB code references
5. Extracts the actual VB code from source files using region markers
6. Embeds the extracted code directly into the YML files

## Usage

### Basic Usage

```powershell
.\fix-vb-snippets.ps1
```

### With Custom Paths

```powershell
.\fix-vb-snippets.ps1 `
    -MetadataPath "C:\Work\reporting-docs\_assetsApi\metadata" `
    -BinPath "C:\Work\reporting-docs\_assetsApi\Bin" `
    -SnippetBasePath "C:\Work\reporting"
```

### With Verbose Output

```powershell
.\fix-vb-snippets.ps1 -SnippetBasePath "C:\Work\reporting" -Verbose
```

## Parameters

- **MetadataPath**: Path to the directory containing YML files (default: `$PSScriptRoot\metadata`)
- **BinPath**: Path to the directory containing XML documentation files (default: `$PSScriptRoot\Bin`)
- **SnippetBasePath**: Base path where code snippet source files are located (default: `C:\Work\reporting`)

## Requirements

- PowerShell 5.1 or later
- Access to:
  - YML metadata files
  - XML documentation files
  - VB source code files with regions

## How It Works

### 1. Pattern Matching

The script looks for VB code snippets in two formats:

- Empty: `<pre><code class="lang-vb"></code></pre>`
- With references: `<pre><code class="lang-vb" source="..." region="..."></code></pre>`

### 2. Member UID Detection

Searches backwards from the empty snippet to find the `commentId` which contains the member identifier with its type prefix (M: for methods, P: for properties, E: for events):

```yaml
- uid: Telerik.Reporting.Processing.ReportProcessor.PrintReport(...)
  commentId: M:Telerik.Reporting.Processing.ReportProcessor.PrintReport(...)
  ...
  remarks: >-
    ...
    <pre><code class="lang-vb"></code></pre>
```

### 3. XML Documentation Lookup

Searches XML files for the member using the `commentId` and extracts VB code references:

```xml
<member name="M:Telerik.Reporting.Processing.ReportProcessor.PrintReport(...)">
  <example>
    <code lang="VB" source="CodeSnippets\VB\...\ReportProcessorSnippets.vb" region="PrintNoUI" />
  </example>
</member>
```

### 4. Region Extraction

Extracts code from VB source files between region markers:

```vb
'#region PrintNoUI
Dim reportName = "..."
' ... code ...
'#end region
```

The script handles various VB region formats:

- `'#region RegionName`
- `'#Region "RegionName"`
- `#region RegionName` (case-insensitive)

### 5. Code Embedding

Replaces the empty snippet with the actual code:

```yaml
<pre><code class="lang-vb">Dim reportName = "..."
' ... actual VB code ...
</code></pre>
```

## Example Output

```
============================================
DocFX VB Code Snippet Fixer
============================================

Metadata Path: C:\Work\reporting-docs\_assetsApi\metadata
Bin Path: C:\Work\reporting-docs\_assetsApi\Bin
Snippet Base Path: C:\Work\reporting

Found 1724 YML file(s)

Processing: C:\...\Telerik.Reporting.Processing.ReportProcessor.yml
  Found VB snippet to fix at line 436
  Member UID: M:Telerik.Reporting.Processing.ReportProcessor.PrintReport(...)
  Found VB code reference in: C:\...\Bin\Telerik.Reporting.xml
  ✓ Fixed with code from: CodeSnippets\VB\...\ReportProcessorSnippets.vb [PrintNoUI]
  ...
✓ Fixed 4 snippet(s) in file

============================================
✓ Complete! Fixed 73 snippet(s) total
============================================
```

## Integration

Run this script after each DocFX metadata generation:

```powershell
# Generate DocFX metadata
docfx metadata

# Fix VB snippets
.\fix-vb-snippets.ps1 -SnippetBasePath "C:\Work\reporting"

# Build documentation
docfx build
```

## Troubleshooting

### Warning: Region not found

- Ensure the VB source file exists at the specified path
- Check that the region name matches exactly (case-sensitive)
- Verify the region markers follow VB syntax

### Warning: Could not find VB code reference

- The member might not have VB code examples in the XML documentation
- Check if the XML file contains the expected member

### No changes needed

- All VB snippets in the file already have embedded code
- Or there are no VB code snippets in the file
