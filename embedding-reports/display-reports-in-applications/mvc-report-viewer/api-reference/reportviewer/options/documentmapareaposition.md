---
title: DocumentMapAreaPosition
page_title: DocumentMapAreaPosition property
description: "Specifies where the Document Map Area should be displayed. Right - Displays Document Map Area on the right of the page view. Left - Displays Document Map Area on the left of the page view. Controls the placement of the document map navigation panel for report bookmark and section navigation."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/documentmapareaposition
published: True
reportingArea: MVCWrapper
---

# The `DocumentMapAreaPosition` option of the HTML5 ASP.NET MVC Report Viewer

Specifies where the Document Map Area should be displayed.

- Right - Displays Document Map Area on the right of the page view.
- Left - Displays Document Map Area on the left of the page view.
- Controls the placement of the document map navigation panel for report bookmark and section navigation.

## Type

[`Telerik.ReportViewer.Mvc.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/documentmapareaposition%})

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!--
    Example: Set the Document Map Area to be displayed on the right side of the viewer.
-->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .DocumentMapAreaPosition(DocumentMapAreaPosition.Right)
)
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/overview%})
* [DocumentMapVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/documentmapvisible%})
* [EnableAccessibility]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/enableaccessibility%})
* [DocumentMapAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/documentmapareaposition%})

