---
title: dispose
page_title: The dispose method of the React Report Viewer explained
description: "Learn more about the dispose method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/dispose
tags: dispose
published: True
reportingArea: React
position: 19
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

# The `dispose` method of the React Report Viewer

Stops sending keep alive requests to the server, if keep client alive was enabled. Disposes the viewer instance, cleaning up resources and event handlers. Should be called when the component is unmounted or no longer needed.

## Example

````JavaScript
// Manually dispose the viewerreportViewerRef.current.dispose();
````
