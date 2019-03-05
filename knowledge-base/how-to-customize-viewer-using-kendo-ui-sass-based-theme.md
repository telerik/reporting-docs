---
title: How to style Telerik Angular Report Viewer using Sass-based themes
description: Apply styling based on Kendo UI Sass-based themes and custom HTML template for the HTML5 Report Viewer
type: how-to
page_title: How to style Telerik Angular Report Viewer using Sass-based themes
slug: how-to-customize-viewer-using-kendo-ui-sass-based-theme
position: 
tags: styling,viewer,angular
ticketid: 1151892
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Product Version</td>
		<td>12.2.18.912 or lower</td>
	</tr>
</table>

## Important note
As of **R3 2018 SP1 release** the additional sass template is removed. From now on, the default *telerikReportViewer.html* and *telerikReportViewer.css* files are unified to work correctly with both Less and Sass Kendo themes.

## Description
In the following article are presented steps for configuring the Angular Report Viewer using Sass-Based themes prior to version *12.2.18.1017*.

## Solution
Firstly, it would be needed to add the report viewer. We support two technologies:

1. [How To: Use Angular Report Viewer with Angular CLI](../angular-report-how-to-use-with-angular-cli) 
2. [How To: Use Angular Report Viewer with SystemJS](../angular-report-how-to-use-with-systemjs)

At step 8 (or 7 from the article with SystemJS) is mentioned how to style the viewer using the desired Kendo UI theme using either Less- or Sass-Based Kendo UI themes. 
Back to the previous versions of Telerik Reporting, we distributed a separate report viewer template called **telerikReportViewer-sass.html** which differes from the default one with various different classes of the elements in order to render the report viewer's toolbar correctly.

So, the configuration at the end could be the following:
``` HTML
<!-- in app.component.html -->
<tr-viewer #viewer1 
    [containerStyle]="viewerContainerStyle"
    [serviceUrl]="'https://demos.telerik.com/reporting/api/reports/'"
    [templateUrl]="'\\node_modules\\@progress\\telerik-angular-report-viewer\\dist\\dependencies\\telerikReportViewerTemplate-sass.html'"
    [reportSource]="{
        report: 'Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null',
        parameters: {}
    }"
    ...>
</tr-viewer>
```
Copy the **all.css** file from the Sass-theme into **assets** folder and refer it as:
``` HTML
<!-- in index.html -->
<link href="assets/all.css" rel="stylesheet" />
```

## Solution 2 (using local files instead of CDNs)
Unfortunately, *[templateUrl]* containing the node_modules path to the html template can cause not found template error in browser console. It appears that for custom files to be served, they need to be included in the production build. This is done via the assets property in the **.angular-cli.json** file (or *.angular.json* for Angular 6 applications). 

```javascript
"assets": [
        "assets",
         ...
],
```

Check out the documentation for this feature here to learn how to use it: [https://github.com/angular/angular-cli/wiki/stories-asset-configuration](https://github.com/angular/angular-cli/wiki/stories-asset-configuration)

Once we moved the template file, together with the styles for the template and styles of kendo theme to the **assets** folder and modified all links to point there, the application ran correctly.
In the modified project assets folder has to contain files:

1. *telerikReportViewerTemplate-sass.html* which comes from node_modules/@progress/telerik-angular-report-viewer/dist/dependencies/telerikReportViewerTemplate-sass.html
2. *telerikReportViewer-sass.css* which comes from node_modules/@progress/telerik-angular-report-viewer/dist/dependencies/telerikReportViewer-sass.css
3. *all.css* which comes from node_modules/@progress/kendo-theme-default/dist/all.css (you could use any of the other available kendo themes)

Then in **telerikReportViewerTemplate-sass.html** change the link to css to point the stylesheet in assets folder:

```HTML
<link href="assets/telerikReportViewer-sass.css" rel="stylesheet" />
```

Lastly, in **index.html** add a link to the all.css in order to run the global kendo styles:

```HTML
<link href="assets/all.css" rel="stylesheet"/>
```

## Notes
Note that when the service and the viewer are hosted in different domains it will be required to [enable CORS](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api) in order to enable communication between them.

## See Also
[Sass-Based Themes Kendo UI](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)
