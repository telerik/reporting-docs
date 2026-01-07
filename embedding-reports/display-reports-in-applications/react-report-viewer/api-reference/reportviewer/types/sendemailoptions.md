---
title: SendEmailOptions
page_title: SendEmailOptions Type
description: "Configuration options for the Send Email feature in the Report Viewer. Allows customization of the email dialog, default values, and available document formats when sending a report via email."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/sendemailoptions
published: True
reportingArea: React
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `SendEmailOptions` type of the React Report Viewer

Configuration options for the Send Email feature in the Report Viewer. Allows customization of the email dialog, default values, and available document formats when sending a report via email.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| enabled | `boolean` | Indicates whether to show the Send Mail Message toolbar button. Default value: false. |
| from | `string` | E-mail address used for the MailMessage FROM value. |
| to | `string` | E-mail address used for the MailMessage TO value. |
| cc | `string` | E-mail address used for the MailMessage Carbon Copy value. |
| subject | `string` | A string used for the MailMessage Subject value. |
| body | `string` | Sentences used for the MailMessage Content value. |
| format | `string` | The preselected report document format. |

## Example

````JavaScript
// Enable Send Email with default values and PDF as the default format
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmail={{
    enabled: true,
    from: "reports@company.com",
    to: "recipient@domain.com",
    cc: "manager@domain.com",
    subject: "Monthly Sales Report",
    body: "Please find the attached monthly sales report.",
    format: "PDF"
  }}
/>
````

````JavaScript
// Basic email configuration with minimal options
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmail={{
    enabled: true,
    from: "noreply@company.com"
  }}
/>
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/overview%})
* [sendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/sendemail%})

