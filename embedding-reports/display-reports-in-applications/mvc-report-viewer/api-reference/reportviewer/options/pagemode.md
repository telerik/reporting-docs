---
title: PageMode
page_title: PageMode property
description: "Specifies whether the viewer is in Continuous scroll or Single page mode. SinglePage - Displays only one report page in PageArea container ContinuousScroll - Displays large amount of report pages by appending additional pages on demand. SinglePage shows only one report page at a time, while ContinuousScroll enables scrolling through multiple pages with progressive loading."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/pagemode
published: True
reportingArea: MVCWrapper
---

# The `PageMode` option of the HTML5 ASP.NET MVC Report Viewer

Specifies whether the viewer is in Continuous scroll or Single page mode.

- SinglePage - Displays only one report page in PageArea container
- ContinuousScroll - Displays large amount of report pages by appending additional pages on demand.
- SinglePage shows only one report page at a time, while ContinuousScroll enables scrolling through multiple pages with progressive loading.

## Type

[`Telerik.ReportViewer.Mvc.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/pagemode%})

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set the viewer to ContinuousScroll PageMode *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PageMode(PageMode.ContinuousScroll)
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
* [PageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/pagemode%})
