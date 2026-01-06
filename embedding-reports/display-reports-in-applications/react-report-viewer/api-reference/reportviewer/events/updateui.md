---
title: updateUi
page_title: updateUi event
description: "Called when the state of the viewer changes. Receives one parameter: `e` (the event object)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/updateui
published: True
reportingArea: React
---

# The `updateUi` event of the React Report Viewer

Called when the state of the viewer changes. Receives one parameter: `e` (the event object).

## Example

    ````JavaScript
// Update UI handler<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  updateUi={(e) => {    console.log("Viewer UI state changed.");  }}/>
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

