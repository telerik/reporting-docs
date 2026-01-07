---
title: stopRendering
page_title: stopRendering command
description: "Stops the rendering of the current report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/stoprendering
published: True
reportingArea: HTML5
---

# The `stopRendering` command of the HTML5 Report Viewer

Stops the rendering of the current report.

## Example

````JavaScript
// Execute the stopRendering command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.stopRendering.exec();
````

````JavaScript
// Check if stopRendering is enabled
if (rv.commands.stopRendering.enabled()) {}
````

````JavaScript
// Check if stopRendering is checked
if (rv.commands.stopRendering.checked()) {}
````



