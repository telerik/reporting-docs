---
title: SendEmail
page_title: SendEmail property
description: "Gets or sets the default send e-mail message options."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/settable-properties/sendemail
published: True
reportingArea: BlazorWrapper
---

# SendEmail

Gets or sets the default send e-mail message options.

## Type

`Telerik.ReportViewer.Blazor.SendEmailOptions`

## Examples

````JavaScript
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

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
