---
title: toggleSearchDialog
page_title: toggleSearchDialog command
description: "Shows or hides the search dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/togglesearchdialog
published: True
reportingArea: HTML5
---

# The `toggleSearchDialog` command of the HTML5 Report Viewer

Shows or hides the search dialog.

## Example

````JavaScript
// Execute the toggleSearchDialog command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleSearchDialog.exec();
````

````JavaScript
// Check if toggleSearchDialog is enabled
if (rv.commands.toggleSearchDialog.enabled()) {}
````

````JavaScript
// Check if toggleSearchDialog is checked
if (rv.commands.toggleSearchDialog.checked()) {}
````

## See Also

* [Commands Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/overview%})
* [toggleSendEmailDialog]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/togglesendemaildialog%})
* [toggleZoomMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/togglezoommode%})

