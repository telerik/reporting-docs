---
title: setAccessibilityKeyMap
page_title: The setAccessibilityKeyMap method of the Angular Report Viewer explained
description: "Learn more about the setAccessibilityKeyMap method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setaccessibilitykeymap
tags: setaccessibilitykeymap
published: True
reportingArea: AngularWrapper
position: 12
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

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `setAccessibilityKeyMap` method of the Angular Report Viewer

Sets the shortcut keys used when the report viewer is in accessible mode.
Recommended to set when report rendering is complete.
The keys in the key map are:

- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)
- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')
- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')
- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')
- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| keyMap | `any` | No | JSON object with key mappings |

## Example

````typescript
viewer.setAccessibilityKeyMap({
  CONFIRM_KEY: 13,
  MENU_AREA_KEY: 77,
  CONTENT_AREA_KEY: 67
});
````

