---
title: accessibilityKeyMap
page_title: The accessibilityKeyMap method of the HTML5 Report Viewer explained
description: "Learn more about the accessibilityKeyMap method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap
tags: accessibilitykeymap
published: True
reportingArea: HTML5
position: 16
---

# The `accessibilityKeyMap` method of the HTML5 Report Viewer

Gets or sets the accessibility key map for keyboard navigation. Allows customization of keyboard shortcuts for accessibility features.

## Example

````JavaScript
// Get the current accessibility key mapvar viewer = $("#reportViewer1").data("telerik_ReportViewer");var keyMap = viewer.accessibilityKeyMap();
````

````JavaScript
// Set a custom accessibility key mapvar reportViewer = $("#reportViewer1").data("telerik_ReportViewer");reportViewer.accessibilityKeyMap({    CONFIRM_KEY: 32,    CONTENT_AREA_KEY: 82, //R    DOCUMENT_MAP_AREA_KEY: 77, //M    MENU_AREA_KEY: 85, //U    PARAMETERS_AREA_KEY: 80 //P});
````


