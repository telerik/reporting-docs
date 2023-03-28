---
title: Integrate the DateTimePicker Widget in the Native Blazor Report Viewer
description: "Learn how to use the DateTimePicker widget from the Telerik UI for Blazor as a DateTime Report Parameter editor in the Native Blazor Report Viewer."
type: how-to
page_title: Using the Telerik UI Blazor DateTimePicker widget in the Native Blazor Report Viewer
slug: use-datetimepicker-native-blazor-reportviewer
position: 
tags: Blazor
ticketid: 1602935
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>Blazor</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Native Blazor</td>
		</tr>
	</tbody>
</table>


## Description

By default, the [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) uses the [Telerik Blazor UI DatePicker](https://demos.telerik.com/blazor-ui/datepicker/overview) widget when displaying [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) of [`Type`](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Type)`=DateTime`.

If you wish to display also the `Time`, the [Telerik Blazor UI DateTimePicker](https://demos.telerik.com/blazor-ui/datetimepicker/overview) widget can be implemented as a custom parameter editor for parameters of type `DateTime`. This will allow you also to edit the time.

## Solution

````CSHTML
<ReportViewer ... >
	<ParameterDateTimeTemplate>
		<TelerikDateTimePicker Value="@((DateTime)context.Value)"
						ValueChanged="@((DateTime value) => context.Value = value)">
		</TelerikDateTimePicker>
	</ParameterDateTimeTemplate>
</ReportViewer>
````

## See Also

* [Creating and Using Custom Parameter Editors in the Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-create-custom-parameter-editors%})
* [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
* [Telerik Blazor UI DateTimePicker](https://demos.telerik.com/blazor-ui/datetimepicker/overview)
* [Telerik Blazor UI DatePicker](https://demos.telerik.com/blazor-ui/datepicker/overview)
