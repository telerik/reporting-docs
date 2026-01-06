---
title: PageReady
page_title: PageReady event
description: "Gets or sets the name of the JavaScript function that will be called every time a page from the report is rendered and ready for display. The page ready event is triggered when each individual report page completes rendering and is ready for display in the HTML5 viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/pageready
published: True
reportingArea: WebForms
---

# The `PageReady` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called every time a page from the report is rendered and ready for display. The page ready event is triggered when each individual report page completes rendering and is ready for display in the HTML5 viewer.

## Example

````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // This JavaScript function will be called every time a page is rendered and ready for display
        function onReportPageReady(sender, args) {
            // Custom logic can be added here
            // e.g. alert('A report page is ready!');
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Example of setting the PageReady client event property -->
        <telerik:ReportViewer 
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents PageReady="onReportPageReady" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

