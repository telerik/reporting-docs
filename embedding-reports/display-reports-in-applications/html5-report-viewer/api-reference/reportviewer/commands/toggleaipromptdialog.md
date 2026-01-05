---
title: toggleAiPromptDialog
page_title: toggleAiPromptDialog command
description: "Shows or hides the AI prompt dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/toggleaipromptdialog
published: True
reportingArea: HTML5
---

# The `toggleAiPromptDialog` command of the HTML5 Report Viewer

Shows or hides the AI prompt dialog.

## Example

````JavaScript
// Execute the toggleAiPromptDialog commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.toggleAiPromptDialog.exec();
````

````JavaScript
// Check if toggleAiPromptDialog is enabledif (rv.commands.toggleAiPromptDialog.enabled()) {}
````

````JavaScript
// Check if toggleAiPromptDialog is checkedif (rv.commands.toggleAiPromptDialog.checked()) {}
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
