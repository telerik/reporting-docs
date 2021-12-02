---
title: How to Use Angular Report Viewer with SystemJS
page_title: How to Use Angular Report Viewer with SystemJS | for Telerik Reporting Documentation
description: How to Use Angular Report Viewer with SystemJS
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-systemjs
tags: how,to,use,angular,report,viewer,with,systemjs
published: True
position: 2
---

# How to Use Angular Report Viewer with SystemJS



This article demonstrates how to add the Angular Report Viewer component to an Angular application with a SystemJS module loader.         It shows the steps to implement the required configuration when you use the Angular Quickstart project template. As a result, we create a         new Angular application with settings similar to these of the local AngularDemo project, installed by default         under __[TelerikReporting_InstallDir]\Examples\Angular\SystemJS__ .       

>tip To use the Angular Report Viewer with SystemJS, you must explicitly list the package entry points.         


## Prerequisites

The following list describes the prerequisites for this tutorial:         

* Review the Angular Report Viewer [Requirements](e05255e3-dbe4-41b1-8d08-6de0fed3868c#Requirements).             

* A running application that hosts a Reporting REST service at address /api/reports. For more information, see               [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).             

* Copy of the "Product Catalog.trdp" report file from __[TelerikReporting_InstallDir]\ReportDesigner\Examples__                in the folder used by the  [ReportFileResolver](/reporting/api/Telerik.Reporting.Services.WebApi.ReportFileResolver)                in the Reporting REST service implementation.             

* Entry with the default connection string used by Telerik Reporting sample reports in the __web.config__  file               of the project hosting the Reporting REST service:             

	
      ````xml
<connectionStrings>
	 <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
	            connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
	            providerName="System.Data.SqlClient" />
</connectionStrings>
````



## Clone Angular Quickstart

If you don't have an Angular 4 SystemJS application,           clone the Angular Quickstart project into a local folder with the following command:         

	
````powershell
                    git clone https://github.com/angular/quickstart.git
                    cd quickstart
                    npm install
````



## Add the Angular Report Viewer Package

>tip All paths and url links in the described steps must be adapted to your project setup.           


###Steps:

1. The Angular Report Viewer requires jQuery peer dependencies. To install it use the following command:

	
    ````powershell
              npm install --save jquery
````



1. The Telerik Angular Report Viewer package is published in the public NPM registry.                   To install the package, run:                 

	
    ````powershell
                      npm install --save @progress/telerik-angular-report-viewer
````



1. Configure SystemJS    The configuration file, which SystemJS uses, is in the project template under src/systemjs.config.js.                     To add the Angular Report Viewer and jQuery configuration to the map and packages section, use the following example:                 

	
    ````js
map: {
  // ...
  '@progress': 'npm:@progress',
  '@telerik': 'npm:@telerik',
  'jquery': 'npm:jquery/dist/jquery.js',
},
packages: {
  // ...
  // Telerik Angular Report Viewer package
  '@progress/telerik-angular-report-viewer': {
    main: 'dist/cjs/main',
    format: 'cjs',
    defaultExtension: 'js'
  }
}
````



1. Import the TelerikReportingModule in  [your application root module](https://angular.io/docs/ts/latest/guide/ngmodule.html#!#angular-modularity) :                 

	
    ````js
import { TelerikReportingModule } from '@progress/telerik-angular-report-viewer';
@NgModule({
  imports: [TelerikReportingModule]
````



1. Add the desired report viewer container style using a property of the AppComponent class:

	
    ````js
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
    [serviceUrl]="'http://myrestserviceurl/api/reports'"
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

1. Style the viewer using the desired Kendo UI theme (еither using  [Less-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling)  or  [Sass-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes) ):                     Add references to the Less-based CSS files in the ```<head>``` element of index.html:

	
    ````html
<!-- The required Less-based styles -->                  
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
````



    >tip To get the Sass-based Kendo UI themes, you can use either the pre-build CSS files or the NPM packages ( [Getting the Sass-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes#getting-the-themes) ).                   

    If you use the __styleUrls__  attribute to reference the CSS, it is required to set                   the view encapsulation to __None__ :                 

	
    ````js
import { Component, ViewEncapsulation } from '@angular/core';
@Component({
  encapsulation: ViewEncapsulation.None
````



1. Run the application:

	
    ````powershell
npm run start
````



# See Also

