---
title: Initialization
page_title: Web Report Designer Initialization Options
description: "Learn more about the initialization options of the Telerik Web Report Designer and how to configure them."
slug: telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization
tags: report,webreportdesigner,initialization
published: True
position: 7
---

<style>
table th:first-of-type {
	width: 28%;
}
table th:nth-of-type(2) {
	width: 72%;
}
</style>

# Web Report Designer Initialization

The Telerik Web Report Designer is a jQuery plugin - `jQuery.fn.telerik_WebReportDesigner(options)`. Below is a list of all options available during initialization.

## Options

| Parameter | Description |
| ------ | ------ |
| __id__ | *string*, *optional*; Sets the unique identifier of the WebReportDesigner instance;|
| __serviceUrl__ | *string*, *required*; Sets the URL (relative or absolute) which will provide the service for the web report designer client;|
| __report__ | *string*, *required*; Sets the report that will be initially opened when the web report designer is started;|
| __reportViewerOptions__ | *json*, *optional*; Sets the options of the embedded Report Viewer used when previewing the reports.<br />Here are the currently available options:<ul><li>templateUrl</li><li>scaleMode</li><li>scale</li><li>pageMode</li><li>viewMode</li></ul>Additional information about how these options affect the embedded Report Viewer can be found at the [HTML5 Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) documentation article. |
| __persistSession__ | *boolean*, *optional*;  Sets a value indicating whether the designer's client state will be persisted between the page refreshes/postbacks. The state is stored in the browser's sessionStorage and is available for the duration of the page session.
| __keepClientAlive__ | *boolean, optional*; Sets a value indicating whether the client will be kept alive. When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration. <br/> When set to false, the client will be left to expire;|
| __promptOnDiscardingModifiedReport__ | *boolean*, *optional*; Sets a value indicating whether a browser prompt will be displayed when a report is modified and the user attempts to leave the page.|
| __toolboxArea__ | *json*, *optional*; Sets the Toolbox area options.|
| __propertiesArea__ | *json*, *optional*; Sets the Properties area options.|
| __skipOnboarding__ | *boolean, optional*; Sets a value indicating whether the _Onboarding Guide_ should be skipped on startup. If not set or set to false, the Onboarding Guide will check whether it has been run before and if not, it will start after the designer surface has loaded. If the guide has been run before, nothing will happen.|
| __error__ | *function(e, args)*;*optional*; A callback function that will be called when an error occurs. Introduced with [R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010).<ul><li>__e__: jQuery event;</li><li>__args__: `IErrorEventArgs` with properties:<ul><li>__message__: error message, *string*;</li><li>__error__: JavaScript Error instance;</li></ul></li></ul>|
| __notificationShowing__ | *function(e, args)*;*optional*; A callback function that will be called when the user should be notified of an error, etc. Introduced with [R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010).<ul><li>__e__: jQuery event;</li><li>__args__: `INotificationErrorEventArgs` with properties:<ul><li>__type__: *string*, obtained from `NotificationTypes`. Available values: `info`, `warning`, `error`, `success`</li><li>__message__: error message, *string*;</li><li>__error__: JavaScript Error instance;</li><li>__cancel__: *boolean*, determines whether to cancel showing  notifications;</li></ul></li></ul>|

## Examples

To initialize the web report designer:

````JavaScript
$(document).ready(function () {
	$("#webReportDesigner").telerik_WebReportDesigner({
		toolboxArea: {
			layout: "list"
		},
		propertiesArea: {
			layout: "alphabetical" 
		},
		skipOnboarding: false,
		serviceUrl: "api/reportdesigner/",
		report: "Report Catalog.trdp",
		reportViewerOptions: {
			scaleMode: "SPECIFIC",
			scale: 1.5,
			templateUrl: "api/reportdesigner/resources/templates/telerikReportViewerTemplate.html/",
			viewMode: "INTERACTIVE",
			pageMode: "SINGLE_PAGE"
		},
		error: onError,
		notificationShowing: onNotificationShowing
	}).data("telerik_WebDesigner");
});

function onError(e, args) {
	// e: jQuery event;
	// args: IErrorEventArgs ->
		// message: error message, string;
		// error: JS's Error instance.

	if (args.error) {
		console.log(`An error occurred! Message: ${args.message}; Error type: ${args.error.constructor.name}`);
	} else {
		console.log(`An error occurred! Message: ${args.message};`);
	}
}

function onNotificationShowing(e, args) {
	// e: jQuery event
	// args: INotificationErrorEventArgs ->
		// type: string, obtained from NotificationTypes. Available values: info, warning, error, success
		// message: notification message, string.
		// error: JS's Error instance
		// cancel: boolean, determines if showing the notification will be canceled.
	switch (args.type) {
		case "success":
		case "info":
		case "warning":
			console.log(`Message: ${args.message}`);
			// disable the notification pop-up.
			args.cancel = true;
			break;

		case "error":
			if (args.error) {
				console.log(`Error message: ${args.message}; Error type: ${args.error.constructor.name}`);
			} else {
				console.log(`Error message: ${args.message};`);
			}
			break;
	}
}
````

