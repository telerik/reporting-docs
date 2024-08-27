---
title: Options
page_title: Native Angular Report Viewer Options
description: "Learn about what are the initialization options exposed by the Native Angular Report Viewer and how to configure them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options
tags: options
published: True
position: 0
previous_url: /embedding-reports/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 70%;
}
</style>

# Overview

Below is the list of all options available during initialization for the Native Angular Report Viewer.

## How to configure the options

The options can be set from the `.HTML`/`.TS` component file or both(combined):

````HTML
<reporting-angular-viewer
	#viewer
	[reportSource]="reportSource"
	[serviceUrl]="serviceUrl"
	viewMode="interactive"
	[keepClientAlive]="true">
</reporting-angular-viewer>
````
````TypeScript
import { Component, ViewChild  } from '@angular/core';
import { ReportingAngularViewerComponent } from '@progress/telerik-angular-native-report-viewer'
import { ReportSourceOptions } from '@progress/telerik-common-report-viewer'
	
	@Component({
		selector: 'app-root',
		templateUrl: './app.component.html',
		styleUrls: ['./app.component.scss']
	})
	
	export class AppComponent {
		title = 'Native Angular Report Viewer Demo';
	
		@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;
	
		reportSource: ReportSourceOptions = { report: "Dashboard.trdx", parameters: { ReportYear: 2004 } };
		serviceUrl: string = "https://demos.telerik.com/reporting/api/reports";
	}
````

## Options

<body>
	<table>
		<tr>
			<th>Property</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>serviceType</td>
			<td>
				<p><i>string, required;</i></p>
				<p>Specifies the type of service that the report viewer will connect to. Available options are:</p>
				<ul>
					<li><strong>REST</strong> - Telerik Reporting REST Service</li>
					<li><strong>reportServer</strong> - Telerik Report Server</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>serviceUrl</td>
			<td>
				<p><i>string, required if `serviceType` is `REST`;</i></p>
				<p>Sets the address of the Reporting REST Service;</p>
			</td>
		</tr>
		<tr>
			<td>reportSource</td>
			<td>
				<p><i>ReportSourceOptions, required;</i></p>
				<p>Specifies the report and initial report parameter values to be displayed in the report viewer.</p>
				<p>The <strong>ReportSourceOptions</strong> object is made up of the following properties:</p>
				<ul>
					<li><strong>report</strong> - Gets or sets a string that uniquely identifies a report from
						the Reporting REST service or the Telerik Report Server. </li>
					<li><strong>parameters</strong> - Gets or sets an object with
						properties name/value equal to the report parameters names and values used in the report
						definition.</li>
				</ul>
				<p>To set the reportSource to a physical <i>(TRDP/TRDX/TRBP)</i> file, provide a relative path to the <strong>Report</strong> property of the ReportSourceOptions object.</p>
				<pre><code>
reportSource: ReportSourceOptions = { report: "Dashboard.trdx", parameters: { ReportYear: 2004 } };
				</code></pre>
				<p>To set the ReportSource to a <a href="/api/Telerik.Reporting.TypeReportSource" target="_blank">type definition</a>:</p>
				<ol>
					<li>Make sure that the <a href="{%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}" target="_blank">Reporting REST Service</a> project references the project containing the type definition.</li>
					<li>Pass the <a href="https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0" target="_blank">assembly qualified name</a> <i>(format: "<strong>{type}, {assembly}</strong>")</i> of the report's type to the <strong>Report</strong> property of the ReportSourceOptions object.</li>
				</ol>
				<pre><code>
reportSource: ReportSourceOptions = { report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary", parameters: { ReportYear: 2004 } };
				</code></pre>
			</td>
		</tr>
		<tr>
			<td>scaleMode</td>
			<td>
				<p><i>string, optional;</i></p>
				<p>Sets how the report pages to be scaled. Available options are:</p>
				<ul>
					<li> <strong>fitPageWidth</strong> - the pages are scaled proportional to fit the entire
						width in the viewer's view port;</li>
					<li><strong>fitPage</strong>- the pages are scaled proportional to fit the entire page in
						the view port;</li>
					<li><strong>specific</strong> - the pages are scaled with the <i>Scale</i> value;
						<br />
						Default value is: <strong>specific</strong>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>scale</td>
			<td>
				<p><i>double, optional;</i></p>
				<p>Sets the scale factor for the report pages. The scale takes effect when the <strong>ScaleMode</strong> is set to <i>Specific</i>.</p>
				<p>Default value is <strong>1.0 (100%); the original size of the report</strong></p>
			</td>
		</tr>
		<tr>
			<td>viewMode</td>
			<td>
				<p>Sets if the report is displayed in interactive mode or in print preview.</p>
				<p>The available values are:</p>
				<ul>
					<li><strong>interactive</strong> - enables drill-down interactivity, etc;</li>
					<li><strong>printPreview</strong> - the report is paged according to the page settings;
						For more information please see [Interactive vs. Print Layout]({%slug
						telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).
						<br />
						Default value is: <strong>interactive</strong>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>pageMode</td>
			<td>
				<p>Sets if the report is displayed in Single page or Continuous scroll mode.</p>
				<p>The available values are:</p>
				<ul>
					<li><strong>singlePage</strong> - only one page is loaded in the view port;</li>
					<li><strong>continuousScroll</strong> - more than one page could be loaded in the view
						port;
						<br />Default value is: <strong>continuousScroll</strong>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>printMode</td>
			<td>
				<p>Specifies how the viewer should [print reports]({%slug
				telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%}).</p>
				<p>The available values are:</p>
				<ul>
					<li><strong>autoSelect</strong> - specifies that the viewer should automatically decide
						which option for printing to use depending on browser's version and whether the PDF plug-in is
						available or not. This is the default value;</li>
					<li><strong>forcePDFFile</strong> - specifies that the document for printing will be
						downloaded as a file (in PDF format with a special 'print' script enabled);</li>
					<li><strong>forcePDFPlugin</strong> - specifies that the viewer should always use the PDF
						plug-in;</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td>parametersAreaVisible</td>
			<td>
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the viewer's parameters area is displayed if any parameter editor exists.</p>
				<p>Default value: <strong>true</strong></p>
			</td>
		</tr>
		<tr>
			<td>documentMapVisible</td>
			<td>
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the viewer's document map is displayed if any bookmark is defined.</p>
				<p>Default value: <strong>true</strong></p>
			</td>
		</tr>
		<tr>
			<td>keepClientAlive</td>
			<td>
				<p><i>boolean, optional;</i></p>
				<p>Determines whether the client will be kept alive. When set to <i>true</i>, expiration of the client will be prevented by continually sending a request to the server, determined by the Reporting REST service's <strong>ClientSessionTimeout</strong>.</p>
				<p>Default value: <strong>false</strong></p>
			</td>
		</tr>
		<tr>
			<td>width</td>
			<td>
				<p><i>string, optional;</i></p>
				<p>The width of the component.</p>
				<p>Default value: <strong>100%</strong></p>
			</td>
		</tr>
		<tr>
			<td>height</td>
			<td>
				<p><i>string, optional;</i></p>
				<p>The height of the component.</p>
				<p>Default value: <strong>700px</strong></p>
			</td>
		</tr>
		<tr>
			<td>contentTabIndex</td>
			<td>
				<p><i>number, optional;</i></p>
				<p>Controls what value will be set on the [tabindex](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex) attribute of the `reportng-angular-viewer` component.</p>
				<p> Default value is <strong>1000.</strong></p>
			</td>
		</tr>
		<tr>
			<td>authenticationToken</td>
			<td>
				<p><i>string, optional;</i></p>
				<p> If provided, a `Bearer` token will be set in the `Authorization` header for requests to the Reporting REST service. The token is not sent only when requesting [document resources]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource%}). The reason is that resources like images are referenced with relative URLs in the HTML of the report document, hence the requests for them are made by the browser.</p>
			</td>
		</tr>
	</table>
</body>
