---
title: export
page_title: export command
description: "Exports the report, using the respective rendering extension name."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/export
published: True
reportingArea: HTML5
---

# The `export` command of the HTML5 Report Viewer

Exports the report, using the respective rendering extension name.

## Example

````JavaScript
// Execute the export command as PDFvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.export.exec("PDF");
````

````JavaScript
// Check if export is enabledif (rv.commands.export.enabled()) {}
````

````JavaScript
// Check if export is checkedif (rv.commands.export.checked()) {}
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
