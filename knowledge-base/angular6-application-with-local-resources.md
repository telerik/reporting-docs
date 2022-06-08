---
title: Create Angular 6 Applications Working with Local Resources
page_title: Create Angular 6 Applications Working with Local Resources without CDNs
description: "Learn how to create an Angular 6 application which is loading only local styles and scripts."
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

How can I create an Angular6 application is working with local resources only without any CDNs?

## Solution

After upgrading to Angular 6, the `angular-cli.json` is replaced with the `angular.json` file. Also, the local stylesheet which, by default, represents CDN links, must be loaded as local files only in the `assets` folder. For more information, refer to the [Unable to load the CSS file in Angular 6 applications](https://stackoverflow.com/questions/50666689/unable-to-load-the-css-file-in-angular-6-application) article.

To download the sample application, go to [this location](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/sampleangular6app.zip?sfvrsn=3458f73f_2).

## See Also

* [Angular Report Viewer]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview %})

* [Telerik Reporting REST Services]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %})
