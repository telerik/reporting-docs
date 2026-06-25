---
title: Initialization
page_title: Web Report Designer Initialization Options
description: "Learn more about the initialization options of the Telerik Web Report Designer and how to configure them."
slug: telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization
tags: report,webreportdesigner,initialization
published: True
reportingArea: WRDHTML5
position: 8
---

<style>
table th:first-of-type {
	width: 28%;
	text-align: center !important;
}

table td:first-of-type {
	text-align: center;
}

table th:nth-of-type(2) {
	width: 72%;
}
</style>

# Web Report Designer Initialization

The Telerik Web Report Designer is a jQuery plugin - `jQuery.fn.telerik_WebReportDesigner(options)`. Below is a list of all options available during initialization

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
			Sets the options of the embedded Report Viewer used when previewing the reports.
			<br />
			Here are the currently available options:
			<ul>
				<li>templateUrl</li>
				<li>scaleMode</li>
				<li>scale</li>
				<li>pageMode</li>
				<li>viewMode</li>
				<li>reportSourceParameters</li>
			</ul>
			Additional information about how these options affect the embedded Report Viewer can be found at the <a href="slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/overview">HTML5 Report Viewer Initialization</a> documentation article.
			</td>
		</tr>
		<tr>
			<td><strong>persistSession</strong></td>
			<td><i>boolean</i>, <i>optional</i>;  Sets a value indicating whether the designer's client state will be persisted between the page refreshes/postbacks. The state is stored in the browser's sessionStorage and is available for the duration of the page session.</td>
		</tr>
		<tr>
			<td><strong>keepClientAlive</strong></td>
			<td><i>boolean, optional</i>; Sets a value indicating whether the client will be kept alive. When set to true, a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration. <br/> When set to false, the client will be left to expire;</td>
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
			<td><i>boolean, optional</i>; Sets a value indicating whether the <i>Onboarding Guide</i> should be skipped on startup. If not set or set to false, the Onboarding Guide will check whether it has been run before, and if not, it will start after the designer surface has loaded. If the guide has been run before, nothing will happen.</td>
		</tr>
		<tr>
			<td><strong>skipCollectingUsageDataPrompt</strong></td>
			<td><i>boolean, optional</i>; Sets a value indicating whether the <i>Onboarding Guide</i> should start with the <strong>Help us improve!</strong> dialog. If not set or set to <i>false</i>, the Onboarding Guide will start with the dialog.<br/>The dialog asks whether the user agrees for the designer to collect non-personal usage data. This analytical data gives the Telerik Reporting team a valuable feedback helping to improve the Web Report Designer.<br/>The user may start/stop providing analytical data at any time. The current state of the agreement is kept by the <i>General</i> option <strong>Collect non-personal usage data</strong> of the <i>Workspace Preferences</i> menu item.</td>
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

{{source=CodeSnippets\Blazor\Docs\JavaScript\wrd_events.js region=WebDesignerEvents_Error}}

### `notificationShowing` Event

The `notificationShowing` event will be fired when the user should be notified of an error, warning, etc., while using `design` mode in the Web Report Designer. The event was introduced with the [R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010) release.The event may be used to disable the notification pop-up or even display a custom message in the console.

{{source=CodeSnippets\Blazor\Docs\JavaScript\wrd_events.js region=WebDesignerEvents_notificationShowing}}

### `viewerInitializing` Event

The `viewerInitializing` event will be fired when the Web Report Designer widget is first initialized on the page. The event may be used to further modify the viewer options and attach event handlers to the events of the report viewer.

{{source=CodeSnippets\Blazor\Docs\JavaScript\wrd_events.js region=WebDesignerEvents_viewerInitializing}}

### `viewerLoading` Event

The `viewerLoading` event will be fired whenever the Web Report Designer widget switches to `preview` mode and the internal report viewer widget starts loading the current report. The event may be used to set specific viewer options/parameters for a given report, etc.

{{source=CodeSnippets\Blazor\Docs\JavaScript\wrd_events.js region=WebDesignerEvents_viewerLoading}}

## Initialization Example with Full Settings

{{source=CodeSnippets\Blazor\Docs\JavaScript\wrd_events.js region=WebDesignerEvents_fullSettings}}
