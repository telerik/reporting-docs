---
title: types.ScaleMode
page_title: types.ScaleMode Type
description: "Scale mode options for the Native Angular Report Viewer. The available scale modes are: - 'fitPageWidth': Pages are scaled proportionally to fit the entire width in the viewer's viewport. - 'fitPage': Pages are scaled proportionally to fit the entire page in the viewport. - 'specific': Pages are scaled with the specific scale value."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/scalemode
published: True
reportingArea: NativeAngular
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ScaleMode` type of the Native Angular Report Viewer

Scale mode options for the Native Angular Report Viewer.
The available scale modes are:

- 'fitPageWidth': Pages are scaled proportionally to fit the entire width in the viewer's viewport.
- 'fitPage': Pages are scaled proportionally to fit the entire page in the viewport.
- 'specific': Pages are scaled with the specific scale value.

## Type Definition

````typescript
type ScaleMode = "fitPageWidth" | "fitPage" | "specific";
````

