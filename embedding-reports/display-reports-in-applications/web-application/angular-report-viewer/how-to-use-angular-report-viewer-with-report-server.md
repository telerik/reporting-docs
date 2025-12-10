---
title: Integration with Telerik Report Server
page_title: Using Angular Report Viewer with Telerik Report Server
description: "Learn how the Angular Report Viewer can be used as an external viewer to display reports located and rendered on a Telerik Report Server."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-report-server
tags: how,to,use,angular,report,viewer,with,report,server
published: True
reportingArea: AngularWrapper
position: 3
previous_url: /angular-report-viewer-with-report-server
---

# Integrating the Angular Report Viewer with Report Server

This tutorial demonstrates how to add the Angular Report Viewer component to a new Angular application and display a report coming from the Telerik Report Server.

## Prerequisites

The following list describes the prerequisites for this tutorial:

* [Angular CLI](https://angular.io/cli).
* Review the Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}#requirements).
* A running instance of the [Telerik Report Server](https://docs.telerik.com/report-server/introduction).

## Using Angular Report Viewer in Angular application

### Steps:

1. Create new Angular application using the [Angular CLI](https://angular.io/cli) tutorial.
1. Install the Telerik Angular Report Viewer NPM package by running:

	````powershell
npm install @progress/telerik-angular-report-viewer
````

	>If you receive a *403 Forbidden Error*, you need to register and login at [npmjs.com](https://www.npmjs.com/) before performing this step.
	>
	>````powershell
npm login --registry=https://registry.npmjs.org --scope=@progress
````


1. Once installed, import the `TelerikReportingModule` in [your application root module](https://angular.io/guide/ngmodules#!#angular-modularity) or [standalone component](https://angular.dev/guide/components):

	````TypeScript
import { TelerikReportingModule } from '@progress/telerik-angular-report-viewer';

	@Component({
		selector: 'app-root',
		standalone: true,
		imports: [TelerikReportingModule],
		templateUrl: './app.component.html',
		styleUrl: './app.component.scss'
	})
````


1. Add the desired report viewer container styling using a property of the custom component class(*in this example - AppComponent*):

	````TypeScript
export class AppComponent {
		viewerContainerStyle = {
			position: 'relative',
			width: '1000px',
			height: '800px',
			['font-family']: 'ms sans serif'
		};
	}
````


1. Use the report viewer selector in the AppComponent template:

	````HTML
<tr-viewer
		[containerStyle]="viewerContainerStyle"
		[reportServer]="{
			url: 'http://localhost:83/',
			username: 'myusername',
			password: 'mypass'
		}"
		[reportSource]="{
			report: 'Samples/Dashboard',
			parameters: {}
		}" 
		[viewMode]="'INTERACTIVE'"
		[scaleMode]="'SPECIFIC'"
		[scale]="1.0">
	</tr-viewer>
````

	For all available report viewer options refer to [Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%}).

1. Style the viewer using the desired Kendo UI [Sass-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) by adding references to the Sass-based CSS files in the `<head>` element of _index.html_:

	````HTML
<link href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" rel="stylesheet" />
````

	>To get the Sass-based Kendo UI themes, you can use either the pre-build CSS files or the NPM packages ([Getting the Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview#getting-the-themes)).

	If you use the __styleUrls__ attribute to reference the CSS, it is required to set the view encapsulation to __None__:

	````TypeScript
import { Component, ViewEncapsulation } from '@angular/core';
		@Component({
			encapsulation: ViewEncapsulation.None
````


1. Run the application:

	````powershell
ng serve
````


## See Also

* [Telerik Report Server](https://docs.telerik.com/report-server/introduction)
* [Angular CLI](https://angular.io/cli)
* [Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%})
* [Angular Report Viewer Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}#requirements)
