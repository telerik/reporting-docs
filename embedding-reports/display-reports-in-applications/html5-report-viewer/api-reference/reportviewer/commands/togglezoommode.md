---
title: toggleZoomMode
page_title: toggleZoomMode command
description: "Changes the zoom mode of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/togglezoommode
published: True
reportingArea: HTML5
---

# The `toggleZoomMode` command of the HTML5 Report Viewer

Changes the zoom mode of the report.

## Example

````JavaScript
// Execute the toggleZoomMode commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.toggleZoomMode.exec();
````

````JavaScript
// Check if toggleZoomMode is enabledif (rv.commands.toggleZoomMode.enabled()) {}
````

````JavaScript
// Check if toggleZoomMode is checkedif (rv.commands.toggleZoomMode.checked()) {}
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
