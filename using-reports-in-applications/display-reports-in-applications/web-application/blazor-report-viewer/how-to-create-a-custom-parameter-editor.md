---
title: How to Create a Custom Parameter Editor
page_title: How to Create a Custom Parameter Editor 
description: How to Create a Custom Parameter Editor In Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-create-a-custom-parameter-editor
tags: how,to,create,a,custom,parameter,editor,blazor
published: True
position: 4
---

# How to Create a Custom Parameter Editor

The article elaborates on how to change the default editors for visible parameters in the Blazor Report Viewer's Parameters Area. 

Custom parameter editors are defined through the **ParameterEditors** ([Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})) **ParameterEditor** array passed as an option when creating the report viewer widget.
Each object represents a parameter editor factory for creating editors suitable to edit a specific report parameter configuration. 

Each editor is a **ParameterEditor** instance which contains two string properties: __Match__ and __CreateEditor__. These strings should point to a global JS variable defined on the [Window](https://developer.mozilla.org/en-US/docs/Web/API/Window) object.
This variable should have a _match_ and _createEditor_ javascript methods. 

The __match__ method accepts a report parameter to be edited as an argument and returns a boolean value which indicates whether the parameter editor is suitable for this parameter. The parameter variable exposes the properties of the report parameter like name, allowNull, availableValues, multiValue, type, etc. 

The main work for creating and utilizing the parameter editor is done in the __createEditor__ method. Its purpose is to create the parameter editor UI and wire it to the __parameterChanged__ callback when a new value is selected. The returned result is a new object containing the __beginEdit__ method which is the entry point for creating the editor from the viewer. 

This global variable with the _match_ and _createEditor_ methods can be initialized in **\_Host.cshtml\/\_Layout.cshtml** for Blazor Server project and for Blazor WebAssembly can be used the **wwwroot/index.html** file.

The following example uses the **Dashboard** example report that we ship with the installation of Telerik Reporting and illustrates how to use the Kendo DropDownList widget for a single parameter value parameter editor which also has available values: 

- In **\_Host.cshtml**

````html
  <!--Kendo all is needed for the DropDownList widget itself-->
  <script src="https://kendo.cdn.telerik.com/2022.1.119/js/kendo.all.min.js"></script>

  <script>
        window.trvParameterEditors = {

             matchFunction: function (parameter) {
                return Boolean(parameter.availableValues) && !parameter.multivalue;
            },

             createEditorFunction: function createEditorFunction(placeholder, options) {
            
                let dropDownListElement = $(placeholder).html('<input style="width: 50px;" />');
                let valueChangedCallback = options.parameterChanged;
                let parameter;

                    function onChange(e) {
                        var years = $(dropDownListElement).data("kendoDropDownList");
                        var val = years.value();
                        valueChangedCallback(parameter, val);
                    }

                return {
                
                    beginEdit: function (param) {

                    parameter = param;

                    $(dropDownListElement).kendoDropDownList({
                        dataSource: param.availableValues.map((el) => el.value),
                        change: onChange
                    });

                    dropDownList = $(dropDownListElement).data("kendoDropDownList");
                }
            };
         }
       }
    </script>
````

- Then in the Blazor Report Viewer Initialization:

````cs
<ReportViewer @ref="reportViewer1"
              ViewerId="rv1"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions
                              {
                                  Report = "Dashboard.trdp",
                              })"
              ParameterEditors="@(new ParameterEditor[] { new ParameterEditor() { CreateEditor = "trvParameterEditors.createEditorFunction", Match = "trvParameterEditors.matchFunction" } })"
````


# See Also

* [Blazor Report Viewer Event Binding]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/event-binding%})
