---
title: goToPrevPage
page_title: goToPrevPage command
description: "Goes to the previous page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/gotoprevpage
published: True
reportingArea: HTML5
---

# The `goToPrevPage` command of the HTML5 Report Viewer

Goes to the previous page of the report.

## Example

````JavaScript
// Execute the goToPrevPage commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.goToPrevPage.exec();
````

````JavaScript
// Check if goToPrevPage is enabledif (rv.commands.goToPrevPage.enabled()) {}
````

````JavaScript
// Check if goToPrevPage is checkedif (rv.commands.goToPrevPage.checked()) {}
````



