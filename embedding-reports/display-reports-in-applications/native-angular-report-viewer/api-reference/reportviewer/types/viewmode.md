---
title: types.ViewMode
page_title: types.ViewMode Type
description: "View mode options for the Native Angular Report Viewer. The available view modes are: - 'interactive': A logical layout that removes strict restrictions for report pagination by utilizing a simpler paging algorithm. Enables drill-down interactivity, etc. - 'printPreview': A physical layout in which the report is paged strictly according to its page settings."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/viewmode
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

# The `ViewMode` type of the Native Angular Report Viewer

View mode options for the Native Angular Report Viewer.
The available view modes are:

- 'interactive': A logical layout that removes strict restrictions for report pagination by utilizing a simpler paging algorithm. Enables drill-down interactivity, etc.
- 'printPreview': A physical layout in which the report is paged strictly according to its page settings.

## Type Definition

````typescript
type ViewMode = "interactive" | "printPreview";
````

