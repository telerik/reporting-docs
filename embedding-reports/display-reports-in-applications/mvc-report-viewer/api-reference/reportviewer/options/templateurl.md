---
title: TemplateUrl
page_title: TemplateUrl property
description: "Sets the URL for the custom report viewer template that defines the viewer's UI structure and appearance. Allows customization of the viewer interface by providing a custom template with modified functionality or styling."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/templateurl
published: True
reportingArea: MVCWrapper
---

# The `TemplateUrl` option of the HTML5 ASP.NET MVC Report Viewer

Sets the URL for the custom report viewer template that defines the viewer's UI structure and appearance. Allows customization of the viewer interface by providing a custom template with modified functionality or styling.

## Type

`System.String`

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@* Example demonstrating setting a custom template URL for the HTML5 Report Viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/customTemplate.html")
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
