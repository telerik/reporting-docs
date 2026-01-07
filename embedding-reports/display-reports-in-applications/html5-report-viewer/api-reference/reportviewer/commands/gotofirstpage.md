---
title: goToFirstPage
page_title: goToFirstPage command
description: "Goes to the first page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/gotofirstpage
published: True
reportingArea: HTML5
---

# The `goToFirstPage` command of the HTML5 Report Viewer

Goes to the first page of the report.

## Example

````JavaScript
// Execute the goToFirstPage command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.goToFirstPage.exec();
````

````JavaScript
// Check if goToFirstPage is enabled
if (rv.commands.goToFirstPage.enabled()) {}
````

````JavaScript
// Check if goToFirstPage is checked
if (rv.commands.goToFirstPage.checked()) {}
````



