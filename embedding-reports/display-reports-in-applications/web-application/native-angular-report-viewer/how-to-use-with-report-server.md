---
title: Integration with Telerik Report Server
page_title: Using Native Angular Report Viewer with Telerik Report Server
description: "Learn how the Native Angular Report Viewer can be used as an external viewer to display reports located and rendered on a Telerik Report Server."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-report-server
tags: how,to,use,native,angular,report,viewer,with,report,server
published: True
position: 3
previous_url: /angular-report-viewer-with-report-server
---

# Integrating the Angular Report Viewer with Report Server

This tutorial demonstrates how to add the Angular Report Viewer component to a new Angular application and display a report coming from the Telerik Report Server.

## Prerequisites

The following list describes the prerequisites for this tutorial:

* Review the Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%}).
* [Angular CLI Project](https://angular.io/cli).
* A running intance of the [Telerik Report Server](https://docs.telerik.com/report-server/introduction).


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
		serviceType="reportServer"
		[reportServer]="{
			url:'http://localhost:83/',
			username:'username',
			password: 'password'
		}"
		[reportSource]="{
			report: 'Samples/Invoice',
			parameters: {}
		}"
		viewMode="interactive"
		[keepClientAlive]="true">
</re	porting-angular-viewer>
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

* [Telerik Report Server](https://docs.telerik.com/report-server/introduction)
* [Angular CLI](https://angular.io/cli)
* [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%}).