---
title: Integrate the Web Report Designer in Angular
description: "Learn how to embed the Telerik Reporting Web Report Designer in an Angular application in this step-by-step tutorial."
type: how-to
page_title: Displaying the Web Report Designer in Angular application
slug: display-web-report-designer-in-angular-application
tags: angular,web,designer
ticketid: 1462933
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>{{site.buildversion}}</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Web Report Designer</td>
			<td>Angular</td>
		</tr>
	</tbody>
</table>

## Description

The Telerik Web Report Designer is a jQuery-based HTML5/JavaScript/CSS3 widget that allows you to integrate a report designer into your Angular web applications. While currently there is no dedicated Angular wrapper of the component, you can still integrate the jQuery version in your application, as explained in this article.

## Prerequisites

To follow the steps from this tutorial, you must have:

- A running ASP.NET application that hosts both a [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) and a [Telerik Report Designer REST service]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications%}#setting-up-the-report-designer-rest-service).
- An Angular application where you want to embed the designer.

## Solution

Follow these steps to integrate the Telerik Web Report Designer in your Angular application:

1. Add references to all required [Telerik Web Report Designer resources]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}#prerequisites) in your main HTML page (`index.html`). Replace `https://localhost:5000` with your actual ASP.NET application URL:

	````HTML
	<head>
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-{{site.jqueryversion}}.min.js"></script>
		<!-- Kendo UI for jQuery -->
		<script src="https://localhost:5000/js/webReportDesigner.kendo-19.2.25.813.min.js"></script>
		<!-- Telerik Reporting resources -->
		<script src="https://localhost:5000/api/reports/resources/js/telerikReportViewer"></script>
		<script src="https://localhost:5000/api/reportdesigner/designerresources/js/webReportDesigner"></script>
	</head>
	````

	> The `webReportDesigner.kendo-19.2.25.813.min.js` file is not served automatically by the Report Designer REST service. You need to copy this file from your Telerik Reporting installation directory (`C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q3\Html5\ReportDesigner\js\`) to your ASP.NET Core application's `wwwroot/js/` folder and reference it as shown above. This approach uses the Kendo UI subset included with your Telerik Reporting license instead of requiring a separate Kendo UI license.

1. Generate a new Angular component for the report designer:

	````bash
	ng generate component report-designer
	````

1. In your `report-designer.component.html`, add a container element for the designer:

	````HTML
	<div id="webReportDesigner"></div>
	````

1. In your `report-designer.component.js(ts)`, declare jQuery and initialize the designer:

	````JavaScript
	import { Component, OnInit } from '@angular/core';

	@Component({
	  selector: 'app-report-designer',
	  templateUrl: './report-designer.component.html',
	  styleUrls: ['./report-designer.component.css']
	})
	export class ReportDesignerComponent {
	  constructor() {}

	  ngOnInit() {
	    this.designer = $("#webReportDesigner").telerik_WebReportDesigner({
	      serviceUrl: "https://localhost:5000/api/reportdesigner/", // Replace with your service URL
	      report: "SampleReport.trdp" // Replace with your report file
	    }).data("telerik_WebDesigner");
	  }
	}
	````
	````TypeScript
	import { Component, OnInit } from '@angular/core';

	declare var $: any;

	@Component({
	  selector: 'app-report-designer',
	  templateUrl: './report-designer.component.html',
	  styleUrls: ['./report-designer.component.css']
	})
	export class ReportDesignerComponent implements OnInit {
	  private designer: any;

	  ngOnInit(): void {
	    this.designer = $("#webReportDesigner").telerik_WebReportDesigner({
	      serviceUrl: "https://localhost:5000/api/reportdesigner/", // Replace with your service URL
	      report: "SampleReport.trdp" // Replace with your report file
	    }).data("telerik_WebDesigner");
	  }
	}
	````

## Additional Resources

[Download the demo application from the Reporting-Samples GitHub Repository](https://github.com/telerik/reporting-samples/tree/master/telerik-angular-viewer-and-designer).

To run the example:

````bash
$ npm install
$ npm start
````

## Known Issues

Keep the following limitations in mind when using the Telerik Web Report Designer in Angular:

1. Theming limitations—The [Telerik Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) does not support custom theming. It uses a customized version of the Kendo SASS Default theme that loads automatically. If your Angular application uses a different Kendo theme, style conflicts may occur between the two themes.

1. Duplicate CSS resources—The Web Report Designer automatically loads its required CSS styles each time it is initialized, without checking if they are already present. This can result in duplicate `<style>` tags in your page's `<head>`. If you need to reinitialize the designer multiple times in your application, you may need to manually remove duplicate style elements. See the demo project's `designer.component.ts` file for implementation details.

3. Angular Report Viewer compatibility—The Telerik Web Report Designer cannot coexist with the [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}) in the same Angular application. While the designer includes its own built-in report viewer, if you need a standalone report viewer component, use either the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) or the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) instead.

## See Also

* [Test whether Web Report Designer Service is Responding]({%slug test-web-report-designer-service%})
