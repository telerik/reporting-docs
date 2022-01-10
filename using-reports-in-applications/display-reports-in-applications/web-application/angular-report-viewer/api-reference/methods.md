---
title: Methods
page_title: Methods | for Telerik Reporting Documentation
description: Methods
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/methods
tags: methods
published: True
position: 2
---

# Methods



Each method can be called using a reference to the report viewer component.         

    
````TypeScript
<tr-viewer #viewer1
...
<button (click)="viewer1.refreshReport()">Refresh</button>
````

The example above refreshes the report viewer.         

The following table lists the available methods:         

|  __Method__  |  __Description__  |
| ------ | ------ |
| __refreshReport()__ |Reloads/refreshes the current report. __Returns__ : the current ReportViewer object.|
| __getReportSource(): any__ |Gets the current ReportSource - report and parameters. __Returns__ : object with properties:<br/>* report: string<br/>* parameters: JSON|
| __setReportSource(rs: JSON)__ |Sets the report source - report and parameters. Automatically reloads the report (if any) into the view. __Parameters__ : rs; rs is an object with the following properties:<br/>* report: string<br/>* parameters: JSON __Returns__ : the current ReportViewer object.|
| __getViewMode(): string__ |Gets the current view mode. __Returns__ : string.|
| __setViewMode(vm: string)__ |Sets the view mode and automatically reloads the current report (if any) into the new view. __Parameters__ : vm: string __Returns__ : the current ReportViewer object.|
| __getScale(): any__ |Gets the viewer’s scale factor and scale mode. __Returns__ : object with properties:<br/>* scale: number<br/>* scaleMode: string|
| __setScale(scale: any)__ |Sets the scale factor and scale mode. __Parameters__ : scale; scale is an object with the following properties:<br/>* scale: number<br/>* scaleMode: string __Returns__ : the current ReportViewer object.|
| __getPageMode(): string__ |Gets the viewer’s page mode. __Returns__ : string.|
| __setPageMode(psm: string)__ |Sets the page mode and automatically reloads the current report (if any) into the new view. __Parameters__ : psm: string. __Returns__ : the current ReportViewer object.|
| __clearReportSource()__ |Clears the current reportSource from the viewer internal state and from its persisted session in the browser.               Called in order to force the viewer to respect the newly set reportSource on the next postback.|
| __pageCount(): number__ |Gets the total page count of viewer’s currently displayed report. __Returns__ : number.|
| __currentPage(): number__ |Gets the viewer’s current page that is displayed. __Returns__ : number.|
| __setAuthenticationToken(token: string)__ |Sets the authentication token. __Parameters__ : token: string __Returns__ : the current ReportViewer object.|
| __getAccessibilityKeyMap(): JSON__ |Gets the shortcut keys used when the report viewer is in accessible mode (has its enableAccessibility set to true. The keys in the map are listed below|

 Key | Default Value | Description |
| ------ | ------ | ------ |
|CONFIRM_KEY|13 *('enter')* |Key for triggering the actions in the report content and previewing the report from the __Preview__ button in parameters area, if available.|
|MENU_AREA_KEY|77 *('m')* |Key for moving the focus to the menu area, if visible.|
|CONTENT_AREA_KEY|67 *('c')* |Key for moving the focus to the report content area, if visible.|
|PARAMETERS_AREA_KEY|80 *('p')* |Key for moving the focus to the parameters area, if visible.|
|DOCUMENT_MAP_AREA_KEY|68 *('d')* |Key for moving the focus to the document map area, if visible.

|   |   |
| ------ | ------ |
|
| __setAccessibilityKeyMap(keyMap: JSON)__ |Sets the shortcut keys used when the report viewer is in accessible mode.                 It is recommended to set the new key map when the report rendering is complete,                 because the accessibility routines require the report viewer template to be loaded. __Parameters__ : keyMap: JSON|
| __dispose()__ |Stops sending keep alive requests to the server, if keep client alive was enabled|

