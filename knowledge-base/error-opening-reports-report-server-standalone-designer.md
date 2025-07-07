---
title: Error When Opening Reports Stored on Report Server in Standalone Report Designer
description: Resolving the error when opening reports stored on Telerik Report Server in the Standalone Report Designer.
type: troubleshooting
page_title: Reports Not Opening in Telerik Report Server Standalone Report Designer
meta_title: Reports Not Opening in Telerik Report Server Standalone Report Designer
slug: error-opening-reports-report-server-standalone-designer
tags: telerik report server, standalone report designer, system.net.http, binding redirect, web.config
res_type: kb
ticketid: 1691680
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td> Progress® Telerik® Report Server </td>
</tr>
<tr>
<td> Designer</td>
<td> Standalone Report Designer</td>
</tr>
</tbody>
</table>

## Description
I encounter an error when attempting to open a report stored on Telerik Report Server in the Standalone Report Designer. The error mentions a conflict in the HTTP controller due to multiple actions matching the request. This problem is linked to incorrect or conflicting versions of the `System.Net.Http` assembly being loaded by the Report Server.

## Cause
The issue arises due to one of the following reasons:
1. The Standalone Report Designer version does not match the Telerik Report Server version.
2. An incorrect version of the `System.Net.Http` assembly is loaded due to binding redirects in the Report Server's Web.config file.
3. An older version of the `System.Net.Http` assembly may exist in the Global Assembly Cache (GAC) and is being loaded by the Report Server.
4. .NET Framework 4.6.2 or newer is not installed on the machine.

## Solution

### Verify Standalone Report Designer Version
1. Open the Standalone Report Designer.
2. Check the version under the "Help" tab.
3. Ensure the version matches the Telerik Report Server version. If not, download and install the updated version.

### Update Binding Redirect in Web.config
1. Open the Web.config file located at: `C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\Web.config`.
2. Locate the `<dependentAssembly>` element for `System.Net.Http`.
3. Edit the `<bindingRedirect>` line to update `newVersion` to `4.2.0.0`. Example:
   ```xml
   <dependentAssembly>
       <assemblyIdentity name="System.Net.Http" publicKeyToken="b03f5f7f11d50a3a" culture="neutral"/>
       <bindingRedirect oldVersion="0.0.0.0-4.2.0.0" newVersion="4.2.0.0"/>
   </dependentAssembly>
   ```
4. Save the Web.config file (administrator permissions may be required).
5. Recycle the application pool and restart the website in IIS.

### Check and Update GAC Assembly Versions
1. Run the following command in Command Prompt to list versions of `System.Net.Http` in the GAC:
   ```cmd
   "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6 Tools\gacutil.exe" /l System.Net.Http
   ```
2. If multiple versions exist (e.g., 4.0.0.0 and 4.2.0.0), uninstall the older version using `gacutil.exe`:
   ```cmd
   "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6 Tools\gacutil.exe" /u System.Net.Http
   ```
3. Ensure .NET Framework 4.6.2 or newer is installed if the necessary assembly is missing.

### Verify Assembly in Report Server Bin Folder
1. Navigate to: `C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\bin`.
2. Locate `System.Net.Http.dll`.
3. Verify its version using a tool like [dotPeek](https://www.jetbrains.com/decompiler/).
4. If the version is 4.2.0.0, ensure the binding redirect in Web.config matches this version.

### Restart IIS Services
1. Run the following command in PowerShell or Command Prompt:
   ```cmd
   iisreset
   ```

### Generate Trace Logs for Further Issues
1. Enable trace listeners in both the Standalone Report Designer and Report Server.
2. Attempt to open the report while trace listeners are active.
3. Review newly generated logs for additional exceptions.

## See Also
- [Standalone Report Designer Problems Troubleshooting](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/standalone-report-designer-problems)  
- [Troubleshoot Report Server Manager](https://docs.telerik.com/report-server/knowledge-base/troubleshoot-report-server)  
- [AssemblyReferences Element](https://docs.telerik.com/reporting/doc-output/configure-the-report-engine/assemblyreferences-element)  
- [GACUTIL Tool](https://learn.microsoft.com/en-us/dotnet/framework/tools/gacutil-exe-gac-tool)  
- [Download .NET Framework 4.6.2](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net462)  
