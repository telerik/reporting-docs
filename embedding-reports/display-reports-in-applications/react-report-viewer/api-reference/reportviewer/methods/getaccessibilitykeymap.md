---
title: getAccessibilityKeyMap
page_title: The getAccessibilityKeyMap method of the React Report Viewer explained
description: "Learn more about the getAccessibilityKeyMap method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymap
tags: getaccessibilitykeymap
published: True
reportingArea: React
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

    th {
        white-space: nowrap;
    }
</style>

# The `getAccessibilityKeyMap` method of the React Report Viewer

Gets the shortcut keys used when the report viewer is in accessible mode (enableAccessibility=true).

## Example

    ````JavaScript
// Get accessibility key mapconst keyMap = reportViewerRef.current.getAccessibilityKeyMap();if (keyMap) {  console.log("Accessibility key map:", keyMap);}
````
