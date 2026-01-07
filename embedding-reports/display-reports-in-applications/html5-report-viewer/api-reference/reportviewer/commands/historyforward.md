---
title: historyForward
page_title: historyForward command
description: "Goes forward to the next rendered report from history."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/historyforward
published: True
reportingArea: HTML5
---

# The `historyForward` command of the HTML5 Report Viewer

Goes forward to the next rendered report from history.

## Example

````JavaScript
// Execute the historyForward command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.historyForward.exec();
````

````JavaScript
// Check if historyForward is enabled
if (rv.commands.historyForward.enabled()) {}
````

````JavaScript
// Check if historyForward is checked
if (rv.commands.historyForward.checked()) {}
````



