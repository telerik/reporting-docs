---
title: sendEmailEnd
page_title: sendEmailEnd event
description: "Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `handled` (boolean), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/sendemailend
published: True
reportingArea: React
---

# The `sendEmailEnd` event of the React Report Viewer

Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `handled` (boolean), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string)).

## Example

````JavaScript
// Send email end handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmailEnd={(e, args) => {
    args.format = "XLS";
    console.log("The exported report can be found at " + args.url);
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/overview%})
* [updateUi]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/updateui%})
* [viewerToolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/viewertooltipopening%})

