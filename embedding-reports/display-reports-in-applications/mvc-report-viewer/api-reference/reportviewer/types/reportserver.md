---
title: Telerik.ReportViewer.Mvc.ReportServer
page_title: Telerik.ReportViewer.Mvc.ReportServer Type
description: "Provides configuration data for connecting to a Telerik Report Server instance from the MVC Report Viewer. Used to establish authenticated connections to Report Server for centralized report management and deployment scenarios. Connecting to Telerik Report Server for .NET is not supported. Contains connection details including server URL and authentication credentials for Report Server integration."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/reportserver
published: True
reportingArea: MVCWrapper
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

# The `ReportServer` type of the HTML5 ASP.NET MVC Report Viewer

Provides configuration data for connecting to a Telerik Report Server instance from the MVC Report Viewer. Used to establish authenticated connections to Report Server for centralized report management and deployment scenarios. Connecting to Telerik Report Server for .NET is not supported. Contains connection details including server URL and authentication credentials for Report Server integration.

## Constructors

| Constructor | Description |
| ------ | ------ |
| ReportServer() | Initializes a new instance of the ReportServer class with default settings. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Password | `System.String` | Gets or sets the password associated with the specified username for Report Server authentication.<br>Required when Username is specified for authenticated access to protected reports and resources. |
| Url | `System.String` | Gets or sets the URL of the Telerik Report Server instance.<br>Must be a complete URL including protocol (http/https) pointing to the Report Server installation. |
| Username | `System.String` | Gets or sets a valid username that exists in Report Server registered users, or null/empty to use the built-in Guest account.<br>When empty, uses the Guest account which requires appropriate server permissions for accessing reports. |

## Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example usage of the ReportServer class to configure the MVC Report Viewer for Telerik Report Server integration
    var reportServer = new ReportServer
    {
        Url = "http://report-server-host:83",
        Username = "admin",
        Password = "adminpass"
    };
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1") 
    // Use ReportServer connection configuration instead of REST service
    .ReportServer(reportServer)
    // For Report Server, set the report path (e.g., "[Category]/[ReportName]"). Example shown with placeholder value.
    .ReportSource("Samples/Dashboard")
)
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/overview%})
* [AccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/accessibilitykeymap%})
* [AuthenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/authenticationtoken%})
* [CheckedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})

