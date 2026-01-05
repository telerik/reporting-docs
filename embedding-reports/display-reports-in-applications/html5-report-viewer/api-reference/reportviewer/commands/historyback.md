---
title: historyBack
page_title: historyBack command
description: "Goes back to the previously rendered report from history."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/historyback
published: True
reportingArea: HTML5
---

# The `historyBack` command of the HTML5 Report Viewer

Goes back to the previously rendered report from history.

## Example

````JavaScript
// Execute the historyBack commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.historyBack.exec();
````

````JavaScript
// Check if historyBack is enabledvar rv = $("#reportViewer1").data("telerik_ReportViewer");if (rv.commands.historyBack.enabled()) { }
````

````JavaScript
// Check if historyBack is checkedvar rv = $("#reportViewer1").data("telerik_ReportViewer");if (rv.commands.historyBack.checked()) {}
````

