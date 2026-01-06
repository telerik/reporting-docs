---
title: toggleParametersArea
page_title: toggleParametersArea command
description: "Shows or hides the parameters area."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/toggleparametersarea
published: True
reportingArea: HTML5
---

# The `toggleParametersArea` command of the HTML5 Report Viewer

Shows or hides the parameters area.

## Example

````JavaScript
// Execute the toggleParametersArea commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.toggleParametersArea.exec();
````

````JavaScript
// Check if toggleParametersArea is enabledif (rv.commands.toggleParametersArea.enabled()) {}
````

````JavaScript
// Check if toggleParametersArea is checkedif (rv.commands.toggleParametersArea.checked()) {}
````



