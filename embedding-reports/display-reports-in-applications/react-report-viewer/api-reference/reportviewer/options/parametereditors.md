---
title: parameterEditors
page_title: parameterEditors property
description: "Allows the user to define custom editors for the report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametereditors
published: True
reportingArea: React
---

# The `parameterEditors` option of the React Report Viewer

Allows the user to define custom editors for the report parameters.

## Type

[`ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/parametereditor%})

## Examples

````JavaScript
// Register custom parameter editorsconst customEditors = [{  match: function(param) { return param.name === "MyParam"; },  createEditor: function(placeholder, options) { return {}; }}];// Use with component: parameterEditors={customEditors}
````

