---
title: Events
page_title: Angular Report Viewer Events
description: "Learn about what are the events exposed by the Angular Report Viewer and how to use them in your application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events
tags: events,angular,report,viewer
published: True
reportingArea: AngularWrapper
position: 1
previous_url: /angular-report-viewer-api-events
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 70%;
}
</style>

# Events Overview

## How to use the Events

1. Create a handler function in the component's `.TS` file:

	````TypeScript
export class ReportViewerComponent implements AfterViewInit {
		@ViewChild('viewer1') viewer: TelerikReportViewerComponent;

		ready() {
			console.log('ready');
		}
		viewerToolTipOpening(e: any, args: any) {
			console.log('viewerToolTipOpening ' + args.toolTip.text);
		}
	}
````


1. In the `.HTML` component file, assing the handler to the corresponding event:

	````HTML
<tr-viewer #viewer1 [containerStyle]="viewerContainerStyle" [serviceUrl]="'http://localhost:59657/api/reports/'"
		[reportSource]="{
			report: 'Report1.trdp',
			parameters: {}
		}"
		[ready]="ready"
		[viewerToolTipOpening]="viewerToolTipOpening"
		[enableAccessibility]="false">
	</tr-viewer>
````


Below is a list of all available report viewer events.

## Events

| Parameter | Description |
| ------ | ------ |
| __ready__ | *function();* *optional;* A callback function that will be called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it. The function is executed in the context of the ReportViewer object that is available through the __this__ object.|
| __exportBegin__ | *function(e, args);optional;* A callback function that will be called prior to starting the report export command.|
| __exportEnd__ | *function(e, args);optional;* A callback function that will be called when the exported document is ready for download, but prior to the actual downloading.|
| __printBegin__ | *function(e, args);optional;* A callback function that will be called prior to starting the print report command.|
| __printEnd__ | *function(e, args);optional;* A callback function that will be called when the print document (Adobe PDF) is ready for download, but prior to being send to the printer.|
| __renderingBegin__ | *function(e, args);optional;* A callback function that will be called when the rendering of the report begins.|
| __renderingEnd__ | *function(e, args);optional;* A callback function that will be called when the rendering of the report ends.|
| __sendEmailBegin__ | *function(e, args);optional;* A callback function that will be called before the report is exported and the E-mail message is sent.|
| __sendEmailEnd__ | *function(e, args);optional;* A callback function that will be called after the report is exported and before the E-mail message is sent.|
| __updateUi__ | *function(e);optional;* A callback function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with the reports.|
| __pageReady__ | *function(e, args);optional;* A callback function that will be called every time a page from the report is rendered and ready for display.|
| __error__ | *function(e, args);optional;* A callback function that will be called when an error occurs.|
| __interactiveActionExecuting__ | *function(e, args);optional;* A callback function that will be called before an interactive action is executed,                 providing the ability to cancel the execution.|
| __interactiveActionEnter__ | *function(e, args);optional;* A callback function that will be called when the mouse cursor enters the area of an interactive action.|
| __interactiveActionLeave__ | *function(e, args);optional;* A callback function that will be called when the mouse cursor leaves the area of an interactive action.|
| __viewerToolTipOpening__ | *function(e, args);optional;* A callback function that will be called when a tooltip is being opened.|

For more details on each event and its arguments/return value, please refer to the [HTML5 Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error(e,-args)%}).
