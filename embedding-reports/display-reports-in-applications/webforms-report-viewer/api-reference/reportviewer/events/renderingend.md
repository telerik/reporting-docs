---
title: RenderingEnd
page_title: RenderingEnd event
description: "Gets or sets the name of the JavaScript function that will be called when the rendering of the report ends. The rendering end event is triggered when the HTML5 ReportViewer completes processing and rendering the report content."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/renderingend
published: True
reportingArea: WebForms
---

# The `RenderingEnd` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the rendering of the report ends. The rendering end event is triggered when the HTML5 ReportViewer completes processing and rendering the report content.

## Example

````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RenderingEnd Event Example</title>
    <script type="text/javascript">
        // This function will be called when the report rendering ends
        function onRenderingEnd(e) {
            alert('Report rendering completed.');
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Example of using ClientEvents.RenderingEnd property -->
        <telerik:ReportViewer 
            ID="reportViewer1" 
            runat="server" 
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents RenderingEnd="onRenderingEnd" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/overview%})
* [UpdateUi]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/updateui%})
* [ViewerToolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/viewertooltipopening%})

