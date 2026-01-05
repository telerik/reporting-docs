---
title: zoomOut
page_title: zoomOut command
description: "Zooms out the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/zoomout
published: True
reportingArea: HTML5
---

# The `zoomOut` command of the HTML5 Report Viewer

Zooms out the report.

## Example

````JavaScript
// Execute the zoomOut commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.zoomOut.exec();
````

````JavaScript
// Check if zoomOut is enabledif (rv.commands.zoomOut.enabled()) {}
````

````JavaScript
// Check if zoomOut is checkedif (rv.commands.zoomOut.checked()) {}
````

