---
title: sendEmail
page_title: sendEmail property
description: "Email sending options. Properties: enabled (bool), from (string), to (string), cc (string), subject (string), body (string), format (string)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/sendemail
published: True
reportingArea: HTML5
---

# The `sendEmail` option of the HTML5 Report Viewer

Email sending options. Properties: enabled (bool), from (string), to (string), cc (string), subject (string), body (string), format (string).

## Type

[`SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/sendemail%})

## Examples

````JavaScript
// Enable send email with default values
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Email sending options
  sendEmail: { enabled: true, from: "me@company.com", to: "you@company.com" }
});
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/overview%})
* [serviceUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/serviceurl%})
* [templateUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/templateurl%})

