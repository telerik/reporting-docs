---
title: refresh
page_title: refresh command
description: "Refreshes the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/refresh
published: True
reportingArea: HTML5
---

# The `refresh` command of the HTML5 Report Viewer

Refreshes the report.

## Example

````JavaScript
// Execute the refresh command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.refresh.exec();
````

````JavaScript
// Check if refresh is enabled
if (rv.commands.refresh.enabled()) {}
````

````JavaScript
// Check if refresh is checked
if (rv.commands.refresh.checked()) {}
````

## See Also

* [Commands Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/overview%})
* [stopRendering]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/stoprendering%})
* [toggleAiPromptDialog]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/toggleaipromptdialog%})

