---
title: sendEmail
page_title: sendEmail property
description: "Configuration for the Send Email functionality. Available properties: - enabled (bool, required) - Indicates whether to show the Send Mail Message toolbar button. Default value: false; - from (string, optional) - E-mail address used for the MailMessage FROM value; - to (string, optional) - E-mail address used for the MailMessage TO value; - cc (string, optional) - E-mail address used for the MailMessage Carbon Copy value; - subject (string, optional) - A string used for the MailMessage Subject value; - body (string, optional) - Sentences used for the MailMessage Content value; - format (string, optional) - The preselected report document format."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/sendemail
published: True
reportingArea: AngularWrapper
---

# sendEmail

Configuration for the Send Email functionality.
Available properties:

- enabled (bool, required) - Indicates whether to show the Send Mail Message toolbar button. Default value: false;
- from (string, optional) - E-mail address used for the MailMessage FROM value;
- to (string, optional) - E-mail address used for the MailMessage TO value;
- cc (string, optional) - E-mail address used for the MailMessage Carbon Copy value;
- subject (string, optional) - A string used for the MailMessage Subject value;
- body (string, optional) - Sentences used for the MailMessage Content value;
- format (string, optional) - The preselected report document format.

## Type

`any`

## Examples

````html
<tr-viewer
  [sendEmail]="sendEmail">
</tr-viewer>
````

````typescript
sendEmail: any = {
  enabled: true,
  from: 'sender@company.com',
  to: 'recipient@company.com',
  cc: 'copy@company.com',
  subject: 'Report',
  body: 'Please find the report attached.',
  format: 'PDF'
}
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
