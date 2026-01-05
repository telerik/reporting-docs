---
title: SendEmail
page_title: SendEmail property
description: "Configures the send email functionality options for the report viewer. Enables users to email reports directly from the viewer interface with customizable email settings."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/sendemail
published: True
reportingArea: MVCWrapper
---

# The `SendEmail` option of the HTML5 ASP.NET MVC Report Viewer

Configures the send email functionality options for the report viewer. Enables users to email reports directly from the viewer interface with customizable email settings.

## Type

[`Telerik.ReportViewer.Mvc.SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/sendemail%})

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example demonstrating how to use the SendEmail method to enable the send email functionality on the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .SendEmail(new SendEmail { Enabled = true })
)
````

## See Also

* [SendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/sendemail%})
