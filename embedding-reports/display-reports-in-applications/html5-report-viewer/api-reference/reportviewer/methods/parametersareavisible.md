---
title: parametersAreaVisible
page_title: The parametersAreaVisible method of the HTML5 Report Viewer explained
description: "Learn more about the parametersAreaVisible method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/parametersareavisible
tags: parametersareavisible
published: True
reportingArea: HTML5
position: 10
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `parametersAreaVisible` method of the HTML5 Report Viewer

Shows or hides the parameters area in the viewer UI.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| visible | `boolean` | No | True to show, false to hide the parameters area. |

## Example

````JavaScript
// Show the parameters areavar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.parametersAreaVisible(true);
````

````JavaScript
// Hide the parameters areavar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.parametersAreaVisible(false);
````

