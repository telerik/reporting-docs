---
title: Export Dropdown Options Missing After Upgrade to Version 20.3.26.1110
description: "Learn how to resolve the issue of a missing export dropdown in Telerik Reporting with ReportViewer.Blazor after upgrading to version 20.3.26.1110."
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

The export dropdown options in the Blazor Report Viewers do not populate after upgrading to version 20.3.26.1110. This happens due to an issue with SignalR, where the default message size limit of **32 KB** is exceeded, causing the circuit to drop.

## Cause

The issue occurs because SignalR has a default maximum message size of **32 KB**, while the [Get Document Info](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-info) request may exceed that size due to all the information about the export settings that it may contain.

## Error Message

```text
InvalidDataException: The maximum message size of 32768B was exceeded
```

## Solution

Increase SignalR's maximum message size to allow larger messages from the native report viewer. Follow these steps:

1. Open the `Startup.cs` or `Program.cs` file in your Blazor project.
2. Increase the maximum message size by setting the `MaximumReceiveMessageSize` property.

   Example configuration:

   ```C#
    builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents()
    .AddHubOptions(options =>
    {
        // The default 32 KB limit disconnects the circuit when the viewer sends large DocumentInfo payloads on multi-page reports.
        options.MaximumReceiveMessageSize = 4 * 1024 * 1024;
    });
   ```

3. Save the changes and restart the application.

## See Also

- [SignalR Configuration Options](https://learn.microsoft.com/en-us/aspnet/core/signalr/configuration)
