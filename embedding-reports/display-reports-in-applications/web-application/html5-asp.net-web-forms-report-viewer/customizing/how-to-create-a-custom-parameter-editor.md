---
title: Custom Parameter Editors
page_title: Custom Parameter Editors in HTML5 ASP.NET WebForms ReportViewer
description: "Learn how to Create and use Custom Parameter Editors in the HTML5 ASP.NET WebForms ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor
tags: how,to,create,a,custom,parameter,editor
published: True
reportingArea: WebFormsWrapper
position: 4
previous_url: /html5-webforms-report-viewer-customizing-custom-parameter-editor
---

# Custom Parameter Editors in the HTML5 WebForms Report Viewer

The article elaborates how to change the default editors for visible parameters in the HTML5 Viewer's Parameters Area.

Custom parameter editors are defined through the `ParameterEditors` element when creating the report viewer control. Check out the following list with the available parameter editors:

- SingleSelectEditor
- MultiSelectEditor
- MultiValueEditor
- DateTimeEditor
- StringEditor
- NumberEditor
- BooleanEditor
- DefaultEditor
- CustomEditors

The following example illustrates how to use the [Kendo DropDownList](https://demos.telerik.com/kendo-ui/dropdownlist/index) widget for a single parameter value parameter editor which also has available values:

```JavaScript
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
```
```HTML
</telerik:ReportViewer>
	<ParameterEditors SingleSelectEditor="createSingleSelectEditor"/>
</telerik:ReportViewer>
```

The viewer is using a special Kendo subset that contains only the required widgets and the [DropDownList](https://demos.telerik.com/kendo-ui/dropdownlist/index) widget is not part of the subset, additionally the viewer adds jQuery but this happens late in the viewer initialization. Thus, add the following tags to the web page head element as shown in the following code snippet:

```HTML
<link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"> </script>
<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js"></script>
```

If the predefined parameter types are not covering your scenario you can define a CustomParameterEditor. Each custom editor requires two JavaScript functions provided as attributes: **MatchFunction** and **CreateEditorFunction**.

The **customMatch** method accepts a report parameter to be edited as an argument and returns a boolean value which indicates whether the parameter editor is suitable for this parameter. The parameter variable exposes the properties of the report parameter like name, allowNull, availableValues, multiValue, type and etc.

The main work for creating and utilizing the parameter editor is done in the **createCustomEditor** method. Its purpose is to create the parameter editor UI and wire it to the **parameterChanged** callback when a new value is selected. The return result is a new object containing the **beginEdit** method which is the entry point for creating the editor from the viewer.

The following example illustrates how to use the Kendo DropDownList widget for a boolean single parameter value parameter editor which also has available values:

```JavaScript
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
```

Passing the parameter editor to the viewer:

```HTML
</telerik:ReportViewer>
	<ParameterEditors>
		<CustomEditors>
			<telerik:CustomParameterEditor MatchFunction="customMatch" CreateEditorFunction="createCustomEditor"></telerik:CustomParameterEditor>
		</CustomEditors>
	</ParameterEditors>
</telerik:ReportViewer>
```

> You can use any other custom UI covering the requirements of the _CreateEditorFunction_ method.
