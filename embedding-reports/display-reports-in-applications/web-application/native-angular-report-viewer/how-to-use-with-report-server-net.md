---
title: Using with Report Server for .NET
page_title: Using the Native Angular Report Viewer with a Report Server for .NET instance
description: "Understand the prerequisites and steps necessary to add the Native Angular Report Viewer component to a new Angular application. Learn how to display a report coming from a Telerik Report Server for .NET."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-with-report-server-net
tags: how, to, use, native, angular, report, viewer, with, report, server. net
published: True
reportingArea: NativeAngular
position: 3
---

# How to use the Native Angular Report Viewer with Report Server for .NET

The article explains how to set up the Native Angular Report Viewer to work with the Telerik Report Server for .NET.

The user account that will authenticate with the Report Server may be any User, including the Guest User, provided there is an enabled Token in its [Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) collection.

## Prerequisites

* Review the Native Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%}).
* Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
* Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
* Report Server for .NET should contain at least one report that can be accessed by the User account.

## Steps

1. Install the Native Angular Report Viewer NPM package with the following command:

	````powershell
npm install @progress/telerik-angular-native-report-viewer
````

	>If you receive a *403 Forbidden Error*, you need to register and log in at [npmjs.com](https://www.npmjs.com/) before performing this step.
	>
	>````powershell
npm login --registry=https://registry.npmjs.org --scope=@progress
````


1. Once installed, import the `ReportingAngularViewerModule` in [your application root module](https://angular.io/guide/ngmodules#!#angular-modularity):

	````TypeScript
import { ReportingAngularViewerModule } from '@progress/telerik-angular-native-report-viewer';
	
	@NgModule({
		declarations: [
			AppComponent
		],
		imports: [
			BrowserModule,
			BrowserAnimationsModule,
			AppRoutingModule,
			ReportingAngularViewerModule
		],
		providers: [],
		bootstrap: [AppComponent]
	})
````


1. Install the Angular `localize` package - [Add the localize package](https://angular.io/guide/i18n-common-add-package#add-the-localize-package)

	````powershell
ng add @angular/localize
````


1. Install one of the [Kendo UI for Angular themes](https://www.telerik.com/kendo-angular-ui/components/styling/), e.g. the [Default Theme](https://www.telerik.com/kendo-angular-ui/components/styling/theme-default/)

	````powershell
npm install --save @progress/kendo-theme-default
````


1. Reference the theme in the project using one of the supported approaches - [Compiling Themes from SCSS Source Files](https://www.telerik.com/kendo-angular-ui/components/styling/#toc-compiling-themes-from-scss-source-files). In this example, we will use the approach with the `angular.json` configuration, which consists of adding the desired theme inside the `styles` array - [Angular workspace configuration: Styles and scripts configuration](https://angular.io/guide/workspace-config#styles-and-scripts-configuration):

	````JSON
"styles": [
		"src/styles.scss",
		"node_modules/@progress/kendo-theme-default/dist/default-ocean-blue.scss"
	],
````


1. In the class of the component(e.g. `AppComponent`) where the viewer will be displayed, define a `reportSource` object property specifying the category and the name of the report that will be displayed. For example, if the category is **Samples** and the report is **Dashboard**, the syntax will look as follows:

	````TypeScript
reportSource = {
		report: 'Samples/Dashboard',
		parameters: {}
	}
````


1. In the same component class, define a `reportServer` object property with a `url` string pointing to the Report Server for .NET, and `getPersonalAccessToken` callback, which will be executed when the report viewer requests from the server to render the report.

	````JS
reportServer = { 
		url: 'http://dnikolovlap:81/',
		getPersonalAccessToken: () => fetch('/rs-token').then(response => response.text())
	}
````

	In this example, the `getPersonalAccessToken` callback makes a request to a */rs-token* endpoint that returns the token used to authorize access to using the Report Server for .NET REST API.

	This is the **recommended** approach, but if an endpoint cannot be exposed, the token can be hardcoded in the callback: `getPersonalAccessToken: () => Promise.resolve('TOKEN_STRING')`


1. In the HTML template of the component, define the `<reporting-angular-viewer>` element, and pass the defined properties to their corresponding properties of the Native Angular Report Viewer:

	````HTML
<reporting-angular-viewer
		serviceType="reportServer"
		[reportServer]="reportServer"
		[reportSource]="reportSource">
	</reporting-angular-viewer>
````


1. Run the application:

	````powershell
ng serve
````


## See Also

* [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview)
* [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%})
* [Native Angular Report Viewer Commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands%})
* [Native Angular Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events%})
