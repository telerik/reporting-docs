---
title: ready
page_title: ready event
description: "A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/ready
published: True
reportingArea: React
---

# The `ready` event of the React Report Viewer

A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations.

## Example

````JavaScript
// Ready callback<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  ready={() => console.log("Report viewer is ready")}/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

