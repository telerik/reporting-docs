---
title: SendEmail
page_title: SendEmail property
description: "Gets or sets the default send e-mail message options."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/sendemail
published: True
reportingArea: BlazorWrapper
---

# The `SendEmail` option of the Blazor Report Viewer

Gets or sets the default send e-mail message options.

## Type

[`Telerik.ReportViewer.Blazor.SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/sendemailoptions%})

## Examples

````C#
<ReportViewer SendEmail="@(new SendEmailOptions
              {
                  Enabled = true,
                  From = "sender@company.com",
                  To = "recipient@company.com",
                  Subject = "Monthly Report",
                  Body = "Please find the attached report.",
                  Format = "PDF"
              })" />
````

## See Also

* [SendEmailOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/sendemailoptions%})
