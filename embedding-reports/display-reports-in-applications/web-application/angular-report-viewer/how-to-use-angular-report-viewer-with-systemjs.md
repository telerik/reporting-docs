---
title: Integrating with SystemJS
page_title: Using Angular Report Viewer with SystemJS
description: "Learn how the Angular Report Viewer can be used in an Angular SystemJS application with a few simple steps."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-systemjs
tags: how,to,use,angular,report,viewer,with,systemjs
published: True
position: 2
previous_url: /angular-report-how-to-use-with-systemjs
---

# Integrating the Angular Report Viewer with SystemJS

> Starting with the `Q1 2024` release, the SystemJS Angular examples is no longer distributed with the product and this article will receive no further updates.

This article elaborates on how to add the Angular Report Viewer component to an Angular application with a `SystemJS` module loader. It shows the steps to implement the required configuration when you use the *Angular Quickstart* project template. As a result, we create a new Angular application with settings similar to these of the local `systemjs` project, installed by default under `[TelerikReporting_InstallDir]\Examples\Angular\`.

> To use the Angular Report Viewer with SystemJS, you must explicitly list the package entry points.

## Prerequisites

The following list describes the prerequisites for this tutorial:

* Review the Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}#requirements).
* A running application that hosts a Reporting REST service at address /api/reports. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).
* Copy of the "Product Catalog.trdp" report file from `[TelerikReporting_InstallDir]\ReportDesigner\Examples` in the folder used by the [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver) in the Reporting REST service implementation.
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


## Clone Angular Quickstart

If you don't have an `Angular4 SystemJS` application, clone the *Angular Quickstart* project into a local folder with the following command:

````powershell
git clone https://github.com/angular/quickstart.git
cd quickstart
npm install
````

## Add the Angular Report Viewer Package

> All paths and URL links in the described steps must be adapted to your project setup. 

###Steps:

1. The Angular Report Viewer requires jQuery peer dependencies. To install it use the following command:

	````powershell
npm install --save jquery
````


1. The Telerik Angular Report Viewer package is published in the public NPM registry. To install the package, run:

	````powershell
npm install --save @progress/telerik-angular-report-viewer
````


1. Configure SystemJS The configuration file, which SystemJS uses, is in the project template under `src/systemjs.config.js`. To add the Angular Report Viewer and jQuery configuration to the map and packages section, use the following example:

	````JSON
map: {
		//...
		'@progress': 'npm:@progress',
		'@telerik': 'npm:@telerik',
		'jquery': 'npm:jquery/dist/jquery.js',
	},
	packages: {
		//...
		// Telerik Angular Report Viewer package
		'@progress/telerik-angular-report-viewer': {
			main: 'dist/cjs/main',
			format: 'cjs',
			defaultExtension: 'js'
		}
	}
````


1. Import the `TelerikReportingModule` in [your application root module](https://angular.io/guide/ngmodules#!#angular-modularity):

	````TypeScript
import { TelerikReportingModule } from '@progress/telerik-angular-report-viewer';
	@NgModule({
		imports: [TelerikReportingModule]
````


1. Add the desired report viewer container style using a property of the `AppComponent` class:

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
		[serviceUrl]="'http://localhost/api/reports'"
		[reportSource]="{
			report: 'Product Catalog.trdp',
			parameters: {}
		}"
		[viewMode]="'INTERACTIVE'"
		[scaleMode]="'SPECIFIC'"
		[scale]="1.0">
	</tr-viewer>
````

	For all available report viewer options, refer to [Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%}).

1. Style the viewer using the desired Kendo UI theme (еither using [LESS-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/less-themes/overview) or [SASS-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview)): Add references to the LESS-based CSS files in the `<head>` element of `index.html`:

	````HTML
<!-- The required LESS-based styles -->
	<link href="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/styles/kendo.common.min.css" rel="stylesheet" />
	<link href="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/styles/kendo.blueopal.min.css" rel="stylesheet" />
````

	>To get the SASS-based Kendo UI themes, you can use either the pre-build CSS files or the NPM packages ([Getting the Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview#getting-the-themes)).

	If you are using the `styleUrls` attribute to reference the CSS, it is required to set the view encapsulation to `None`:

	````TypeScript
import { Component, ViewEncapsulation } from '@angular/core';
	@Component({
		encapsulation: ViewEncapsulation.None
````


1. Run the application:

	````powershell
npm run start
````

