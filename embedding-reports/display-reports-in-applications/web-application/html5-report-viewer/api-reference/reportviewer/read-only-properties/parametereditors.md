---
title: parameterEditors
page_title: parameterEditors property
description: "Allows the user to define array of custom editors for the report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/read-only-properties/parametereditors
published: True
reportingArea: HTML5
---

# parameterEditors

Allows the user to define array of custom editors for the report parameters.

## Type

`ParameterEditor`

## Examples

````JavaScript
// Register a custom parameter editor for a specific parameter$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // Custom parameter editors array  parameterEditors: [    {      match: function(param) { return param.name === "MyParam"; },      editor: MyCustomEditor    }  ]});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
