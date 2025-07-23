---
title: Events
page_title: Native Angular Report Viewer Events
description: "Learn about what are the events exposed by the Native Angular Report Viewer and how to use them in your application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events
tags: events,angular,report,viewer
published: True
position: 2
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

In this article, we will go over each of the currently available events, showcasing how to attach an event listener to each one as well as what information will be sent through the event.

## Events List

### updateUI

The `updateUI` event will be emitted when the state of the viewer changes.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(updateUI)="updateUI()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		updateUI() {
			console.log("This event handler will be called when the state of the viewer changes.");
		};
	}
````


### printStarted

The `printStarted` event will be emitted when the printing starts.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(printStarted)="printStarted()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		printStarted() {
			console.log("This event will be emitted when the printing starts.");
		};
	}
````


### printDocumentReady

The `printDocumentReady` event will be emitted after the viewer finishes printing the report.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(printDocumentReady)="printDocumentReady()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		printDocumentReady() {
			console.log("This event will be emitted after the viewer finishes printing the report.");
		};
	}
````


### exportStarted

The `exportStarted` event will be emitted when an export operation is triggered.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(exportStarted)="exportStarted()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		exportStarted() {
			console.log("This event will be emitted when an export operation is triggered.");
		};
	}
````


### exportDocumentReady

The `exportDocumentReady` event will be emitted after the viewer finishes exporting the report.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(exportDocumentReady)="exportDocumentReady()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		exportDocumentReady() {
			console.log("This event will be emitted after the viewer finishes exporting the report.");
		};
	}
````


### beforeLoadReport

The `beforeLoadReport` event will be emitted before the rendering of a report begins.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(beforeLoadReport)="beforeLoadReport()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		beforeLoadReport() {
			console.log("This event will be emitted before the rendering of a report begins.");
		};
	}
````


### beginLoadReport

The `beginLoadReport` event will be emitted after the rendering of a report begins.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(beginLoadReport)="beginLoadReport()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		beginLoadReport() {
			console.log("This event will be emitted after the rendering of a report begins.");
		};
	}
````


### reportLoadProgress

The `reportLoadProgress` event will be emitted after each successful [`Get Document Info`]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-info%}) request until the report rendering is complete.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(reportLoadProgress)="reportLoadProgress($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
import { DocumentInfo } from '@progress/telerik-common-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		reportLoadProgress(e: DocumentInfo) {
			console.log("The e parameter will contain the current information for the report rendering progress.", e);
			console.log("This event will be emitted after each successful Get Document Info request until the report rendering is complete.");
		};
	}
````


### reportLoadComplete

The `reportLoadComplete` event will be emitted after the rendering of a report ends.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(reportLoadComplete)="reportLoadComplete($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
import { DocumentInfo } from '@progress/telerik-common-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		reportLoadComplete(e: DocumentInfo) {
			console.log("The document information such as the page count, where it has document map, etc. will ve sent via the e object.", e);
			console.log("This event will be emitted after the rendering of a report ends.");
		};
	}
````


### renderingStopped

The `renderingStopped` event will be emitted when report rendering is cancelled.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(renderingStopped)="renderingStopped()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		renderingStopped() {
			console.log("This event will be emitted when report rendering is cancelled.");
		};
	}
````


### error

The `error` event will be emitted when viewer encounters an error.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(error)="error($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		error(e: string) {
			console.log("This event will be emitted when viewer encounters an error.");
			console.log("The error message", e);
		};
	}
````


### loadedReportChange

The `loadedReportChange` event will be emitted when the previewed report is __changed__ or __refreshed__.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(loadedReportChange)="loadedReportChange()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		loadedReportChange() {
			console.log("This event will be emitted when the loaded report is changed.");
		};
	}
````


### pageReady

The `pageReady` event will be emitted when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(pageReady)="pageReady($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
import { PageInfo } from '@progress/telerik-common-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		pageReady(e: PageInfo) {
			console.log("The current page information such as the page number, the page content, etc.", e)
			console.log("This event will be emitted when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it.");
		};
	}
````


### navigateToReport

The `navigateToReport` event will be emitted when the viewer navigates to a new report through the [`Drillthrough/Navigate To Report Action`]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}).

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(navigateToReport)="navigateToReport($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		navigateToReport(e: any) {
			console.log("The report source object of the newly loaded report", e)
			console.log("This event will be emitted when the viewer navigates to a new report through the Drillthrough/Navigate To Report action.");
		};
	}
````

### currentPageChanged

The `currentPageChanged` event will be emitted when the viewer changes its currently displayed page.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(currentPageChanged)="currentPageChanged($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		currentPageChanged(e: { page number, reportDocumentId: string }) {
			console.log("The page number and document id", e)
			console.log("This event will be emitted when the viewer changes its currently displayed page.");
		};
	}
````


### interactiveActionExecuting

The `interactiveActionExecuting` event will be emitted before an interactive action is executed.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(interactiveActionExecuting)="interactiveActionExecuting()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		interactiveActionExecuting() {
			console.log("This event will be emitted before an interactive action is executed.");
		};
	}
````


### reportVersionMismatch

The `reportVersionMismatch` event will be emitted when there is a mismatch between the version of the viewer and the reporting service.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(reportVersionMismatch)="reportVersionMismatch()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		reportVersionMismatch() {
			console.log("This event will be emitted when there is mismatch between the version of the viewer and the reporting service.");
		};
	}
````


### parametersLoaded

The `parametersLoaded` event will be emitted after the [`Get Report Parameters `]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-parameters-api/get-report-parameters%}) is made.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(parametersLoaded)="parametersLoaded($event)">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
import { ReportParameterInfo } from '@progress/telerik-common-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		parametersLoaded(e: ReportParameterInfo[]) {
			console.log("An array of the parameter values is sent via the event object.", e);
			console.log("This event will be emitted after the Get Report Parameters request is made.");
		};
	}
````


### scaleChanged

The `scaleChanged` event will be emitted when the scale property of the report viewer is changed.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(scaleChanged)="scaleChanged()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		scaleChanged() {
			console.log("This event will be emitted when the scale property of the report viewer is changed.");
		};
	}
````


### scaleModeChanged

The `scaleModeChanged` event will be emitted when the scaleMode property of the report viewer is changed.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(scaleModeChanged)="scaleModeChanged()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		scaleModeChanged() {
			console.log("This event will be emitted when the scaleMode property of the report viewer is changed.");
		};
	}
````


### viewModeChanged

The `viewModeChanged` event will be emitted when the viewMode property of the report viewer is changed.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(viewModeChanged)="viewModeChanged()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		viewModeChanged() {
			console.log("This event will be emitted when the viewMode property of the report viewer is changed.");
		};
	}
````


### missingOrInvalidParameters

The `missingOrInvalidParameters` event will be emitted when the previewed report requires parameters that have missing or invalid values.

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="{
		report: 'Dashboard.trdx', 
		parameters: { ReportYear: 2004 }
	}"
	[serviceUrl]="'https://demos.telerik.com/reporting/api/reports'"
	viewMode="interactive"
	[keepClientAlive]="true"
	(missingOrInvalidParameters)="missingOrInvalidParameters()">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;

		missingOrInvalidParameters() {
			console.log("This event will be emitted when the previewed report requires parameters that have missing or invalid values.");
		};
	}
````

