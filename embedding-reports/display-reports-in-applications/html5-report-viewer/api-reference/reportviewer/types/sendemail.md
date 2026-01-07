---
title: SendEmail
page_title: SendEmail Type
description: "Configuration options for the Send Email feature in the Report Viewer. Allows customization of the email dialog, default values, and available document formats when sending a report via email."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/sendemail
published: True
reportingArea: HTML5
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

# The `SendEmail` type of the HTML5 Report Viewer

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
var sendEmailOptions = {
  enabled: true,
  from: "reports@company.com",
  to: "recipient@domain.com",
  cc: "manager@domain.com",
  subject: "Monthly Sales Report",
  body: "Please find the attached monthly sales report.",
  format: "PDF"
};
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/overview%})
* [sendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/sendemail%})

