---
title: ParameterEditor
page_title: ParameterEditor Type
description: "Describes a parameter editor for the Telerik Report Viewer parameter panel."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/parametereditor
published: True
reportingArea: React
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ParameterEditor` type of the React Report Viewer

Describes a parameter editor for the Telerik Report Viewer parameter panel.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| match | `function` | Determines if the editor is suitable for the parameter. |
| createEditor | `function` | Creates the editor UI. |

## Example

````JavaScript
// Example: Custom match function for single-select parameters
var match = function(parameter) {
  // Use parameter properties to determine if this editor should be used
  return Boolean(parameter.availableValues) && !parameter.multivalue;
};
````

````JavaScript
// Example: Custom createEditor function using Kendo DateTimePicker
function match(parameter) {
    return parameter.type === "System.DateTime";
}

function createEditor(placeholder, options) {
    var dateTimePicker = $(placeholder).html('<input type="datetime"/>'),
    parameter,
    valueChangedCallback = options.parameterChanged,
    dropDownList;
    function onChange() {
        var val = dropDownList.value();
        valueChangedCallback(parameter, val);
    }
    return {
        beginEdit: function (param) {
            parameter = param;
            $(dateTimePicker).find("input").kendoDateTimePicker({
                dataTextField: "name",
                dataValueField: "value",
                value: parameter.value,
                dataSource: parameter.availableValues,
                change: onChange
            });
            dropDownList = $(dateTimePicker).find("input").data("kendoDateTimePicker");
        }
    };
}
````

````JavaScript
// Example: Registering the custom ParameterEditor
ParameterEditors.push({
  match: match,
  createEditor: createEditor
});
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/overview%})
* [parameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametereditors%})

