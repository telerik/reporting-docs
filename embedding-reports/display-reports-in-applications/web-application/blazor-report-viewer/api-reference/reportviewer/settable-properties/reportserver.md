---
title: ReportServer
page_title: ReportServer property
description: "Gets or sets the connection data of the report server that hosts the reports. When a Report Server connection is used, the ServiceUrl property should not be set. For more information see http://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/settable-properties/reportserver
published: True
reportingArea: BlazorWrapper
---

# ReportServer

Gets or sets the connection data of the report server that hosts the reports. When a Report Server connection is used, the ServiceUrl property should not be set. For more information see http://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html.

## Type

`Telerik.ReportViewer.Blazor.ReportServerOptions`

## Examples

````JavaScript
@* Report Server for .NET - Token authentication (recommended) *@
<ReportViewer ReportServer="@(new ReportServerOptions
              {
                  Url = "https://yourReportServerUrl:port",
                  GetPersonalAccessToken = "trvCallbacks.getPersonalAccessToken"
              })" />

<script>
    window.trvCallbacks = {
        getPersonalAccessToken: function () {
            return Promise.resolve('<personal-access-token>');
        }
    }
</script>

@* Report Server Username/password authentication (both servers) *@
<ReportViewer ReportServer="@(new ReportServerOptions
              {
                  Url = "https://yourReportServerUrl:port",
                  Username = "myUsername",
                  Password = "myPassword"
              })" />

@* Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server) *@
<ReportViewer ReportServer="@(new ReportServerOptions
              {
                  Url = "https://demos.telerik.com/report-server/"
              })" />
````

## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
