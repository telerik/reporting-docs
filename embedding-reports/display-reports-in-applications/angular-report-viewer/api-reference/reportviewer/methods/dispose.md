---
title: dispose
page_title: The dispose method of the Angular Report Viewer explained
description: "Learn more about the dispose method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/dispose
tags: dispose
published: True
reportingArea: AngularWrapper
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `dispose` method of the Angular Report Viewer

Stops sending keep alive requests to the server and performs cleanup. Called automatically when the component is destroyed.

## Example

````typescript
viewer.dispose();
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/overview%})
* [getAccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymap%})
* [getPageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getpagemode%})

