---
title: accessibilityKeyMap(keyMap)
page_title: The accessibilityKeyMap(keyMap) method of the HTML5 Report Viewer
description: "Learn more about the accessibilityKeyMap(keyMap) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap(keymap)
tags: accessibilitykeymap(keymap)
published: True
position: 2
previous_url: /html5-report-viewer-reportviewer-methods-accessibility-keymap-km
---

# The `accessibilityKeyMap(keyMap)` method of the HTML5 Report Viewer

Sets the current key shortcuts map, used when the report viewer is in accessible mode.

````JavaScript
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

The default values for the viewer's accessibility keymap can be found in the [Methods Overview accessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%}#accessibility-key-map).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
