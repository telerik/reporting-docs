---
title: parameterEditors
page_title: parameterEditors property
description: "Allows the user to define custom editors for the report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/read-only-properties/parametereditors
published: True
reportingArea: React
---

# parameterEditors

Allows the user to define custom editors for the report parameters.

## Type

`ParameterEditor`

## Examples

````JavaScript
// Register custom parameter editorsconst customEditors = [{  match: function(param) { return param.name === "MyParam"; },  createEditor: function(placeholder, options) { return {}; }}];// Use with component: parameterEditors={customEditors}
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
