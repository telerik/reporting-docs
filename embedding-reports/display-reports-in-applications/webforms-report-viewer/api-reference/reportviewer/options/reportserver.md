---
title: ReportServer
page_title: ReportServer property
description: "Gets or sets the connection data of the report server that hosts the report. The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions. Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment. Connecting to Telerik Report Server for .NET is not supported. For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/reportserver
published: True
reportingArea: WebForms
---

# The `ReportServer` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the connection data of the report server that hosts the report. The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions. Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment. Connecting to Telerik Report Server for .NET is not supported. For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html.

## Type

[`Telerik.ReportViewer.Html5.Common.ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportserver%})

## Examples

````XML
<%-- Example: Setting the ReportServer property for Telerik HTML5 Web Forms Report Viewer --%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer - ReportServer Property Example</title>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer ID="reportViewer1" runat="server" ServiceUrl="/api/reports">
            <ReportServer Password="" Url="" Username="" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [ReportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportserver%})


