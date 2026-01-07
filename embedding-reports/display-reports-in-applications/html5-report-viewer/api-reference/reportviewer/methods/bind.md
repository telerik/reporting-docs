---
title: bind
page_title: The bind method of the HTML5 Report Viewer explained
description: "Learn more about the bind method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind
tags: bind
published: True
reportingArea: HTML5
position: 14
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `bind` method of the HTML5 Report Viewer

Binds event handlers to the specified event.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to bind to (see Events constants). |
| eventHandler | `function` | No | The handler function to invoke when the event occurs. |

## Example

````JavaScript
// Bind to the 'pageReady' event
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.bind(telerikReportViewer.Events.PAGE_READY, function(e, args) {
  console.log("Page is ready!", args);
});
````

````JavaScript
// Bind to the 'error' event
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.bind(telerikReportViewer.Events.ERROR, function(e, args) {
  alert("An error occurred: " + args);
});
````

