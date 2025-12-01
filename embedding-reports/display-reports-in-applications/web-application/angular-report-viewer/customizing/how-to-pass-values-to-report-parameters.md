---
title: Passing Values to Report Parameters
page_title: Passing values to Report Parameters in Angular Report Viewer
description: "Learn how to pass/update the values of the Report Parameters in the Angular Report Viewer from code behind."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters,in,angular,report,viewer
published: True
reportingArea: AngularWrapper
position: 0
previous_url: /angular-report-viewer-howto-custom-parameters, /embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/customizing/
---

# Updating the Values of Report Parameters from the Angular Report Viewer

This topic explains how to update the report parameters with values passed from a custom UI instead of using the report viewer's default parameters area. The report identifier and all required parameters values for it are packed in a `ReportSource` object. To update the report source, the [setReportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/methods%}) method is used.

## Pass values to report parameters from the application UI

1. Add the custom UI in your application. For example:

	````HTML
<button (click)="onButtonClick(value)">Update parameter value</button>
````

1. Declare the variable for the viewer and update the viewer's report source with a new parameter value:

	````TypeScript
import { Component, ViewChild } from '@angular/core';
	import { TelerikReportViewerComponent } from '@progress/telerik-angular-report-viewer';

	export class AppComponent {
		@ViewChild('viewer1') viewer: TelerikReportViewerComponent;

		onButtonClick(param: string) {
			var rs = {
				report: 'Invoice.trdp',
				parameters: { OrderNumber: param }
			};
			this.viewer.setReportSource(rs);
		}
	}
````

	The `setReportSource(rs)` method will automatically refresh the report with the new parameter values.

## See Also

* [How To: Use Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%})
