---
title: Fixing "Could not load file or assembly Microsoft.mshtml" Error in Telerik Report Designer
description: Resolve the "Could not load file or assembly Microsoft.mshtml" error encountered in Telerik Report Designer when designing reports.
type: how-to
page_title: Resolving Microsoft.mshtml Assembly Error in Telerik Report Designer
meta_title: Resolving Microsoft.mshtml Assembly Error in Telerik Report Designer
slug: resolving-microsoft-mshtml-assembly-error-telerik-report-designer
tags: telerik reporting, error handling, microsoft.mshtml, gac, assembly references
res_type: kb
ticketid: 1692750
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>18.3.24.1218</td>
</tr>
</tbody>
</table>

## Description

I encounter the "Could not load file or assembly Microsoft.mshtml" error when working with Telerik Report Designer. This happens consistently while updating or designing reports, particularly when adding a subreport and using an HTML TextBox for a different SQL query. The error forces the system to shut down, requiring a restart.

This knowledge base article also answers the following questions:
- How to resolve the Microsoft.mshtml assembly error in Telerik Report Designer?
- Why does Telerik Report Designer fail with the Microsoft.mshtml error?
- How to install Microsoft.mshtml in the Global Assembly Cache?

## Solution

To resolve the "Could not load file or assembly Microsoft.mshtml" error, follow these steps:

### Step 1: Copy the Assembly to the Designer Folder
1. Locate the `microsoft.mshtml.dll` assembly file on your system.
2. Copy the file to the Telerik Report Designer folder.
3. Open the report file (`SampleReport.trdp`) and select the HTML TextBox to check if the error is resolved.

### Step 2: Add Assembly Reference to the Configuration Files
1. Open the `Telerik.ReportDesigner.exe.config` or `Telerik.ReportDesigner.x86.exe.config` file.
2. Add the following assembly reference:

```xml
<!-- Add assembly references -->
<Telerik.Reporting>
  <AssemblyReferences>
    <add name="Microsoft.mshtml" version="7.0.3300.0" />
  </AssemblyReferences>
</Telerik.Reporting>
```

3. Save the changes and relaunch Telerik Report Designer.

### Step 3: Install Microsoft.mshtml in the Global Assembly Cache (GAC)
1. Open the Developer Command Prompt for Visual Studio.
2. Run the command `gacutil /l microsoft.mshtml` to check if the assembly exists in the GAC. It should display `Number of items = 0` if missing.
3. Navigate to the directory containing the `microsoft.mshtml.dll` file.
4. Execute the following command to install the assembly: `gacutil /i microsoft.mshtml.dll`.
5. Verify installation with `gacutil /l microsoft.mshtml`.

For detailed instructions, refer to [Install an assembly into the global assembly cache](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/install-assembly-into-gac) documentation.

## See Also
- [Global Assembly Cache (GAC)](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac)
- [Install an assembly into the global assembly cache](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/install-assembly-into-gac)
- [Telerik Reporting Overview](https://docs.telerik.com/reporting/overview)
