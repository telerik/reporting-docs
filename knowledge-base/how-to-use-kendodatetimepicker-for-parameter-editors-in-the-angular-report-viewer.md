---
title: Using KendoDateTimePicker in the Angular Report Viewer
description: "Learn how to use the KendoDateTimePicker for selecting date and time for the report parameter by creating custom parameter editor in the Angular Report Viewer."
type: how-to
page_title: Using KendoDateTimePicker instead of the default DatePicker in Angular Report Viewer
slug: how-to-use-kendodatetimepicker-for-parameter-editors-in-the-angular-report-viewer
position: 
tags: angular, reportviewer, kendodatetimepicker
ticketid: 1543447
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
			<td>Angular</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Angular Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description

This article describes how to use the [KendoDateTimePicker](https://docs.telerik.com/kendo-ui/api/javascript/ui/datetimepicker) as a custom parameter editor for the [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}). 

This approach allows the selection of date and time for the `DateTime` [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) that do not have available values.

## Solution
> The [kendoDateTimePicker]((https://docs.telerik.com/kendo-ui/api/javascript/ui/datetimepicker) ) widget is not included in the Kendo UI JavaScript distributed by Telerik Reporting through the `telerikReportViewer.kendo.min.js` file, or `kendo.subset.2015.3.930.min.js` and older versions. For that reason, you will have to replace the Kendo UI subset with the full Kendo UI JavaScript e.g. `kendo.all.min.js`.


1. In the initializaion of the report viewer,`{component}.html`, specify the `parameterEditors` [option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%}).

	````HTML
<tr-viewer #viewer1 *ngIf="visible"
	[containerStyle]="viewerContainerStyle"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports/'"
	[reportSource]="{
		report: 'Product Line Sales.trdx',
		parameters: {}
	}" 
	[parameterEditors]="[{
		match: match,
		createEditor: createEditor
	}]" >
</tr-viewer>
````


1. Then in the `{component}.ts` implement the `match` and `createEditor` functions. The visibility of the report viewer can be set to `true` once `kendo.all.min.js` is loaded:

	````TypeScript
export class AppComponent implements OnInit {
		
		@ViewChild('viewer1', { static: false }) viewer: TelerikReportViewerComponent;
		public visible: boolean = false;

		ngOnInit(): void {
			this.loadScript("http://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js")
			this.visible = true;    
		}

		match(parameter) {
			return parameter.type === "System.DateTime";
		}

		createEditor (placeholder, options){
			let input = document.createElement('input');
			input.classList.add("trv-parameter-value");
			//@ts-ignore
			$(placeholder).parent().append(input);
			let dateTimePicker;
			let valueChangedCallback = options.parameterChanged;
			let parameter;

			function onChange(e) {
				//@ts-ignore
				var date = $(input).data("kendoDateTimePickerPicker");
				var val = date.value();
				valueChangedCallback(parameter, val);
			}

			return {
				beginEdit: function (param) {
					parameter = param;
					
					//@ts-ignore
					$(input).kendoDateTimePicker({
						value: param.value,
						format: "dd/MM/yyyy",
						change: onChange
					});

					//@ts-ignore
					dateTimePicker = $(input).data("kendoDateTimePicker");
				}
			};
		}
	}
````


## See Also

* [KendoDateTimePicker](https://docs.telerik.com/kendo-ui/api/javascript/ui/datetimepicker)
* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
* [Report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})
