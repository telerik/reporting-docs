---
title: goToLastPage
page_title: goToLastPage command
description: "Goes to the last page of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/gotolastpage
published: True
reportingArea: HTML5
---

# The `goToLastPage` command of the HTML5 Report Viewer

Goes to the last page of the report.

## Example

````JavaScript
// Execute the goToLastPage commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.goToLastPage.exec();
````

````JavaScript
// Check if goToLastPage is enabledif (rv.commands.goToLastPage.enabled()) {}
````

````JavaScript
// Check if goToLastPage is checkedif (rv.commands.goToLastPage.checked()) {}
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
