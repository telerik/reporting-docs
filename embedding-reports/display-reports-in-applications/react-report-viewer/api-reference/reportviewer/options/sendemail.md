---
title: sendEmail
page_title: sendEmail property
description: "Configuration for the Send Mail Message feature."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/sendemail
published: True
reportingArea: React
---

# The `sendEmail` option of the React Report Viewer

Configuration for the Send Mail Message feature.

## Type

[`SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/sendemailoptions%})

## Examples

````JavaScript
// Enable send email with default values<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  sendEmail={{    enabled: true,    from: "reports@company.com",    to: "recipient@domain.com",    subject: "Monthly Report",    format: "PDF"  }}/>
````



