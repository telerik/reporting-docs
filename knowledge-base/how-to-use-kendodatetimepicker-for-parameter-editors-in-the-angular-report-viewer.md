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

This article describes how to use the [KendoDateTimePicker](https://docs.telerik.com/kendo-ui/api/javascript/ui/datetimepicker) as a custom parameter editor
in [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}). This approach allows the selection of date and time for the **DateTime** [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}).

## Solution
> Telerik kendoDateTimePicker widget is not included in the Kendo UI JavaScript distributed by 
Telerik Reporting through telerikReportViewer.kendo-x.x.x.min.js file, or kendo.subset.2015.3.930.min.js in older versions.
For that reason, you will have to replace the Kendo UI subset with the full Kendo UI JavaScript e.g. kendo.all.min.js.

Also, you need to make sure that Kendo all is loaded after jQuery. Because of that, we will use a special logic that sets the visibility
of the viewer after Kendo all is loaded:

1. In the initializaion of the viewer, specify the parameterEditors [option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%}).

	````TypeScript
<tr-viewer #viewer1 *ngIf="visible"
		[containerStyle]="viewerContainerStyle"
		[serviceUrl]="'http://localhost:59654/api/reports/'"
		[reportSource]="{
			report: 'MyReport.trdp',
			parameters: {}
		}"
		[parameterEditors]="[{
			match: match,
			createEditor: createEditor
		}]"
	</tr-viewer>
````


1. Then in the **app.component.ts** implement the createEditor function. You see that we set the visibility of the viewer to True once `kendo.all.min.js` is loaded:

	````TypeScript
export class AppComponent implements OnInit {
		@ViewChild('viewer1', { static: false }) viewer: TelerikReportViewerComponent;

		private visible: boolean = false;
		...

		ngOnInit() {
			this.loadScript("http://kendo.cdn.telerik.com/2020.3.1118/js/kendo.all.min.js")
				.then(() => {
					this.visible = true;
				});
		}

		...
		match(parameter) {
			return parameter.type === "System.DateTime";
		}

		createEditor (placeholder, options){
			var dateTimePicker = $(placeholder).html('<input type="datetime"/>'),
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

					$(dateTimePicker).find("input").kendoDateTimePicker({
						dataTextField: "name",
						dataValueField: "value",
						value: parameter.value,
						dataSource: parameter.availableValues,
						change: onChange
					});

					dropDownList = $(dateTimePicker).find("input").data("kendoDateTimePicker");
				}
			};
		}
	}
````


## See Also

* [KendoDateTimePicker](https://docs.telerik.com/kendo-ui/api/javascript/ui/datetimepicker))
* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
* [Report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})
