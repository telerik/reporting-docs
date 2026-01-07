---
title: Ready
page_title: Ready event
description: "Gets or sets the name of the JavaScript function that will be called when the report viewer template is loaded. The ready event is triggered when the HTML5 ReportViewer template and UI components are fully loaded and initialized."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/ready
published: True
reportingArea: WebForms
---

# The `Ready` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the report viewer template is loaded. The ready event is triggered when the HTML5 ReportViewer template and UI components are fully loaded and initialized.

## Example

````XML
<!-- Example demonstrating how to set the ClientEvents.Ready property to specify a JavaScript function -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        function onReportViewerReady(e) {
            // This function will be called when the ReportViewer template is loaded
            alert("Report Viewer is ready!");
        }
    </script>
</head>
<body>
 <form runat="server">
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents Ready="onReportViewerReady" />
        </telerik:ReportViewer>
 </form>
</body>
</html>
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/overview%})
* [RenderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/renderingbegin%})
* [RenderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/renderingend%})

