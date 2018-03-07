---
title: Access component properties inside Angular Report Viewer events
description: Access component properties inside Angular Report Viewer events using this
type: troubleshooting
page_title: Access Angular component properties in viewer events
slug: angular-component-properties-in-viewer-events
position: 
tags: 
ticketid: 1156009
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
		<td>Angular Report Viewer</td>
	</tr>
</table>


## Description
Inside [Angular Report Viewer events](https://testdocs.telerik.com/reporting/angular-report-viewer-event-binding) the **this** object will point to the report viewer object.
This makes any Angular components' properties inaccessible using the **this** object. Consider the following example:

Template
```HTML
	<div *ngIf="isReportRendered">Report has been rendered!</div>
	<tr-viewer #viewer1
		...
		[renderingEnd]="reportRendered">
	</tr-viewer>
```

Component
```TypeScript
	export class AppComponent {
		isReportRendered = false;
		...
		reportRendered(e: any, args: any) {
			this.isReportRendered = true; // run-time error: isReportRendered is undefined here
		}
	}
```



## Suggested Workarounds
It is possible to change the scope of the **reportRendered** function to the *AppComponent* scope as shown in the following example:

Template
```HTML
	<div *ngIf="isReportRendered">Report has been rendered!</div>
	<tr-viewer #viewer1
		...
		[renderingEnd]="boundReportRendered">
	</tr-viewer>
```

Component
```TypeScript
	export class AppComponent {
		boundReportRendered: Function;
		isReportRendered = false;
		...
		public ngOnInit(){
			this.boundReportRendered = this.reportRendered.bind(this);
		}
		
		reportRendered(e: any, args: any) {
			this.isReportRendered = true; // displays the initially hidden div element
		}
	}
```