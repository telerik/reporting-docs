---
title: types.PageMode
page_title: types.PageMode Type
description: "Page display mode options for the Native Angular Report Viewer. The available page modes are: - 'continuousScroll': Pages are displayed in a continuous scroll mode, allowing users to scroll through the report without page breaks. - 'singlePage': Pages are displayed one at a time, with each page taking up the full viewport."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/pagemode
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

# The `PageMode` type of the Native Angular Report Viewer

Page display mode options for the Native Angular Report Viewer.
The available page modes are:

- 'continuousScroll': Pages are displayed in a continuous scroll mode, allowing users to scroll through the report without page breaks.
- 'singlePage': Pages are displayed one at a time, with each page taking up the full viewport.

## Type Definition

````typescript
type PageMode = "continuousScroll" | "singlePage";
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/overview%})
* [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/pagemode%})

