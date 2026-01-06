---
title: ViewerToolTipOpening
page_title: ViewerToolTipOpening event
description: "Gets or sets the name of the JavaScript function that will be called when a tooltip is being opened. The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls in the HTML5 viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/viewertooltipopening
published: True
reportingArea: WebForms
---

# The `ViewerToolTipOpening` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when a tooltip is being opened. The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls in the HTML5 viewer.

## Example

    ````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // Example JS function for ViewerToolTipOpening client event
        function onViewerToolTipOpening(e, args) {
            // Custom tooltip opening logic
            alert("Tooltip is opening!");
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Example: Set ViewerToolTipOpening to a JS function name -->
<telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents ViewerToolTipOpening="onViewerToolTipOpening" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


