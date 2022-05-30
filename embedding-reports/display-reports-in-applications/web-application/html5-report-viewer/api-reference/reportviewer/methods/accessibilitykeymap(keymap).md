---
title: accessibilityKeyMap(keyMap)
page_title: accessibilityKeyMap(keyMap) 
description: accessibilityKeyMap(keyMap)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap(keymap)
tags: accessibilitykeymap(keymap)
published: True
position: 2
---

# accessibilityKeyMap(keyMap)

Sets the current key shortcuts map, used when the report viewer is in accessible mode. 

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.accessibilityKeyMap(
{
    CONFIRM_KEY: 32,
    CONTENT_AREA_KEY: 82, //R
    DOCUMENT_MAP_AREA_KEY: 77, //M
    MENU_AREA_KEY: 85, //U
    PARAMETERS_AREA_KEY: 80 //P
});
````

The default values for the viewer's accessibility key map can be found in the [Methods Overview accessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%}#accessibility-key-map).
