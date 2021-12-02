---
title: How to Create a Custom Parameter Editor
page_title: How to Create a Custom Parameter Editor | for Telerik Reporting Documentation
description: How to Create a Custom Parameter Editor
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor
tags: how,to,create,a,custom,parameter,editor
published: True
position: 4
---

# How to Create a Custom Parameter Editor



The article elaborates how to change the default editors for visible parameters in the HTML5 Viewer's Parameters Area.       

## 

Custom parameter editors are defined through the ParameterEditors method when creating the report viewer widget.           Check out the following list with the available parameter editors:         

The following example illustrates how to use the Kendo DropDownList widget for a           single parameter value parameter editor which also has available values:         

	
````js
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
````xml
@(Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ParameterEditors(
                    editors => editors
                        .SingleSelectEditor("createSingleSelectEditor")
            )
)
````



If the predefined parameter types are not covering your scenario you can define a CustomParameterEditor.           Each custom editor requires two JavaScript functions provided as attributes: __MatchFunction__  and __CreateEditorFunction__ .         

The __customMatch__  method accepts a report parameter to be edited as an argument and returns a boolean value which indicates           whether the parameter editor is suitable for this parameter. The parameter variable exposes the properties of the report parameter like name,           allowNull, availableValues, multiValue, type and etc.         

The main work for creating and utilizing the parameter editor is done in the __createCustomEditor__  method.           Its purpose is to create the parameter editor UI and wire it to the __parameterChanged__  callback when a new value is selected.           The return result is a new object containing the __beginEdit__  method which is the entry point for creating the editor from the viewer.         

The following example illustrates how to use the Kendo DropDownList widget for a           boolean single parameter value parameter editor which also has available values:         

	
````js
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

	
````xml
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



>tip You can use any other custom UI covering the requirements of the createEditor method.


# See Also


 * [How To: Pass Values to Report Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-pass-values-to-report-parameters%})
