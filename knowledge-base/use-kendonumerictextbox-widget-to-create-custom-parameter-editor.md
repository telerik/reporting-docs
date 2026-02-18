---
title: Create custom NumberEditor for integer parameter values with kendoNumericTextBox widget
description: Use kendoNumericTextBox widget to create custom parameter editor
type: how-to
page_title: Create custom NumberEditor for integer parameter values with kendoNumericTextBox widget
slug: use-kendonumerictextbox-widget-to-create-custom-parameter-editor
position:
tags: Html5ReportViewer, Customizing, ReportParameters
ticketid: 1338239
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>

## Description

The knowledge based article elaborates how to change the default editors for visible parameters in the HTML5 Viewer's Parameters Area.
Custom parameter editors are defined through the **ParameterEditors** method when creating the report viewer widget. In this article a NumberEditor implementing [kendoNumericTextBox widget](https://docs.telerik.com/kendo-ui/controls/editors/numerictextbox/overview) will be used.

## Solution

The following example illustrates how to use the Kendo NumericTextBox widget for a number parameter editor which also has available values:

```JavaScript
function createNumberEditor(placeholder, options) {
	$(placeholder).html('<input type="number"/>');
	var inputElement = $(placeholder).find("input[type=number]");
	var parameter,
		valueChangedCallback = options.parameterChanged,
		inputBox;
			function onChange() {
			var dtv = inputBox.value();
			valueChangedCallback(parameter, dtv);
		}

		return {
			beginEdit: function (param) {
				parameter = param;

				$(inputElement).kendoNumericTextBox({
					value: parameter.value,
					dataSource: parameter.availableValues,
					change: onChange
				});

				inputBox = $(inputElement).data("kendoNumericTextBox");
			}
		}
}
```

```C#
@(Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ParameterEditors(
                    editors => editors
                        .NumberEditor("createNumberEditor")
            )
)
```

You can download the sample application from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/numbereditorsample.zip?sfvrsn=97fa2518_2). Note that it is a MVC application with HTML5 MVC Report Viewer.

## See Also

- [How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
