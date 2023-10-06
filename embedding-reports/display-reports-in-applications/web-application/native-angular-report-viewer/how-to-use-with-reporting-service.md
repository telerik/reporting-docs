---
title: Integration with Reporting REST Service
page_title: Using Angular Report Viewer with a Reporting REST Service
description: "Learn how the Angular Report Viewer can be implemented in an Angular application that connects to a Reporting service with a few simple steps."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service
tags: how,to,use,angular,report,viewer,with,angular,cli
published: True
position: 2
---

# Integration with Reporting Service

This tutorial demonstrates how to add the native Angular Report Viewer component to a new Angular application.

## Prerequisites

The following list describes the prerequisites for completing the tutorial:

* Review the Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%}).
* [Angular CLI Project](https://angular.io/cli).
* A running application that hosts a Reporting REST service at address `/api/reports`. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).


###Steps:

1. Create new Angular application using the [Angular CLI](https://angular.io/cli).
1. Install the Native Angular Report Viewer NPM package with the following command:

	````powershell
npm install @progress/to-be-named
````

>For [Node.js](https://nodejs.org) version `16.0.0` and above, use the following flag to ensure all the correct peer dependencies versions are installed in your project.
	>
	>````powershell
npm install @progress/to-be-named --legacy-peer-deps
````


	>If you receive a *403 Forbidden Error*, you need to register and login at [npmjs.com](https://www.npmjs.com/) before performing this step.
	>
	>````powershell
npm login --registry=https://registry.npmjs.org --scope=@progress
````


1. Once installed, import the `ReportingAngularViewerModule` in [your application root module](https://angular.io/guide/ngmodules#!#angular-modularity):

	````TypeScript
import { ReportingAngularViewerModule } from 'viewer/src/lib/reporting-angular-viewer.module';
	...
	@NgModule({
		declarations: [
			AppComponent
		],
		imports: [
			BrowserModule,
			AppRoutingModule,
			ReportingAngularViewerModule
		],
		providers: [],
		bootstrap: [AppComponent]
	})
````


1. Use the report viewer selector in the component's template:

	````HTML
<reporting-angular-viewer
		#report
		[reportSource]="{
			report: 'Report Catalog.trdx',
			parameters: {}
		}"
		serviceUrl="https://demos.telerik.com/reporting/api/reports"
		viewMode="interactive"
		[keepClientAlive]="true">
	</reporting-angular-viewer>
````


1. Install one or more of the supported [Kendo UI for Angular themes](https://www.telerik.com/kendo-angular-ui/components/styling/):

	````powershell
npm install --save @progress/kendo-theme-default
````


1. In the `angular.json` configuration, add the desired theme inside the `styles` array - [Angular workspace configuration
: Styles and scripts configuration](https://angular.io/guide/workspace-config#styles-and-scripts-configuration):

	````JSON
"styles": [
		"exmple/src/styles.scss",
		"node_modules/@progress/kendo-theme-default/dist/default-ocean-blue.scss"
		],
````


1. Run the application:

	````powershell
npm run start
````


## See Also

* [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%}).

* [Make sure the service address is correct and enable CORS]({%slug cannot-access-the-reporting-rest-service%})
