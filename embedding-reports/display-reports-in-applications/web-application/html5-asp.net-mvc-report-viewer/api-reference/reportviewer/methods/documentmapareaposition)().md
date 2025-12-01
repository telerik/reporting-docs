---
title: DocumentMapAreaPosition)()
page_title: The DocumentMapAreaPosition)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the DocumentMapAreaPosition)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/documentmapareaposition)()
tags: documentmapareaposition)
published: True
reportingArea: MVCWrapper
position: 7
---

# The `DocumentMapAreaPosition)()` method of the ASP.NET MVC Report Viewer

Specifies where the Document Map Area should be displayed. Right - Displays Document Map Area on the right of the page view. Left - Displays Document Map Area on the left of the page view. <remarks>Controls the placement of the document map navigation panel for report bookmark and section navigation.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
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

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

