---
title: ReportServer
page_title: ReportServer property
description: "Gets or sets the connection data of the report server that hosts the report. The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions. <remarks>Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment. Connecting to Telerik Report Server for .NET is not supported. For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/reportserver
published: True
reportingArea: WebFormsWrapper
---

# ReportServer

Gets or sets the connection data of the report server that hosts the report. The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions. <remarks>Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment. Connecting to Telerik Report Server for .NET is not supported. For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html.</remarks>

## Type

`Telerik.ReportViewer.Html5.Common.ReportServer`

## Examples

````JavaScript
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

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
