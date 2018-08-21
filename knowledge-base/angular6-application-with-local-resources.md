---
title: Angular6 application working with local resources (without any CDNs)
description: How to create an Angular 6 application which is loading only local styles and scripts
type: how-to
page_title: Angular 6 application with local resources (without any CDNs)
slug: angular6-application-with-local-resources
position: 
tags: AngularReportViewer
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
After upgrading to Angular 6, it should be considered that there are a few differences about the project setup. For example, the **angular-cli.json** is replaced with **angular.json** file. Also the local stylesheet which by default are CDN links, must be loaded as local files only in **assets** folder as this seems to be required for this version.
For more information, please check the [Unable to load the css file in angular 6 application](https://stackoverflow.com/questions/50666689/unable-to-load-the-css-file-in-angular-6-application) article.

## Solution
The sample application could be downloaded from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/sampleangular6app.zip?sfvrsn=3458f73f_2).

## See Also
- [Angular Report Viewer](https://docs.telerik.com/reporting/angular-report-viewer)
- [Telerik Reporting REST Services](https://docs.telerik.com/reporting/telerik-reporting-rest-conception)
