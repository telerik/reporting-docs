---
title: parametersAreaPosition
page_title: parametersAreaPosition property
description: "The position of the parameters area. See [ParametersAreaPositions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametersareapositions%})."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametersareaposition
published: True
reportingArea: HTML5
---

# The `parametersAreaPosition` option of the HTML5 Report Viewer

The position of the parameters area. See [ParametersAreaPositions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametersareapositions%}).

## Type

[`ParametersAreaPositions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/parametersareapositions%})

## Examples

````JavaScript
// Place parameters area on the left using the enum value$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // The position of the parameters area  parametersAreaPosition: telerikReportViewer.ParametersAreaPositions.LEFT});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
