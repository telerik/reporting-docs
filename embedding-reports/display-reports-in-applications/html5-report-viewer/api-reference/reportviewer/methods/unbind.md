---
title: unbind
page_title: The unbind method of the HTML5 Report Viewer explained
description: "Learn more about the unbind method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind
tags: unbind
published: True
reportingArea: HTML5
position: 15
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

# The `unbind` method of the HTML5 Report Viewer

Unbinds an event handler from a viewer event.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind from. |
| eventHandler | `function` | Yes | The handler function to remove. If omitted, all handlers for the event are removed. |

## Example

````JavaScript
// Unbind all handlers from the 'error' event
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.unbind(telerikReportViewer.Events.ERROR);
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%})
* [viewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode%})
* [accessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap%})

