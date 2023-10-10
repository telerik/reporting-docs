---
title: Commands
page_title: Native Angular Report Viewer Command 
description: "Learn about what are the commands exposed by the Native Angular Report Viewer and how you may use them to perform certain operations in code."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands
tags: commands
published: True
position: 1
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 30%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# Commands Overview

The Native Angular Report Viewer exposes the ability to trigger various commands via the `executeCommand` method which accepts the name of the command as the first parameter and the command value(optional).

## Commands Usage Example

The following example illustrates a list of all the available commands in the viewer, and how they may be invoked:

````HTML
<reporting-angular-viewer
	#viewer
	[contentTabIndex]="2001"
	[reportSource]="reportSource"
	[serviceUrl]="serviceUrl"
	viewMode="interactive"
	[keepClientAlive]="true">
</reporting-angular-viewer>

<div class="func-btn-wrapper">
	<button
		kendoButton
		class="func-btn"
		*ngFor="let button of buttons"
		(click)="execute(button.commandName, button.commandValue)"> {{button.name}}
	</button>
</div>
````
````TypeScript
import { Component, ViewChild  } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
import { ReportSourceOptions } from '@progress/telerik-common-report-viewer'
	
interface commandButtons {
	name: string;
	commandName: string;
	commandValue?: any
}

@Component({
	selector: 'app-root',
	styles: [`.func-btn-wrapper {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		gap: 1rem;
		padding: 2rem;
		padding-top: 0.5rem;
		margin-top: 2rem;
		justify-content: center;
		align-items: center;
		border-top: 1px solid #7e7d7d;
	}`],
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss']
})
	
export class AppComponent {
	title = 'Native Angular Report Viewer Demo';

	@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

	reportSource: ReportSourceOptions = { report: "Dashboard.trdx", parameters: { ReportYear: 2004 } };
	serviceUrl: string = "https://demos.telerik.com/reporting/api/reports";

	public buttons: Array<commandButtons> = [
		{ name: 'navigateBackward', commandName: 'navigateBackward' },
		{ name: 'navigateForward', commandName: 'navigateForward' },
		{ name: 'stopRendering', commandName: 'stopRendering' },
		{ name: 'refreshReport', commandName: 'refreshReport' },
		{ name: 'navigateToFirstPage', commandName: 'navigateToFirstPage' },
		{ name: 'navigateToPrevPage', commandName: 'navigateToPrevPage' },
		{ name: 'navigateToNextPage', commandName: 'navigateToNextPage' },
		{ name: 'navigateToLastPage', commandName: 'navigateToLastPage' },
		{ name: 'toggleDocumentMap', commandName: 'toggleDocumentMap' },
		{ name: 'toggleParametersSection', commandName: 'toggleParametersSection' },
		{ name: 'setViewMode', commandName: 'setViewMode' },
		{ name: 'zoomIn', commandName: 'zoomIn' },
		{ name: 'zoomOut', commandName: 'zoomOut' },
		{ name: 'setScaleMode', commandName: 'setScaleMode', commandValue: { scale: 3, scaleMode: 'Specific' } },
		{ name: 'exportReport', commandName: 'exportReport', commandValue: 'csv'  },
		{ name: 'setAuthenticationToken', commandName: 'setAuthenticationToken', commandValue: 'Sample Authentication Token'  },
		{ name: 'printReport', commandName: 'printReport' },
		{ name: 'toggleSearchWindow', commandName: 'toggleSearchWindow' },
	]

	public execute(commandName: string, commandValue?: any): void {
		this.viewer.executeCommand(commandName, commandValue);
	}
}
````

## Commands List

| Command name | Command value | Description |
| ------ | ------ | ------ |
|navigateBackward|none|Goes back to the previously rendered report from history.|
|navigateForward|none|Goes forward to the previously rendered report from history.|
|refreshReport|none|Refreshes the report.|
|navigateToFirstPage|none|Goes to the first page of the report.|
|navigateToPrevPage|none|Goes to the previous page of the report.|
|navigateToNextPage|none|Goes to the next page of the report.|
|navigateToLastPage|none|Goes to the last page of the report.|
|setViewMode|none|Toggles between Print Preview and Interactive view modes.|
|setScaleMode| An object with `scaleMode`(and `scale` for'specific' scale mode is used)|Changes the viewer's scaleMode|
|setAuthenticationToken | authentication token| A bearer token to be added in the Authorization token of each request|
|exportReport|rendering extension name|Exports the report, using the respective rendering extension name.|
|printReport|none|Triggers the report printing.|
|toggleDocumentMap|none|Shows or hides the document map.|
|toggleParametersSection|none|Shows or hides the parameters area.|
|toggleSearchWindow|none|Shows or hides the search dialog.|
|zoomIn|none|Zoom-in the report.|
|zoomOut|none|Zoom-out the report.|
