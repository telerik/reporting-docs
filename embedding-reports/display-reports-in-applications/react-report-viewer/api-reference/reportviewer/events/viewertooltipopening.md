---
title: viewerToolTipOpening
page_title: viewerToolTipOpening event
description: "Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/viewertooltipopening
published: True
reportingArea: React
---

# The `viewerToolTipOpening` event of the React Report Viewer

Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip)).

## Example

````JavaScript
// Viewer tooltip opening handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  viewerToolTipOpening={(e, args) => {
    // Example: disable tooltip if title contains '2004'
    args.cancel = (/2004/i.test(args.toolTip.title));
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



