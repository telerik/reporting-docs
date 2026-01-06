---
title: getScale
page_title: The getScale method of the Angular Report Viewer explained
description: "Learn more about the getScale method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getscale
tags: getscale
published: True
reportingArea: AngularWrapper
position: 6
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

# The `getScale` method of the Angular Report Viewer

Gets the viewer's scale factor and scale mode. Object with scale and scaleMode properties

## Example

````typescript
const scaleInfo = viewer.getScale();
console.log(scaleInfo.scale); // e.g., 1.0
console.log(scaleInfo.scaleMode); // e.g., "SPECIFIC"
````

