---
title: Passing Values to Report Parameters
page_title: Passing values to Report Parameters in the Native Angular Report Viewer
description: "Learn how to pass/update the values of the Report Parameters or load a new report in the Native Angular Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/customizing/passing-parameter-values
tags: how,to,pass,values,to,report,parameters,in,native,angular,report,viewer
published: True
position: 0
previous_url: /embedding-reports/display-reports-in-applications/web-application/native-angular-report-viewer/customizing/
---

# Updating the Report Parameters of the Native Angular Report Viewer

This topic explains how to update the report parameters with values passed from a custom UI outside the report viewer instead of using the report viewer's built-in parameters area. 

The report identifier and all required parameter values for it are packed in a `reportSource` object. To update the report source, the `setReportSource` command can be used.

## Example of using the setReportSource command

The following example will demonstrate how a [select](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select) control outside of the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) can have its `selected` value passed to the report viewer's `reportSource`:

````HTML
<select #orderNumber value="SO51081" (change)="onChange(orderNumber.value)">
	<option *ngFor="let i of [1,2,3,4,5]">{{ "SO5108" + i }}</option>
</select>

<reporting-angular-viewer
	#report
	[reportSource]="{
		report: 'Invoice.trdx',
		parameters: {}
	}"
	serviceUrl="https://demos.telerik.com/reporting/api/reports"
	viewMode="interactive"
	[keepClientAlive]="true">
</reporting-angular-viewer>
````
````TypeScript
export class AppComponent {
	@ViewChild('report') public report: ReportingAngularViewerComponent;

	onChange(OrderNumber: string) {
		this.report.executeCommand("setReportSource", {
			report: "Invoice.trdx",
			parameters: {
				OrderNumber
			}
		})
	}
}
````


## See Also

* [How to Use the Native Angular Report Viewer with Reporting Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service%})
* [How to Use the Native Angular Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-report-server%})
* [Native Angular Report Viewer Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%})
* [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%})
* [Native Angular Report Viewer Commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands%})
* [Native Angular Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events%})
