---
title: ParameterEditor
page_title: ParameterEditor Type
description: "Describes a parameter editor for the Telerik Report Viewer parameter panel."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametereditor
published: True
reportingArea: HTML5
---

# The `ParameterEditor` type of the HTML5 Report Viewer

Describes a parameter editor for the Telerik Report Viewer parameter panel.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| match | `function` | Determines if the editor is suitable for the parameter. |
| createEditor | `function` | Creates the editor UI. |

## Example

````JavaScript
// Example: Custom match function for single-select parametersvar match = function(parameter) {  // Use parameter properties to determine if this editor should be used  return Boolean(parameter.availableValues) && !parameter.multivalue;};
````

````JavaScript
// Example: Custom createEditor function using Kendo DropDownListvar createEditor = function(placeholder, options) {  var dropDownElement = $(placeholder).html('<div></div>');  var parameter;  var valueChangedCallback = options.parameterChanged;  var dropDownList;  function onChange() {    var val = dropDownList.value();    valueChangedCallback(parameter, val);  }  return {    beginEdit: function(param) {      parameter = param;      $(dropDownElement).kendoDropDownList({        dataTextField: "name",        dataValueField: "value",        value: parameter.value,        dataSource: parameter.availableValues,        change: onChange      });      dropDownList = $(dropDownElement).data("kendoDropDownList");    }  };};
````

````JavaScript
// Example: Registering the custom ParameterEditorParameterEditors.push({  match: match,  createEditor: createEditor});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
