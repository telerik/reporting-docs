---
title: print
page_title: print command
description: "Triggers the report printing."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/print
published: True
reportingArea: HTML5
---

# The `print` command of the HTML5 Report Viewer

Triggers the report printing.

## Example

````JavaScript
// Execute the print commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.print.exec();
````

````JavaScript
// Check if print is enabledif (rv.commands.print.enabled()) {}
````

````JavaScript
// Check if print is checkedif (rv.commands.print.checked()) {}
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
