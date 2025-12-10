---
title: Custom Parameter Editors
page_title: Creating and Using Custom Parameter Editors in HTML5 ReportViewer
description: "Learn How to Create and use Custom Parameter Editors in the HTML5 ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor
tags: how,create,custom,parameter,editor
published: True
reportingArea: HTML5
position: 3
previous_url: /html5-report-viewer-howto-custom-parameter-editor
---

# Custom Parameter Editors in the HTML5 Report Viewer

The article elaborates on how to change the default editors for visible parameters in the HTML5 Viewer's Parameters Area.

Custom parameter editors are defined through the parameterEditors ([Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})) array passed as an option when creating the report viewer widget. Each object represents a parameter editor factory for creating editors suitable to edit a specific report parameter configuration.

Each editor is an object which contains two methods: `match` and `createEditor`.

The `match` method accepts a report parameter to be edited as an argument and returns a boolean value which indicates whether the parameter editor is suitable for this parameter. The parameter variable exposes the properties of the report parameter like name, allowNull, availableValues, multiValue, type, etc.

The main work for creating and utilizing the parameter editor is done in the `createEditor` method. Its purpose is to create the parameter editor UI and wire it to the `parameterChanged` callback when a new value is selected. The return result is a new object containing the `beginEdit` method which is the entry point for creating the editor from the viewer.

The following example illustrates how to use the Kendo DropDownList widget for a single parameter value parameter editor which also has available values:

````JavaScript
{
	match: function (parameter) {
		// Here you can use all of the parameter properties to
		// create a more specific editor
		return Boolean(parameter.availableValues) && !parameter.multivalue;
	},
	createEditor: function (placeholder, options) {
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
}
````

Passing the parameter editor to the viewer:

````JavaScript
<script type="text/javascript">
	$("#reportViewer1").telerik_ReportViewer({
		parameterEditors: [{
			match: function (parameter) {
				return Boolean(parameter.availableValues) && !parameter.multivalue;
			},
			createEditor: function (placeholder, options) {
				var dropDownElement = $(placeholder).html('<div></div>'),
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
		}]
	});
</script>
````

>tip You can use any other custom UI covering the requirements of the `createEditor` method.

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Passing Values to Report Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-pass-values-to-report-parameters%})
