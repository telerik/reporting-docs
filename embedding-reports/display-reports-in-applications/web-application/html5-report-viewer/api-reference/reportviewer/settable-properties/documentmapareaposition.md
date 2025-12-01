---
title: documentMapAreaPosition
page_title: documentMapAreaPosition property
description: "The position of the document map area. See {@link DocumentMapAreaPositions}."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/documentmapareaposition
published: True
reportingArea: HTML5
---

# documentMapAreaPosition

The position of the document map area. See {@link DocumentMapAreaPositions}.

## Type

`DocumentMapAreaPositions`

## Examples

````JavaScript
// Place document map on the right using the enum value$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // The position of the document map area  documentMapAreaPosition: telerikReportViewer.DocumentMapAreaPositions.RIGHT});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
