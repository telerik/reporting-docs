---
title: Resolving "Invalid License" Issue during runtime in Telerik Reporting
description: Learn how to address the "Invalid license" issue in Telerik Reporting when reports display licensing errors at runtime.
type: how-to
page_title: Fixing License Errors in Telerik Reporting Runtime
slug: resolving-invalid-license-telerik-reporting
tags: telerik reporting, license, nuget, runtime, invalid license
res_type: kb
ticketid: 1688629
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
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

When generating reports (e.g., PDF, XLSX) in Telerik Reporting, the output may display an "Invalid license" message. This issue can occur even if a valid license is detected during the build phase, as indicated by the build output. However, the debug output during runtime shows the license check failing. The problem often arises when the `Telerik.Licensing` NuGet package is not directly referenced in the startup project of the application.

This knowledge base article also answers the following questions:
- Why does Telerik Reporting display "Invalid license" at runtime?
- How to resolve runtime licensing issues in Telerik Reporting?
- What causes valid licenses in build but invalid runtime behavior in Telerik Reporting?

## Solution

To resolve this issue, ensure the `Telerik.Licensing` NuGet package is directly referenced in the startup project of your application. Follow the steps below:

1. **Identify the Startup Project**: Determine which project serves as the entry point for your application. 

2. **Add `Telerik.Licensing` NuGet Package**: Navigate to the startup project and add the `Telerik.Licensing` NuGet package manually. You can do this using the NuGet Package Manager or the Package Manager Console.

   Example using Package Manager Console:
   ```bash
   Install-Package Telerik.Licensing -Version 1.6.5
   ```

3. **Clean and Rebuild the Solution**: Perform a clean build of your solution to ensure all dependencies are correctly resolved.

4. **Test the Application**: Run the application again and verify if the reports are correctly generated without displaying the "Invalid license" message.


---
