---
title: ViewMode
page_title: ViewMode property
description: "Gets or sets the viewer's view mode. PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled. Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled. Interactive mode enables full report interactivity and navigation, while PrintPreview mode optimizes the display for print layout without interactive features."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/viewmode
published: True
reportingArea: WebForms
---

# The `ViewMode` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the viewer's view mode.

- PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.
- Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled.
- Interactive mode enables full report interactivity and navigation, while PrintPreview mode optimizes the display for print layout without interactive features.

## Type

[`Telerik.ReportViewer.Html5.WebForms.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/viewmode%})

## Examples

````XML
<!-- Example: Set the ViewMode property to PrintPreview to display the paginated report as if printed on paper -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer ViewMode Example</title>
</head>
<body>
    <form runat="server">
     <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ViewMode="PrintPreview">
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

* [ViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/viewmode%})


