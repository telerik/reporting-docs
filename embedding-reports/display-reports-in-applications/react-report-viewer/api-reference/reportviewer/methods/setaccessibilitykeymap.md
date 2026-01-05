---
title: setAccessibilityKeyMap
page_title: The setAccessibilityKeyMap method of the React Report Viewer explained
description: "Learn more about the setAccessibilityKeyMap method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setaccessibilitykeymap
tags: setaccessibilitykeymap
published: True
reportingArea: React
position: 12
---

# The `setAccessibilityKeyMap` method of the React Report Viewer

Sets the shortcut keys used when the report viewer is in accessible mode. It is recommended to set the new key map when the report rendering is complete, because the accessibility routines require the report viewer template to be loaded.

## Example

````JavaScript
// Set custom accessibility key mapreportViewerRef.current.setAccessibilityKeyMap({  CONFIRM_KEY: 13,  MENU_AREA_KEY: 77,  CONTENT_AREA_KEY: 67,  PARAMETERS_AREA_KEY: 80,  DOCUMENT_MAP_AREA_KEY: 68});
````


