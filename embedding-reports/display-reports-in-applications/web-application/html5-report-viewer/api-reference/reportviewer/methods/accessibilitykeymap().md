---
title: accessibilityKeyMap()
page_title: accessibilityKeyMap() 
description: accessibilityKeyMap()
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap()
tags: accessibilitykeymap()
published: True
position: 1
previous_url: /html5-report-viewer-reportviewer-methods-accessibility-keymap
---

# accessibilityKeyMap()

Gets the current key shortcuts map, used when the report viewer is in accessible mode. 

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var map = reportViewer.accessibilityKeyMap();
````

The default values for the viewer's accessibility key map can be found in the [Methods Overview accessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%}#accessibility-key-map).
