---
title: Initialization
page_title: Web Report Designer Initialization Options
description: "Learn more about the initialization options of the Telerik Web Report Designer and how to configure them."
slug: telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization
tags: report,webreportdesigner,initialization
published: True
reportingArea: WRDHTML5
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

<table>
	<thead>
		<tr>
			<th>Parameter</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><strong>id</strong></td>
			<td><i>string</i>, <i>optional</i>; Sets the unique identifier of the WebReportDesigner instance;</td>
		</tr>
		<tr>
			<td><strong>serviceUrl</strong></td>
			<td><i>string</i>, <i>required</i>; Sets the URL (relative or absolute) which will provide the service for the web report designer client;</td>
		</tr>
		<tr>
			<td><strong>report</strong></td>
			<td><i>string</i>, <i>required</i>; Sets the report that will be initially opened when the web report designer is started;</td>
		</tr>
		<tr>
			<td><strong>reportViewerOptions</strong></td>
			<td><i>json</i>, <i>optional</i>; 
			
			Sets the options of the embedded Report Viewer used when previewing the reports.<br />
			
			Here are the currently available options:
			<ul>
				<li>templateUrl</li>
				<li>scaleMode</li>
				<li>scale</li>
				<li>pageMode</li>
				<li>viewMode</li>
				<li>reportSourceParameters</li>
			</ul>
			
			Additional information about how these options affect the embedded Report Viewer can be found at the <a href="{%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}">HTML5 Report Viewer Initialization</a> documentation article.</td>
		</tr>
		<tr>
			<td><strong>persistSession</strong></td>
			<td><i>boolean</i>, <i>optional</i>;  Sets a value indicating whether the designer's client state will be persisted between the page refreshes/postbacks. The state is stored in the browser's sessionStorage and is available for the duration of the page session.</td>
		</tr>
		<tr>
			<td><strong>keepClientAlive</strong></td>
			<td><i>boolean, optional</i>; Sets a value indicating whether the client will be kept alive. When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration. <br/> When set to false, the client will be left to expire;</td>
		</tr>
		<tr>
			<td><strong>promptOnDiscardingModifiedReport</strong></td>
			<td><i>boolean</i>, <i>optional</i>; Sets a value indicating whether a browser prompt will be displayed when a report is modified and the user attempts to leave the page.</td>
		</tr>
		<tr>
			<td><strong>toolboxArea</strong></td>
			<td><i>json</i>, <i>optional</i>; Sets the Toolbox area options.</td>
		</tr>
		<tr>
			<td><strong>propertiesArea</strong></td>
			<td><i>json</i>, <i>optional</i>; Sets the Properties area options.</td>
		</tr>
		<tr>
			<td><strong>skipOnboarding</strong></td>
			<td><i>boolean, optional</i>; Sets a value indicating whether the <i>Onboarding Guide</i> should be skipped on startup. If not set or set to false, the Onboarding Guide will check whether it has been run before and if not, it will start after the designer surface has loaded. If the guide has been run before, nothing will happen.</td>
		</tr>
		<tr>
			<td><strong>startMode</strong></td>
			<td><i>string, optional</i>; Determines whether the widget will start in <strong>design</strong> or <strong>preview</strong> mode. <br />
		</tr>
	<tbody>
</table>


## Events

### `error` Event

The `error` event will be fired when an error occurs while using `design` mode in the Web Report Designer. The event was introduced with the [R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010) release.
````JavaScript
$(document).ready(function () {
	$("#webReportDesigner").telerik_WebReportDesigner({
		persistSession: false,
		toolboxArea: {
			layout: "list"
		},
		serviceUrl: "api/reportdesigner/",
		report: "Dashboard.trdp",
		// design/preview
		startMode: "design",
		error: onError
	}).data("telerik_WebReportDesigner");
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
````

### `notificationShowing` Event

The `notificationShowing` event will be fired when the user should be notified of an error, warning, etc. while using `design` mode in the Web Report Designer. The event was introduced with the [R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010) release.The event may be used to disable the notification pop-up or even display a custom message in the console.

````JavaScript
$(document).ready(function () {
	$("#webReportDesigner").telerik_WebReportDesigner({
		persistSession: false,
		toolboxArea: {
			layout: "list"
		},
		serviceUrl: "api/reportdesigner/",
		report: "Dashboard.trdp",
		// design/preview
		startMode: "design",
		notificationShowing: onNotificationShowing
	}).data("telerik_WebReportDesigner");
});

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

### `viewerInitializing` Event

The `viewerInitializing` event will be fired when the Web Report Designer widget is first initialized on the page. The event may be used to further modify the viewer options and attach event handlers to the events of the report viewer.

````JavaScript
$(document).ready(function () {
	$("#webReportDesigner").telerik_WebReportDesigner({
		persistSession: false,
		toolboxArea: {
			layout: "list"
		},
		serviceUrl: "api/reportdesigner/",
		report: "Dashboard.trdp",
		// design/preview
		startMode: "design",
		viewerInitializing: onViewerInitializing
	}).data("telerik_WebReportDesigner");
});

function onViewerInitializing(e, args) {
	// e: jQuery event;
	// args: IViewerPreInitEventArgs ->
	//      reportViewerOptions: report viewer's options. All viewer's options available.

	args.reportViewerOptions.parameters = {
		editors: {
			singleSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,
			multiSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX
		}
	};
	args.reportViewerOptions.renderingBegin = onViewerRenderingBegin;
	args.reportViewerOptions.renderingEnd = onViewerRenderingEnd;
}

function onViewerRenderingBegin(e) {
	console.log('TRV rendering begin.');
}

function onViewerRenderingEnd(e) {
	console.log('TRV rendering end');
}
````

### `viewerLoading` Event

The `viewerLoading` event will be fired whenever the Web Report Designer widget switches to `preview` mode and the internal report viewer widget starts loading the current report. The event may be used to set specific viewer options/parameters for a given report, etc.

````JavaScript
$(document).ready(function () {
	$("#webReportDesigner").telerik_WebReportDesigner({
		persistSession: false,
		toolboxArea: {
			layout: "list"
		},
		serviceUrl: "api/reportdesigner/",
		report: "Dashboard.trdp",
		// design/preview
		startMode: "design",
		viewerLoading: onViewerLoading
	}).data("telerik_WebReportDesigner");
});

function onViewerLoading(e, args) {
	// e: jQuery event;
	// args: IViewerPreLoadEventArgs ->
	//		reportViewerOptions: report viewer's options. Available options:
	//			reportSource: report viewer's report source.
	//			viewMode: report viewer's view mode.
	//			pageMode: report viewer's page mode.
	setReportParameters(args.reportViewerOptions.reportSource);
	setReportOptions(args.reportViewerOptions);
}

function setReportParameters(reportSource) {
	if (reportSource.report === "Dashboard.trdp") {
		reportSource.parameters = { ReportYear: 2003 };
	}
}

function setReportOptions(reportViewerOptions) {
	const report = reportViewerOptions.reportSource.report;
	if (report === "Product Tag Report.trdp") {
		reportViewerOptions.pageMode = telerikReportViewer.PageModes.CONTINUOUS_SCROLL;
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.PRINT_PREVIEW;
	} else if (report === "Product Catalog.trdp") {
		reportViewerOptions.pageMode = telerikReportViewer.PageModes.SINGLE_PAGE;
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.INTERACTIVE;
	} else if (report === "Dashboard.trdp") {
		reportViewerOptions.pageMode = telerikReportViewer.PageModes.CONTINUOUS_SCROLL;
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.PRINT_PREVIEW;
	} else if (report === "Report1.trdp") {
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.PRINT_PREVIEW;
	}
}
````

## Initialization Example with Full Settings

````JavaScript
$(document).ready(function () {
	window.TelerikWebReportDesignerDebugMode = true;
	$("#webReportDesigner").telerik_WebReportDesigner({
		persistSession: false,
		toolboxArea: {
			layout: "list"
		},
		serviceUrl: "api/reportdesigner/",
		report: "Dashboard.trdp",
		// design/preview
		startMode: "design",
		reportViewerOptions: {
			reportSourceParameters: {
				ReportYear: 2002
			},
			scaleMode: "SPECIFIC",
			scale: 1.5,
			viewMode: "INTERACTIVE",
			pageMode: "CONTINUOUS_SCROLL"
		},
		error: onError,
		notificationShowing: onNotificationShowing,
		viewerInitializing: onViewerInitializing,
		viewerLoading: onViewerLoading
	}).data("telerik_WebReportDesigner");
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

function onViewerInitializing(e, args) {
	// e: jQuery event;
	// args: IViewerPreInitEventArgs ->
	//      reportViewerOptions: report viewer's options. All viewer's options available.

	args.reportViewerOptions.parameters = {
		editors: {
			singleSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,
			multiSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX
		}
	};
	args.reportViewerOptions.renderingBegin = onViewerRenderingBegin;
	args.reportViewerOptions.renderingEnd = onViewerRenderingEnd;
}

function onViewerLoading(e, args) {
	// e: jQuery event;
	// args: IViewerPreLoadEventArgs ->
	//      reportViewerOptions: report viewer's options. Available options:
	//          reportSource: report viewer's report source.
	//          viewMode: report viewer's view mode.
	//          pageMode: report viewer's page mode.
	setReportParameters(args.reportViewerOptions.reportSource);
	setReportOptions(args.reportViewerOptions);
}

function setReportParameters(reportSource) {
	if (reportSource.report === "Dashboard.trdp") {
		reportSource.parameters = { ReportYear: 2003 };
	}
}

function setReportOptions(reportViewerOptions) {
	const report = reportViewerOptions.reportSource.report;
	if (report === "Product Tag Report.trdp") {
		reportViewerOptions.pageMode = telerikReportViewer.PageModes.CONTINUOUS_SCROLL;
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.PRINT_PREVIEW;
	} else if (report === "Product Catalog.trdp") {
		reportViewerOptions.pageMode = telerikReportViewer.PageModes.SINGLE_PAGE;
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.INTERACTIVE;
	} else if (report === "Dashboard.trdp") {
		reportViewerOptions.pageMode = telerikReportViewer.PageModes.CONTINUOUS_SCROLL;
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.PRINT_PREVIEW;
	} else if (report === "Report1.trdp") {
		reportViewerOptions.viewMode = telerikReportViewer.ViewModes.PRINT_PREVIEW;
	}
}

function onViewerRenderingBegin(e) {
	console.log('TRV rendering begin.');
}

function onViewerRenderingEnd(e) {
	console.log('TRV rendering end');
}
````
