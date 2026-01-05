---
title: ServiceUrl
page_title: ServiceUrl property
description: "Gets or sets the URL of the service which will provide the report viewer with reports. The service must be properly configured so that the report viewer can successfully communicate with the server. For more information on how to configure the service please check https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/serviceurl
published: True
reportingArea: WebForms
---

# The `ServiceUrl` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the URL of the service which will provide the report viewer with reports. The service must be properly configured so that the report viewer can successfully communicate with the server. For more information on how to configure the service please check https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview.

## Type

`System.String`

## Examples

````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set ServiceUrl Example</title>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer 
            ID="reportViewer1" 
            runat="server"
            ServiceUrl="/api/reports">
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
