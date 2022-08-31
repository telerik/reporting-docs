---
title: Create Angular 6+ Applications Working with Local Resources
page_title: Create Angular 6+ Applications Working without CDNs
description: "Learn how to create an Angular 6 or higher application which is loading only local styles and scripts."
type: how-to
slug: angular6-application-with-local-resources
tags: telerik, reporting, angular, report, viewer, create, angular6, apps, work, with, local, resources, without, cdn
ticketid: 1337433
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>Angular Viewer</td>
	</tr>
</table>

## Description

How can I integrate the [Telerik Angular Report Viewer]({% slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview %}) in an Angular 6 or higher application that works with local resources and doesn't reference any CDNs?

## Solution

After upgrading to Angular 6, the `angular-cli.json` is replaced with the `angular.json` file. 

In addition, the local stylesheet which, by default, represents CDN links, must be loaded as local files that should be placed in the `assets` folder. For more information, refer to the [Unable to load the CSS file in Angular 6 applications](https://stackoverflow.com/questions/50666689/unable-to-load-the-css-file-in-angular-6-application) Stackoverflow thread. 

You need to download the stylesheet files (e.g. `kendo.common.min.css` and `kendo.blueopal.min.css`), for example, from the corresponding CDNs and save them in the `src\assets` folder of the Angular application.

Then, you have to load the styles in the `index.html` of the application from the local folder like shown below:

````HTML
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>DreamApp</title>
		<base href="/">
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/x-icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="assets/kendo.common.min.css">
		<link rel="stylesheet" type="text/css" href="assets/kendo.blueopal.min.css">
	</head>
	<body>
		<app-root></app-root>
	</body>
</html>
````

To download the sample application, go to [our Angular 6 Sample](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/sampleangular6app.zip?sfvrsn=3458f73f_2).

## See Also

* [Angular Report Viewer]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview %})

* [Telerik Reporting REST Services]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %})
