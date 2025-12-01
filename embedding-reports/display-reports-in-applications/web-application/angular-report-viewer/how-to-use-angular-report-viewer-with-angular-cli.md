---
title: Integrating with Angular CLI
page_title: Using Angular Report Viewer with Angular CLI
description: "Learn how the Angular Report Viewer can be used in an Angular CLI application with a few simple steps."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli
tags: how,to,use,angular,report,viewer,with,angular,cli
published: True
reportingArea: AngularWrapper
position: 1
previous_url: /angular-report-how-to-use-with-angular-cli
---

# Integrating the Angular Report Viewer with Angular CLI

This tutorial demonstrates how to add the Angular Report Viewer component to a new Angular application. 

The app's settings are similar to the settings of the local Angular Report Viewer demo project installed by default under `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\Angular\html5-angular-report-viewer-example`.

## Prerequisites

The following list describes the prerequisites for this tutorial:

* [Angular CLI](https://angular.io/cli).
* Review the Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}#requirements).
* A running application that hosts a Reporting REST service at address `/api/reports`. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).
* Copy of the "Product Catalog.trdp" report file from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples` placed in the folder used by the [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver) in the Reporting REST service implementation.
* Entry with the default connection string used by Telerik Reporting sample reports in the `web.config`/`appsettings.json` file of the project hosting the Reporting REST service.

	XML-based configuration file:

	````XML
<connectionStrings>
		<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
			connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
			providerName="System.Data.SqlClient" />
	</connectionStrings>
````

	JSON-based configuration file:

	````JSON
"ConnectionStrings": {
		//This connection string will use System.Data.SqlClient as data provider invariant name.
		//"Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true"

		//This connection string explicitly states the data provider invariant name - mandatory for databases other than MSSQL Server.
		"Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": {
			"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
			"providerName": "System.Data.SqlClient"
		}
	}
````


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


1. Use the report viewer selector in the `AppComponent` template:

	````HTML
<tr-viewer
		[containerStyle]="viewerContainerStyle"
		[serviceUrl]="'http://localhost:59657/api/reports'"
		[reportSource]="{
			report: 'Product Catalog.trdp',
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

* [Make sure the service address is correct and enable CORS]({%slug cannot-access-the-reporting-rest-service%})
