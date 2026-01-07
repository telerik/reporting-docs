---
title: getAccessibilityKeyMap
page_title: The getAccessibilityKeyMap method of the Angular Report Viewer explained
description: "Learn more about the getAccessibilityKeyMap method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymap
tags: getaccessibilitykeymap
published: True
reportingArea: AngularWrapper
position: 11
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

# The `getAccessibilityKeyMap` method of the Angular Report Viewer

Gets the shortcut keys used when the report viewer is in accessible mode.
The keys in the key map are:

- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)
- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')
- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')
- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')
- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')
JSON object containing accessibility key mappings

## Example

````typescript
const keyMap = viewer.getAccessibilityKeyMap();
console.log(keyMap.CONFIRM_KEY); // Default: 13 (Enter)
console.log(keyMap.MENU_AREA_KEY); // Default: 77 ('m')
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/overview%})
* [getPageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getpagemode%})
* [getReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getreportparameters%})

