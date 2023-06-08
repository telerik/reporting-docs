---
title: Accessing Component Properties Inside Angular Report Viewer Events
page_title: Accessing Angular Component Properties in Report Viewer Events
description: "Learn how to access the component properties inside Telerik Reporting Angular Report Viewer events using 'this' keyword."
type: troubleshooting
slug: angular-component-properties-in-viewer-events
tags: telerik, reporting, access, angular, component, properties, inside, reportviewer, events
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

How can I access the properties of an Angular component from the report viewer events?

## Cause

Inside the [Angular Report Viewer events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/event-binding%}), the `this` value will point to the report viewer object. This makes the properties of any Angular component inaccessible in report viewer events.

Consider the following example:

**Template**

````HTML
<div *ngIf="isReportRendered">Report has been rendered!</div>
<tr-viewer #viewer1
	...
	[renderingEnd]="reportRendered">
</tr-viewer>
````

**Component**

````TypeScript
export class AppComponent {
	isReportRendered = false;
	...
	reportRendered(e: any, args: any) {
		this.isReportRendered = true; // run-time error: isReportRendered is undefined here
	}
}
````

## Solution

To work around the issue, it is possible to create a new bound function which wraps the `reportRendered` function. The new bound function will have a `this` value equal to the `this` value of the `AppComponent`.

**Template**

````HTML
<div *ngIf="isReportRendered">Report has been rendered!</div>
<tr-viewer #viewer1
	...
	[renderingEnd]="boundReportRendered">
</tr-viewer>
````

**Component**

````TypeScript
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
````

## See Also

* [`Function.prototype.bind()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_objects/Function/bind)
