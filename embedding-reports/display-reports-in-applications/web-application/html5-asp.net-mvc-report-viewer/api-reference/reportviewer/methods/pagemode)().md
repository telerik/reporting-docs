---
title: PageMode)()
page_title: The PageMode)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the PageMode)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/pagemode)()
tags: pagemode)
published: True
reportingArea: MVCWrapper
position: 13
---

# The `PageMode)()` method of the ASP.NET MVC Report Viewer

Specifies whether the viewer is in Continuous scroll or Single page mode. SinglePage - Displays only one report page in PageArea container ContinuousScroll - Displays large amount of report pages by appending additional pages on demand. <remarks>SinglePage shows only one report page at a time, while ContinuousScroll enables scrolling through multiple pages with progressive loading.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

@* Example: Set the viewer to ContinuousScroll PageMode *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PageMode(PageMode.ContinuousScroll)
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

