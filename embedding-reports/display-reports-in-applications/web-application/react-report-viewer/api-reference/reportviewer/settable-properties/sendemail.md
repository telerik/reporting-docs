---
title: sendEmail
page_title: sendEmail property
description: "Configuration for the Send Mail Message feature."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/settable-properties/sendemail
published: True
reportingArea: React
---

# sendEmail

Configuration for the Send Mail Message feature.

## Type

`SendEmailOptions`

## Examples

````JavaScript
// Enable send email with default values<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  sendEmail={{    enabled: true,    from: "reports@company.com",    to: "recipient@domain.com",    subject: "Monthly Report",    format: "PDF"  }}/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
