```markdown
---
title: Export Dropdown Options Missing in Telerik Reporting After Upgrade to Version 20.3.26.1110
description: Resolve the issue of a missing export dropdown in Telerik Reporting with ReportViewer.Blazor after upgrading to version 20.3.26.1110.
type: troubleshooting
page_title: Missing Export Dropdown in Telerik Reporting ReportViewer.Blazor
meta_title: Missing Export Dropdown in Telerik Reporting ReportViewer.Blazor
slug: export-dropdown-missing-reportviewer-blazor
tags: reporting, reportviewer, blazor, export-dropdown, signalr, configuration
res_type: kb
ticketid: 1720742
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>20.3.26.1110</td>
</tr>
</tbody>
</table>

## Description

The export dropdown options in the Telerik Reporting [Report Viewer for Blazor](https://docs.telerik.com/reporting/html5-blazor-report-viewer) do not populate after upgrading to version 20.3.26.1110. This happens due to an issue with SignalR, where the default message size limit of 32 KB is exceeded, causing the circuit to drop. Consequently, the `/api/reports/formats` endpoint is not called, and the dropdown remains empty. Additionally, `InvalidDataException: The maximum message size of 32768B was exceeded` and `JSDisconnectedException` errors may appear in the logs.

## Cause

The issue occurs because SignalR has a default maximum message size of 32 KB. If the native report viewer sends a message larger than this limit, SignalR terminates the connection, preventing the report viewer from completing initialization.

## Solution

Increase SignalR's maximum message size to allow larger messages from the native report viewer. Follow these steps:

1. Open the `Startup.cs` or `Program.cs` file in your Blazor project.
2. Locate the `AddSignalR` configuration under `services`.
3. Increase the maximum message size by setting the `MaximumReceiveMessageSize` property.

   Example configuration:

   ```csharp
   services.AddSignalR(options =>
   {
       options.MaximumReceiveMessageSize = 65536; // Set to 64 KB or a suitable value
   });
   ```

4. Save the changes and restart the application.

## See Also

- [Report Viewer for Blazor - Documentation](https://docs.telerik.com/reporting/html5-blazor-report-viewer) 
- [SignalR Configuration Options](https://learn.microsoft.com/en-us/aspnet/core/signalr/configuration?view=aspnetcore-6.0)
- [Troubleshooting Export Features in Telerik Reporting](https://docs.telerik.com/reporting/overview)
```
