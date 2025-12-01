---
title: parameters
page_title: parameters property
description: "Allows the user to define parameter options for the report parameters. Properties: editors (object)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/read-only-properties/parameters
published: True
reportingArea: HTML5
---

# parameters

Allows the user to define parameter options for the report parameters. Properties: editors (object).

## Type

`ParametersOptions`

## Examples

````JavaScript
// Custom parameter editors$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // Custom editors for report parameters  parameters: { editors: { MyParam: MyCustomEditor } }});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
