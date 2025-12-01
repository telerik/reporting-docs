---
title: SendEmail)()
page_title: The SendEmail)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the SendEmail)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/sendemail)()
tags: sendemail)
published: True
reportingArea: MVCWrapper
position: 28
---

# The `SendEmail)()` method of the ASP.NET MVC Report Viewer

Configures the send email functionality options for the report viewer. <remarks>Enables users to email reports directly from the viewer interface with customizable email settings.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

@* Example demonstrating how to use the SendEmail method to enable the send email functionality on the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .SendEmail(new SendEmail { Enabled = true })
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

