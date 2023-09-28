---
title: Methods
page_title: Angular Report Viewer Methods 
description: "Learn about what are the methods exposed by the Angular Report Viewer and how they may be used in your application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/methods
tags: methods,angular,report,viewer
published: True
position: 2
previous_url: /angular-report-viewer-api-methods
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# Methods Overview

Each method can be called using a reference to the report viewer component.

````HTML
<tr-viewer #viewer1 />
...
<button (click)="viewer1.refreshReport()">Refresh</button>
````

The example above refreshes the report viewer.

The following table lists the available methods:

| __Method__ | __Description__ |
| ------ | ------ |
| __refreshReport()__ |Reloads/refreshes the current report. <br/>__Returns__ : the current ReportViewer object.|
| __getReportSource(): any__ |Gets the current ReportSource - report and parameters. <br/>__Returns__ : object with properties: <ul><li>report: string</li><li>parameters: JSON</li></ul>|
| __setReportSource(rs: JSON)__ |Sets the report source - report and parameters. Automatically reloads the report (if any) into the view. <br/>__Parameters__ : rs; rs is an object with the following properties: <ul><li>report: string</li><li>parameters: JSON</li></ul>__Returns__ : the current ReportViewer object.|
| __getReportParameters(): any__ |Returns an immutable array of name-value objects representing the current evaluated report parameters.<br/>__Returns__ : array containing the name and the value of each report parameter.|
| __getViewMode(): string__ |Gets the current view mode. <br/>__Returns__ : string.|
| __setViewMode(vm: string)__ |Sets the view mode and automatically reloads the current report (if any) into the new view. <br/>__Parameters__ : vm: string <br/>__Returns__ : the current ReportViewer object.|
| __getScale(): any__ |Gets the viewer’s scale factor and scale mode. <br/>__Returns__ : object with properties: <ul><li>scale: number</li><li>scaleMode: string</li></ul>|
| __setScale(scale: any)__ |Sets the scale factor and scale mode. <br/>__Parameters__ : scale; scale is an object with the following properties: <ul><li>scale: number</li><li>scaleMode: string</li></ul>__Returns__ : the current ReportViewer object.|
| __getPageMode(): string__ |Gets the viewer’s page mode. <br/>__Returns__ : string.|
| __setPageMode(psm: string)__ |Sets the page mode and automatically reloads the current report (if any) into the new view. <br/>__Parameters__ : psm: string. <br/>__Returns__ : the current ReportViewer object.|
| __clearReportSource()__ |Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on the next postback.|
| __pageCount(): number__ |Gets the total page count of viewer’s currently displayed report. <br/>__Returns__ : number.|
| __currentPage(): number__ |Gets the viewer’s current page that is displayed. <br/>__Returns__ : number.|
| __setAuthenticationToken(token: string)__ |Sets the authentication token. <br/>__Parameters__ : token: string <br/>__Returns__ : the current ReportViewer object.|
| __getAccessibilityKeyMap(): JSON__ |Gets the shortcut keys used when the report viewer is in accessible mode (has its enableAccessibility set to true. The keys in the map are listed below: <br/><table><thead><tr><th>Key</th><th>Default Value</th><th>Description</th></tr></thead><tbody><tr><td>CONFIRM_KEY</td><td>13 <em>('enter')</em></td><td>Key for triggering the actions in the report content and previewing the report from the <strong>Preview</strong> button in parameters area, if available.</td></tr><tr><td>MENU_AREA_KEY</td><td>77 <em>('m')</em></td><td>Key for moving the focus to the menu area, if visible.</td></tr><tr><td>CONTENT_AREA_KEY</td><td>67 <em>('c')</em></td><td>Key for moving the focus to the report content area, if visible.</td></tr><tr><td>PARAMETERS_AREA_KEY</td><td>80 <em>('p')</em></td><td>Key for moving the focus to the parameters area, if visible.</td></tr><tr><td>DOCUMENT_MAP_AREA_KEY</td><td>68 <em>('d')</em></td><td>Key for moving the focus to the document map area, if visible.</td></tr></tbody></table> |
| __setAccessibilityKeyMap(keyMap: JSON)__ |Sets the shortcut keys used when the report viewer is in accessible mode. It is recommended to set the new key map when the report rendering is complete, because the accessibility routines require the report viewer template to be loaded. <br/>__Parameters__ : keyMap: JSON|
| __dispose()__ |Stops sending keep alive requests to the server, if keep client alive was enabled.|
