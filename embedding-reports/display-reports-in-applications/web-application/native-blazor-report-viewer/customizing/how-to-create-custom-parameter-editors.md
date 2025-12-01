---
title: Custom Parameter Editors
page_title: Creating and Using Custom Parameter Editors Overview
description: "Learn how to create and use custom parameter editors with the Native Blazor Report Viewer in Telerik Reporting."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-create-custom-parameter-editors
tags: custom,editor,widget,parameter,blazor
published: True
reportingArea: NativeBlazor
position: 3
previous_url: /embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/customizing/
---

# Creating and Using Custom Parameter Editors

## Overview of the Parameter Template Structure

Telerik [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) come in many shapes and forms, for example, a report parameter can be a `String` which can be displayed with a simple [`Textbox`](https://demos.telerik.com/blazor-ui/textbox/overview) editor, it can also be a `DateTime` which can be displayed with a [`DatePicker`](https://demos.telerik.com/blazor-ui/datepicker/overview) widget or it can even have [`AvailableValues`](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AvailableValues) requiring a more complex widget such as the [`DropDownList`](https://demos.telerik.com/blazor-ui/dropdownlist/overview).

Considering the variety of types of report parameters, we have created a `ParameterTemplate` for each type, allowing for easy singular customization:

- `ParameterIntegerTemplate` - Can be used for no-options `Integer` report parameters
- `ParameterDoubleTemplate` - Can be used for no-options `Float`/`Double` report parameters
- `ParameterDateTimeTemplate` - Can be used for no-options `DateTime` report parameters
- `ParameterBooleanTemplate` - Can be used for no-options `Boolean` report parameters
- `ParameterStringTemplate` - Can be used for no-options `String` report parameters
- `ParameterSingleSelectTemplate` - Can be used for single-value report parameter with `AvailableValues`. Applied to every report parameter that has `AvailableValues`, regardless of its underlying type (string, long, etc.)
- `ParameterMultiSelectTemplate` - Can be used for multiple-values report parameter with `AvailableValues`. Applied to every report parameter that has `AvailableValues` and can have multiple selected values, regardless of its underlying type (string, long, etc.)

>note A Report Parameter can have multiple selectable values when its [MultiValue](/reporting/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_MultiValue) property is `True`.

## Examples of setting the parameter editor for each type with the default widgets

A custom editor can be set for one or more parameter templates. Each parameter template has access to a parameter named `context`. This is the `ReportParameterContext` object of the current report parameter. The `context` is the place where all information for the report parameter is stored. 

The following examples use the default editors that we ship the report viewer with.

````CSHTML
<ReportViewer
	ServiceUrl="/api/reports"
	@bind-ReportSource="@ReportSource"
	ServiceType="@ReportViewerServiceType.REST"
	Height="800px"
	Width="100%">
	<ParameterIntegerTemplate>
		<TelerikNumericTextBox Value="@((long)context.Value)"
							ValueChanged="@((long value) => context.Value = value)">
		</TelerikNumericTextBox>
	</ParameterIntegerTemplate>
	<ParameterDoubleTemplate>
		<TelerikNumericTextBox Value="@((double)context.Value)"
							ValueChanged="@((double value) => context.Value = value)">
		</TelerikNumericTextBox>
	</ParameterDoubleTemplate>
	<ParameterDateTimeTemplate>
		<TelerikDatePicker Value="@((DateTime)context.Value)"
						ValueChanged="@((DateTime value) => context.Value = value)">
		</TelerikDatePicker>
	</ParameterDateTimeTemplate>
	<ParameterBooleanTemplate>
		<TelerikCheckBox Value="@((bool)context.Value)"
						ValueChanged="@((bool value) => context.Value = value)">
		</TelerikCheckBox>
	</ParameterBooleanTemplate>
	<ParameterStringTemplate>
		<TelerikTextBox Value="@((string)context.Value)"
						ValueChanged="@((string value) => context.Value = value)">
		</TelerikTextBox>
	</ParameterStringTemplate>
	<ParameterSingleSelectTemplate>
		<TelerikDropDownList Data="@context.Parameter.AvailableValues"
							Value="@context.Value"
							DefaultText=""
							TItem="ReportParameterValue"
							TValue="object"
							TextField="Name"
							ValueField="Value"
							OnChange="@((object value) => context.Value = value)">
		</TelerikDropDownList>
	</ParameterSingleSelectTemplate>
	<ParameterMultiSelectTemplate>
		@{ var selectedValue = ((IEnumerable)context.Parameter.Value).Cast<object>().ToList(); }
	
		<TelerikMultiSelect Data="@context.Parameter.AvailableValues"
							Value="@selectedValue"
							Filterable="true"
							FilterOperator="@StringFilterOperator.Contains"
							TItem="ReportParameterValue"
							TValue="object"
							TextField="Name"
							ValueField="Value"
							ClearButton="false"
							OnChange="@((object value) => context.Value = value)">
		</TelerikMultiSelect>
	</ParameterMultiSelectTemplate>
</ReportViewer>
````

>note The example serves to give example for each parameter template, since these are the default editors that we already ship with, there is no need to implement this.

## How to use a custom parameter editor - Blazor UI ListView 

Let's try to use a widget that the Native Blazor Report Viewer is not able to use out of the box. For this example, we will use the Telerik Blazor UI's [`ListView`](https://demos.telerik.com/blazor-ui/listview/overview) widget. The code is as follows:

````CSHTML
<ReportViewer
	ServiceUrl="/api/reports"
	@bind-ReportSource="@ReportSource"
	ServiceType="@ReportViewerServiceType.REST"
	Height="800px"
	Width="100%">
	<ParameterSingleSelectTemplate>
		<TelerikListView Data="@context.Parameter.AvailableValues">
			<Template Context="listViewContext">
				@{
					var isSelected = context.Value?.Equals(listViewContext.Value) ?? false;
					var className = (isSelected ? "k-selected" : string.Empty) + " k-list-item";
				}
				<div class="@className" @onclick="@(()=> context.Value = listViewContext.Value)">@listViewContext.Name</div>
			</Template>
		</TelerikListView>
	</ParameterSingleSelectTemplate>
	<ParameterMultiSelectTemplate>
		@{
			var selectedValue = ((IEnumerable)context.Parameter.Value)?.Cast<object>()?.ToList();
		}
		<TelerikListView Data="@context.Parameter.AvailableValues">
			<Template Context="listViewContext">
				@{
					var isSelected = selectedValue?.Contains(listViewContext.Value) ?? false;
					var className = (isSelected ? "k-selected" : string.Empty) + " k-list-item";
				}
				<div class="@className" @onclick="@(()=> MultiSelectParameterTemplateItemClick(context, listViewContext.Value))">@listViewContext.Name</div>
			</Template>
		</TelerikListView>
	</ParameterMultiSelectTemplate>
</ReportViewer>

@code {
	public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Dashboard.trdp", new Dictionary<string, object>{});

	void MultiSelectParameterTemplateItemClick(ReportParameterContext reportParameterContext, object reportParameterValue)
	{
		var selectedValue = ((IEnumerable)reportParameterContext.Parameter.Value).Cast<object>().ToList();

		if (selectedValue.Contains(reportParameterValue))
		{
			selectedValue.Remove(reportParameterValue);
		}
		else
		{
			selectedValue.Add(reportParameterValue);
		}

		reportParameterContext.Value = selectedValue;
	}
}
````

In this example, we set the `ListView` widget to be used for both the `ParameterSingleSelectTemplate` and `ParameterMultiSelectTemplate` templates which means that all report parameters with available values will be rendered using the `ListView` widget, regardless of the type of the report parameter(string, DateTime, etc.)

## See Also

* [Blazor UI ListView Templates](https://docs.telerik.com/blazor-ui/components/listview/templates)
