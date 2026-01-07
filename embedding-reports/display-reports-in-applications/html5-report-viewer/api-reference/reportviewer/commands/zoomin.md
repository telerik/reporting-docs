---
title: zoomIn
page_title: zoomIn command
description: "Zooms in the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/zoomin
published: True
reportingArea: HTML5
---

# The `zoomIn` command of the HTML5 Report Viewer

Zooms in the report.

## Example

````JavaScript
// Execute the zoomIn command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.zoomIn.exec();
````

````JavaScript
// Check if zoomIn is enabled
if (rv.commands.zoomIn.enabled()) {}
````

````JavaScript
// Check if zoomIn is checked
if (rv.commands.zoomIn.checked()) {}
````

## See Also

* [Commands Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/overview%})
* [zoomOut]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/zoomout%})
* [export]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/export%})

