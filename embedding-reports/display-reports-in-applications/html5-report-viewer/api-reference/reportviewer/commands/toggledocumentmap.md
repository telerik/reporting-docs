---
title: toggleDocumentMap
page_title: toggleDocumentMap command
description: "Shows or hides the document map."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands/toggledocumentmap
published: True
reportingArea: HTML5
---

# The `toggleDocumentMap` command of the HTML5 Report Viewer

Shows or hides the document map.

## Example

````JavaScript
// Execute the toggleDocumentMap commandvar rv = $("#reportViewer1").data("telerik_ReportViewer");rv.commands.toggleDocumentMap.exec();
````

````JavaScript
// Check if toggleDocumentMap is enabledif (rv.commands.toggleDocumentMap.enabled()) {}
````

````JavaScript
// Check if toggleDocumentMap is checkedif (rv.commands.toggleDocumentMap.checked()) {}
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
