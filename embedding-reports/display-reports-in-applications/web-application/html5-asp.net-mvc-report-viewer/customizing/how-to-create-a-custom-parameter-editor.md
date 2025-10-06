---
title: Custom Parameter Editors
page_title: Using Custom Parameter Editors in HTML5 MVC Report Viewer
description: "Learn how to create and then use custom Parameter Editors with the HTML5 MVC Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor
tags: how,to,create,a,custom,parameter,editor
published: True
reporting_area: MVCWrapper
position: 4
previous_url: /html5-mvc-report-viewer-customizing-custom-parameters-editor
---

# Custom Parameter Editors in the MVC Report Viewer

The article elaborates how to change the default editors for visible parameters in the HTML5 MVC Report Viewer's Parameters Area.

Custom parameter editors are defined through the ParameterEditors method when creating the report viewer widget. Check out the following list with the available parameter editors:

* SingleSelectEditor
* MultiSelectEditor
* MultiValueEditor
* DateTimeEditor
* StringEditor
* NumberEditor
* BooleanEditor
* DefaultEditor
* CustomEditors

The following example illustrates how to use the [`Kendo DropDownList`](https://demos.telerik.com/kendo-ui/dropdownlist/index) widget for a `single` parameter value parameter editor which also has [available values](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AvailableValues):

````JavaScript
function createSingleSelectEditor(placeholder, options) {
    var dropDownElement = $(placeholder).html('<div></div>');
    var parameter,
          valueChangedCallback = options.parameterChanged,
          dropDownList;
    function onChange() {
        var val = dropDownList.value();
        valueChangedCallback(parameter, val);
    }
    return {
        beginEdit: function (param) {
            parameter = param;
            $(dropDownElement).kendoDropDownList({
                dataTextField: "name",
                dataValueField: "value",
                value: parameter.value,
                dataSource: parameter.availableValues,
                change: onChange
            });
            dropDownList = $(dropDownElement).data("kendoDropDownList");
        }
    };
}
````
````CSHTML
@(Html.TelerikReporting().ReportViewer()
     .Id("reportViewer1")
     .ParameterEditors(
                    editors => editors
                     .SingleSelectEditor("createSingleSelectEditor")
         )
)
````


If the predefined parameter types are not covering your scenario you can define a CustomParameterEditor. Each custom editor requires two JavaScript functions provided as attributes: `MatchFunction` and `CreateEditorFunction`.

The `customMatch` method accepts a report parameter to be edited as an argument and returns a boolean value which indicates whether the parameter editor is suitable for this parameter. The parameter variable exposes the properties of the report parameter like `name`, `allowNull`, `availableValues`, `multiValue`, `type` and etc.

The main work for creating and utilizing the parameter editor is done in the `createCustomEditor` method. Its purpose is to create the parameter editor UI and wire it to the `parameterChanged` callback when a new value is selected. The return result is a new object containing the `beginEdit` method which is the entry point for creating the editor from the viewer.

The following example illustrates how to use the [`Kendo DropDownList`](https://demos.telerik.com/kendo-ui/dropdownlist/index) widget for a boolean single parameter value parameter editor which also has available values:

````JavaScript
function customMatch(parameter) {
    return Boolean(parameter.availableValues)
        && !parameter.multivalue
        && parameter.type === telerikReportViewer.ParameterTypes.BOOLEAN;
}
function createCustomEditor(placeholder, options) {
    var dropDownElement = $(placeholder).html('<div></div>');
    var parameter,
          valueChangedCallback = options.parameterChanged,
          dropDownList;
    function onChange() {
        var val = dropDownList.value();
        valueChangedCallback(parameter, val);
    }
    return {
        beginEdit: function (param) {
            parameter = param;
            $(dropDownElement).kendoDropDownList({
                dataTextField: "name",
                dataValueField: "value",
                value: parameter.value,
                dataSource: parameter.availableValues,
                change: onChange
            });
            dropDownList = $(dropDownElement).data("kendoDropDownList");
        }
    };
}
````


Passing the parameter editor to the viewer:

````CSHTML
@(Html.TelerikReporting().ReportViewer()
     .Id("reportViewer1")
     .ParameterEditors(
                    editors => editors
                     .CustomEditors(new CustomParameterEditor
                        {
                            MatchFunction = "customMatch",
                            CreateEditorFunction = "createCustomEditor"
                        })
         )
)
````


> You can use any other custom UI covering the requirements of the `createEditor` method.

## See Also

* [How To: Pass Values to Report Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-pass-values-to-report-parameters%})
