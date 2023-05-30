---
title: Validating Report Parameters on the Client-side
description: "Learn how to validate report parameters on the client-side when you use HTML5-based Report Viewers in Telerik Reporting."
type: how-to
page_title: Client-side report parameters validation in HTML5 Report Viewers
slug: how-to-validate-report-parameters-on-the-client
position: 
tags: viewer,report,reporting, report parameters, validation, client-side validation, report parameters validation
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>Web Viewers</td>
	</tr>
</table>


## Description

Sometimes we need to validate the input data so that it will match our requirements and rules. The validation could be on the Client or on the Server. The following guide shows how to apply Client-side validation on a report parameter in [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) based on the value of another report parameter. If you want to see this feature implemented on the Server-side, vote for it on our public [Portal](https://feedback.telerik.com/reporting/1424141-server-side-parameters-validation).The approach could be applied to any other HTML5 Web Report Viewer and with little customization to validate different scenarios.

## Solution

1. Start by creating custom parameter editors by defining them through the [ParameterEditors method](/api/telerik.reportviewer.mvc.ireportviewerbuilder#collapsible-Telerik_ReportViewer_Mvc_IReportViewerBuilder_ParameterEditors_System_Action_Telerik_ReportViewer_Mvc_IParameterEditorsBuilder__) when creating the report viewer widget:

	````JavaScript
@(Html.TelerikReporting().ReportViewer()
		.Id("reportViewer1")
		.ServiceUrl(Url.Content("~/api/reports"))
		.ReportSource(new UriReportSource() { Uri = "TestReport.trdp" })
		.ViewMode(ViewMode.Interactive)
		.ScaleMode(ScaleMode.Specific)
		.Scale(1.0)
		.ParameterEditors(
				editors => editors
					.SingleSelectEditor("createSingleSelectEditor")
					.NumberEditor("createNumberEditor")
			)
	)
````

	> You’ll need to create a [custom editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor%}) for each parameter type that will be validating.

1. In this example, we have a single select editor with available values and a number parameter that has to be validated based on the first parameter value. That means that we are going to need a combobox editor and simple input editor.

	In this case, we have both UI elements that we are needing to represent our editors. The first one will be a [Kendo ComboBox widget](https://docs.telerik.com/kendo-ui/api/javascript/ui/combobox), which we have from the [Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}) scripts and simple [HTMl5 text input](https://www.w3schools.com/tags/tag_input.asp). If you wish to use some Kendo widget, that is not included in a subset of the used by default Kendo UI widgets from Telerik Reporting, you need to add manually the scripts for the additional widget or add [kendo.all.js](https://docs.telerik.com/kendo-ui/intro/installation/cdn-service).

1. Create the editors and apply the validation on [input change](https://api.jquery.com/change/):

	````JavaScript
var basedParameterName = "Parent", //The parameter name that will be used for validaion
			parentParameterValue,
			childParameter;

		function createSingleSelectEditor(placeholder, options) {
			var kendoComboBoxElement = $(placeholder).html('<div></div>'),
				parameter,
				valueChangedCallback = options.parameterChanged,
				kendoComboBox;

			function onChange() {
				var val = kendoComboBox.value();
				valueChangedCallback(parameter, val);

				if (parameter.name === basedParameterName) {
					//Save the value
					parentParameterValue = val;
					//Trigger change event on the childParameter to fire the validation
					childParameter.trigger("change");
				}
			}

			return {
				beginEdit: function (param) {
					parameter = param;

					//Find the parameter based on its name if you have more than one parameter of this type
					if (parameter.name === basedParameterName) {
						parentParameterValue = parameter.value;
					}

					kendoComboBox = $(kendoComboBoxElement).kendoComboBox({
						dataTextField: "name",
						dataValueField: "value",
						value: parameter.value,
						dataSource: parameter.availableValues,
						change: onChange
					}).data("kendoComboBox");
				}
			};
		}

		function createNumberEditor(placeholder, options) {
			var inputElement,
				placeholder = $(placeholder),
				validation = placeholder.prev(), //Find the validation element for this specific editor
				parameter,
				valueChangedCallback = options.parameterChanged;

			function onChange() {
				var val = parseInt(inputElement.val());
				// Validate the input value.
				if (parentParameterValue >= val) {
					validation.find(".trv-parameter-error-message")
						.html("The value should be greater than " + parentParameterValue);
					inputElement.addClass("k-invalid");
					validation.show();
				} else {
					valueChangedCallback(parameter, val);
					validation.hide();
					inputElement.removeClass("k-invalid");
				}
				
			}

			return {
				beginEdit: function (param) {
					parameter = param;

					placeholder.html('<input type="text" value="' + parameter.value + '" class="k-textbox" />');
					inputElement = placeholder.find("input");
					childParameter = inputElement;
					//Using a jQuery to detect changes in the input value
					placeholder.on("change", "input", onChange);
				}
			};
		}
	//...
````


## See Also

* [Cascading (dependent) parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}#cascading-dependent-parameters)
