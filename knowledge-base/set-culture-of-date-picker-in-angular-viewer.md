---
title: Change the Culture of Kendo DatePicker Widget in the Parameters Area of the Angular Report Viewer
description: How to Set Culture for Kendo Widgets used in Angular Report Viewer
type: how-to
page_title: Localize the Angular Viewer Kendo Widgets
slug: set-culture-of-date-picker-in-angular-viewer
position: 
tags: 
ticketid: 1459450
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
The article describes how to change the culture of the Kendo DatePicker widget used in the Angular Report Viewer.

## Solution
The general solution of the problem for localizing the DatePicker of the 
[pure Html5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer) is described in the 
[Change the culture of Kendo DatePicker widget in the parameters area of the HTML5 Report Viewer](./how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer) 
article. The Angular viewer is a wrapper of the pure Html5 viewer that utilizes Kendo UI for jQuery widgets. For that reason, 
in order to update the DatePicker in the Angular Viewer according to the above article, you need first to integrate the 
Kendo UI for jQuery in the Angular application following the article 
[Kendo UI for jQuery Integration](https://www.telerik.com/kendo-angular-ui/components/framework/kendo-jquery/). Here are the steps: 

- Install Kendo UI for jQuery:
```
npm install --save @progress/kendo-ui
``` 

 - In the 'app.component.ts' import the components from Kendo and declare the 'kendo' object. Then in the 'AfterViewInit' add 
 the code for utilizing the corresponding culture:
```TypeScript
...
import '@progress/kendo-ui';
declare var kendo: any;
...
export class AppComponent implements AfterViewInit {
    @ViewChild('viewer1', { static: false }) viewer: TelerikReportViewerComponent;

    ngAfterViewInit(): void {
        ...
        kendo.culture("fr-FR");
		...
    }
    ...
}
``` 

- Add the necessary Kendo scripts in the 'index.html' of the project. The 'head' section of the HTML page may look like:
```HTML
<head>
  <meta charset="utf-8">
  <title>Telerik Angular Report Viewer Demo</title>
  <base href="/">

  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="favicon.ico">
  <link href="http://kendo.cdn.telerik.com/2019.1.115/styles/kendo.common.min.css" rel="stylesheet" />
  <link href="http://kendo.cdn.telerik.com/2019.1.115/styles/kendo.blueopal.min.css" rel="stylesheet" />

  <script src="http://kendo.cdn.telerik.com/2019.1.115/js/kendo.all.min.js"></script>
  <script src="http://kendo.cdn.telerik.com/2019.1.115/js/cultures/kendo.culture.fr-FR.min.js"></script>
</head>
``` 

## See Also
- [Change the culture of Kendo DatePicker widget in the parameters area of the HTML5 Report Viewer](./how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer) 

- [Kendo UI for jQuery Integration](https://www.telerik.com/kendo-angular-ui/components/framework/kendo-jquery/)
