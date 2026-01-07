---
title: ParameterEditors
page_title: ParameterEditors property
description: "Gets or sets the user-defined custom editors for the report parameters. Each custom editor requires a function name for its Telerik.ReportViewer.Blazor.ParameterEditor.Match and Telerik.ReportViewer.Blazor.ParameterEditor.CreateEditor properties. The function names should be fully qualified, e.g. \"window.trvDateTimeCustomEditor.match\", or just \"trvDateTimeCustomEditor.match\" (\"window\" qualifier is optional). The functions should be implemented inside the wwwroot/index.html (Blazor WebAssembly) or Pages/_Host.cshtml (Blazor Server)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/parametereditors
published: True
reportingArea: BlazorWrapper
---

# The `ParameterEditors` option of the Blazor Report Viewer

Gets or sets the user-defined custom editors for the report parameters. Each custom editor requires a function name for its `Telerik.ReportViewer.Blazor.ParameterEditor.Match` and `Telerik.ReportViewer.Blazor.ParameterEditor.CreateEditor` properties. The function names should be fully qualified, e.g. "window.trvDateTimeCustomEditor.match", or just "trvDateTimeCustomEditor.match" ("window" qualifier is optional). The functions should be implemented inside the wwwroot/index.html (Blazor WebAssembly) or Pages/_Host.cshtml (Blazor Server).

## Type

[`Telerik.ReportViewer.Blazor.ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/parametereditor%})

## Examples

````C#
<ReportViewer ParameterEditors="@(new ParameterEditor[]
              {
                  new ParameterEditor
                  {
                      Match = "singleSelectEditor.matchFunction",
                      CreateEditor = "singleSelectEditor.createEditorFunction"
                  }
              })" />

<script>
        window.singleSelectEditor = {
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

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/overview%})
* [Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/parameters%})
* [ParametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/parametersareaposition%})
* [ParameterEditor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/parametereditor%})

