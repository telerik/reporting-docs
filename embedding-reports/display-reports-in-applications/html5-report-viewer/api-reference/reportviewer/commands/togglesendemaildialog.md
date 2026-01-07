---
title: toggleSendEmailDialog
page_title: toggleSendEmailDialog command
description: "Shows or hides the send email dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/togglesendemaildialog
published: True
reportingArea: HTML5
---

# The `toggleSendEmailDialog` command of the HTML5 Report Viewer

Shows or hides the send email dialog.

## Example

````JavaScript
// Execute the toggleSendEmailDialog command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleSendEmailDialog.exec();
````

````JavaScript
// Check if toggleSendEmailDialog is enabled
if (rv.commands.toggleSendEmailDialog.enabled()) {}
````

````JavaScript
// Check if toggleSendEmailDialog is checked
if (rv.commands.toggleSendEmailDialog.checked()) {}
````

## See Also

* [Commands Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/overview%})
* [toggleZoomMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/togglezoommode%})
* [zoomIn]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/zoomin%})

