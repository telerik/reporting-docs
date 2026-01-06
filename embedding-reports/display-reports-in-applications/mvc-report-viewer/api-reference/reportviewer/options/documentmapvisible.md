---
title: DocumentMapVisible
page_title: DocumentMapVisible property
description: "Sets the initial visibility state of the viewer's document map. Controls whether the document map navigation panel is visible when the viewer first loads. The document map is shown only if the report contains bookmarks. The document map works both in the interactive and print preview view modes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/documentmapvisible
published: True
reportingArea: MVCWrapper
---

# The `DocumentMapVisible` option of the HTML5 ASP.NET MVC Report Viewer

Sets the initial visibility state of the viewer's document map. Controls whether the document map navigation panel is visible when the viewer first loads. The document map is shown only if the report contains bookmarks. The document map works both in the interactive and print preview view modes.

## Type

`System.Boolean`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set the document map to be initially visible in the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .DocumentMapVisible(true)
)
````



