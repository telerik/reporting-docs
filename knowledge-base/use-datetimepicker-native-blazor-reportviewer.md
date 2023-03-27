---
title: Implement the DateTimePicker widget in the native Blazor Report Viewer
description: Learn how to use a DateTimePicker for the DateTime Report Parameters in the native Blazor Report Viewer
type: how-to
page_title: Using the Telerik UI Blazor DateTimePicker widget in the native Blazor Report Viewer
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
			<td>Product Version</td>
			<td>17.0.23.118+</td>
		</tr>
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

By default, the native [Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) uses the [Telerik Blazor UI DatePicker](https://demos.telerik.com/blazor-ui/datepicker/overview) widget when displaying [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) of [`Type`](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Type)`=DateTime`.
However, one may wish to also display the date's `Time` and even allow editing it. In such a case, the [Telerik Blazor UI DateTimePicker](https://demos.telerik.com/blazor-ui/datetimepicker/overview) widget can be implemented as a custom parameter editor for parameters of type `DateTime`.

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

* [Creating and Using Custom Parameter Editors in the native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-create-custom-parameter-editors%})
