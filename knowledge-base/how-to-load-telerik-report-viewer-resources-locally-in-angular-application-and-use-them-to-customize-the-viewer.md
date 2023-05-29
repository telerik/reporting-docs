---
title: Customize Report Viewer in Angular by Loading Its Resources Locally
description: "Learn why in some cases a modification of the default behavior, layout or styles of the HTML5 Report Viewer in an Angualr application is needed. This article elaborates further on how to load the required default resources locally."
type: how-to
page_title: Loading Report Viewer resources locally in Angular to customize it
slug: how-to-load-telerik-report-viewer-resources-locally-in-angular-application-and-use-them-to-customize-the-viewer
position: 
tags: AngularReportViewer
ticketid: 
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.222</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>Angular application</td>
		</tr>
	</tbody>
</table>

## Description

Do you want to customize the report viewer's default layout and behavior? Let's find out how.

## Prerequisites

Angular requires folder called assets to be used for serving custom files, so they could be included in the production build. This is done via the assets property in the .angular-cli.json file (or .angular.json for Angular 6+ applications).

````JSON
"assets": [
	"src/assets",
	...
],
````

Check out the documentation for this feature here to learn how to use it: [https://github.com/angular/angular-cli/wiki/stories-asset-configuration](https://github.com/angular/angular-cli/wiki/stories-asset-configuration).

## Important notes

Keep in mind that this will require to merge the new changes for each of the local files manually on upgrade.

## Solution

The following three scenarios could be applied together (if all resources have to be modified). However, if you intend to modify just one resource, for example the script file, check only the corresponding section.

### Scenario 1

How to load viewer's script (`telerikReportViewer-<VERSION>.js`) locally?

#### Example

I would like to change the behavior of the report viewer widget (toolbar, parameters area, document map)

#### How to

1. Copy the script file from `C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Html5\ReportViewer\js\telerikReportViewer-<VERSION>.js` to assets folder
1. In `index.html` load jQuery library (required for the JS logic) and the local file itself:

	````HTML
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
	<script src="assets/telerikReportViewer-<VERSION>.js"></script>
````


### Scenario 2

How to load viewer's HTML template (`telerikReportViewerTemplate.html`) locally?

#### Example

I would like to change the layout of the report viewer widget (hide toolbar buttons, add additional buttons, localize string resources etc.)

#### How to

1. Copy the template file from `C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Html5\ReportViewer\templates\telerikReportViewerTemplate.html` to assets folder
1. Load it setting **templateUrl** option of the report viewer like:

	````JavaScript
<tr-viewer #viewer1 
		[serviceUrl]="'http://localhost:12345/api/reports/'"
		[templateUrl]="'..\\assets\\telerikReportViewerTemplate.html'"
		[reportSource]="{
			report: 'SampleReport.trdp',
			parameters: {}
		}"
		>
	</tr-viewer>
````


### Scenario 3

How to load viewer's styles (`telerikReportViewer.css`) locally?

#### Example

I would like to change the default styling of the viewer widget.

#### How to

1. **Important:** This depends on the template, so make sure that local `telerikReportViewerTemplate.html` is used (check Scenario 2). 
1. Copy the stylesheet file from `C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Html5\ReportViewer\styles\telerikReportViewer.css` to assets folder
1. Open `telerikReportViewerTemplate.html` file and change the path to the stylesheet resource from:

	````HTML
<link href="{service}resources/styles/telerikReportViewer-css" rel="stylesheet" />
````
	To:

	````HTML
<link href="assets/telerikReportViewer.css" rel="stylesheet" />
````


## See Also

* [How To: Use Angular Report Viewer with Angular CLI]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli %})
