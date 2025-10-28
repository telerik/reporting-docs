# Simple XML file remover
Get-ChildItem -Path ".\Bin" -Filter "*.xml" -Recurse | Remove-Item -Force
Write-Host "All XML files have been removed from .\Bin and subdirectories"