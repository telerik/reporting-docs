---
title: goToNextPage
page_title: goToNextPage command
description: "Goes to the next page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/gotonextpage
published: True
reportingArea: HTML5
---

# The `goToNextPage` command of the HTML5 Report Viewer

Goes to the next page of the report.

## Example

````JavaScript
// Execute the goToNextPage commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.goToNextPage.exec();
````

````JavaScript
// Check if goToNextPage is enabledif (rv.commands.goToNextPage.enabled()) {}
````

````JavaScript
// Check if goToNextPage is checkedif (rv.commands.goToNextPage.checked()) {}
````



