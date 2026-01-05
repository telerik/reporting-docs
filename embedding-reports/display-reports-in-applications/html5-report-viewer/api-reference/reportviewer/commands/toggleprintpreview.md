---
title: togglePrintPreview
page_title: togglePrintPreview command
description: "Toggles between Print Preview and Interactive view modes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/toggleprintpreview
published: True
reportingArea: HTML5
---

# The `togglePrintPreview` command of the HTML5 Report Viewer

Toggles between Print Preview and Interactive view modes.

## Example

````JavaScript
// Execute the togglePrintPreview commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.togglePrintPreview.exec();
````

````JavaScript
// Check if togglePrintPreview is enabledif (rv.commands.togglePrintPreview.enabled()) {}
````

````JavaScript
// Check if togglePrintPreview is checkedif (rv.commands.togglePrintPreview.checked()) {}
````

