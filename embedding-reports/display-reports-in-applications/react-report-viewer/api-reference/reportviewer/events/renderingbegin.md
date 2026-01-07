---
title: renderingBegin
page_title: renderingBegin event
description: "Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the event object) and `args` (an object with property: `deviceInfo` (object))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/renderingbegin
published: True
reportingArea: React
---

# The `renderingBegin` event of the React Report Viewer

Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the event object) and `args` (an object with property: `deviceInfo` (object)).

## Example

````JavaScript
// Rendering begin handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  renderingBegin={(e, args) => {
    // The deviceInfo property can be used to pass a specific culture to the REST Service so it renders the report with it.
    const culture = "yourCulture";
    args.deviceInfo["CurrentCulture"] = culture;
    args.deviceInfo["CurrentUICulture"] = culture;
    console.log("About to render the report.");
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/overview%})
* [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/renderingend%})
* [sendEmailBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/sendemailbegin%})

