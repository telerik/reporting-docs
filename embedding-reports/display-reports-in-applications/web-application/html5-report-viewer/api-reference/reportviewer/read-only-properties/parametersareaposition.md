---
title: parametersAreaPosition
page_title: parametersAreaPosition property
description: "The position of the parameters area. See {@link ParametersAreaPositions}."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/read-only-properties/parametersareaposition
published: True
reportingArea: HTML5
---

# parametersAreaPosition

The position of the parameters area. See {@link ParametersAreaPositions}.

## Type

`ParametersAreaPositions`

## Examples

````JavaScript
// Place parameters area on the left using the enum value$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // The position of the parameters area  parametersAreaPosition: telerikReportViewer.ParametersAreaPositions.LEFT});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
