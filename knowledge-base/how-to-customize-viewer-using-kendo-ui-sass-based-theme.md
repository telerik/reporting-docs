---
title: How to style Telerik Angular Report Viewer using Sass-Based Themes
description: Apply styling, based on Kendo UI Themes Sass-Based themes and custom HTML template for the HTML5 Report Viewer
type: how-to
page_title: Error loading the report viewer's templates when using Sass-Based themes in Angular Report Viewer
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
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
In the following article are presented steps for customizing the HTML5 Report Viewer using Sass-Based themes. For information on how to customize the viewer using Less-Based themes, check our [online demos](https://demos.telerik.com/reporting/barcodes-report?&skinName=default).


## Solution
Firstly, it would be needed to add a report viewer for the Angular application. There are two approaches available:
1. [How To: Use Angular Report Viewer with Angular CLI](https://docs.telerik.com/reporting/angular-report-how-to-use-with-angular-cli) 
2. [How To: Use Angular Report Viewer with SystemJS](https://docs.telerik.com/reporting/angular-report-how-to-use-with-systemjs)

At step 8 (or 7 from the article with SystemJS) is mentioned how to style the viewer using the desired Kendo UI theme using Sass-Based themes. Unfortunately, 'templateUrl' containing the node_modules path to the html template can cause not found template error in browser console. It appears that for custom files to be served, they need to be included in the production build. This is done via the assets property in the **.angular-cli.json** file. 

```javascript
"assets": [
        "assets",
        "favicon.ico"
],
```

Check out the documentation for this feature here to learn how to use it: [https://github.com/angular/angular-cli/wiki/stories-asset-configuration](https://github.com/angular/angular-cli/wiki/stories-asset-configuration)

Once we moved the template file, together with the styles for the template and styles of kendo theme to the **assets** folder and modified all links to point there, the application ran correctly.
In the modified project assets folder has to contain files:
1. *telerikReportViewerTemplate-sass.html* which comes from node_modules/@progress/telerik-angular-report-viewer/dist/dependencies/telerikReportViewerTemplate-sass.html
2. *telerikReportViewer-sass.css* which comes from node_modules/@progress/telerik-angular-report-viewer/dist/dependencies/telerikReportViewer-sass.css
3. *all.scss* which comes from node_modules/@progress/kendo-theme-default/dist/all.css (you could use any of the other available kendo themes)

Then in **telerikReportViewerTemplate-sass.html** change the link to css to point the stylesheet in assets folder:

```HTML
<link href="assets/telerikReportViewer-sass.css" rel="stylesheet" />
```

Lastly, in **index.html** add a link to the all.css in order to run the global kendo styles:

```HTML
<link href="assets/all.css" rel="stylesheet"/>
```

## Notes
Note that when the service and the viewer are hosted in different domains it will be required to [enable CORS](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api) in order to enable communication between the viewer and the service.

## See Also
[Sass-Based Themes Kendo UI](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)
