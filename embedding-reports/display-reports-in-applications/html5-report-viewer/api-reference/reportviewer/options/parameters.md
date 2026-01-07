---
title: parameters
page_title: parameters property
description: "Allows the user to define parameter options for the report parameters. Properties: editors (object)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parameters
published: True
reportingArea: HTML5
---

# The `parameters` option of the HTML5 Report Viewer

Allows the user to define parameter options for the report parameters. Properties: editors (object).

## Type

[`ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametersoptions%})

## Examples

````JavaScript
// Custom parameter editors
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Custom editors for report parameters
  parameters: { editors: { MyParam: MyCustomEditor } }
});
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/overview%})
* [parametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametersareaposition%})
* [parametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametersareavisible%})

