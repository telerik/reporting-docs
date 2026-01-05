---
title: ScaleMode
page_title: ScaleMode property
description: "Gets or sets the scale mode of the viewer. Three modes exist currently: FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height. FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match. Specific - Uses the scale to zoom in and out the report. Controls automatic report scaling behavior including FitPage for complete page visibility, FitPageWidth for width-based scaling, and Specific for custom scale values."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/scalemode
published: True
reportingArea: WebForms
---

# The `ScaleMode` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom in and out the report.
- Controls automatic report scaling behavior including FitPage for complete page visibility, FitPageWidth for width-based scaling, and Specific for custom scale values.

## Type

[`Telerik.ReportViewer.Html5.WebForms.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/scalemode%})

## Examples

````XML
<!-- Example demonstrating how to set the ScaleMode property of Telerik.ReportViewer.Html5.WebForms.ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set ScaleMode Example</title>
    <script src="/api/reports/resources/js/telerikReportViewer-kendo"></script>
</head>
<body>
    <form runat="server">
        <!-- Set ScaleMode of the ReportViewer to FitPageWidth -->
      <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ScaleMode="FitPageWidth">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
* [ScaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/scalemode%})
