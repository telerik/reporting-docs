---
title: Telerik.ReportViewer.Blazor.ReportServerOptions
page_title: Telerik.ReportViewer.Blazor.ReportServerOptions Type
description: "Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportserveroptions
published: True
reportingArea: BlazorWrapper
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ReportServerOptions` type of the Blazor Report Viewer

Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetPersonalAccessToken | `System.String` | Gets or sets the callback function name that returns the Token for authentication wrapped in a Promise(Only RS.NET).<br>Report Server for .NET only. Recommended authentication method.<br>The token can be from any user, including the Guest user.<br>Optional. |
| Password | `System.String` | Gets or sets the password for the provided username.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.<br>Optional. |
| Url | `System.String` | Gets or sets the URL to the Report Server instance.<br>Required for both Report Server for .NET and Report Server for .NET Framework 4.6.2. |
| Username | `System.String` | Gets or sets a registered username in the Report Server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.<br>Optional. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/events/bindasync%})
* [ClearReportSourceAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/clearreportsourceasync%})
* [GetAccessibilityKeyMapAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/getaccessibilitykeymapasync%})

