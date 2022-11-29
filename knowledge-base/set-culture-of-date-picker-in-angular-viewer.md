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
		<tr>
			<td>Report Viewer</td>
			<td>Angular Report Viewer</td>
		</tr>
	</tbody>
</table>


## Description
The article describes how to change the culture of the Kendo DatePicker widget used in the Angular Report Viewer.

The general solution of the problem for localizing the DatePicker of the [pure Html5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer) is described in the [Change the culture of Kendo DatePicker widget in the parameters area of the HTML5 Report Viewer]({% slug how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer %}) article. 

To also change the culture of the report viewer, it is required to import the necessary Kendo culture on the page with the report viewer.

## Solution

For this example, we will load the additional `kendo` cultures via the kendo CDN. To accomplish this in an Angular component, it is necessary to create a helper function that loads scripts from an URL, for example:

```TypeScript
    loadScript(url: string) {
        let body = <HTMLDivElement>document.body;
        let script = document.createElement('script');
        script.innerHTML = '';
        script.src = url;
        script.async = true;
        script.defer = true;
        body.appendChild(script);
    }
```

The script can be loaded in the `constructor` of the component loading the Angular Report Viewer, for example:

```TypeScript
export class ReportViewerComponent implements AfterViewInit {
    @ViewChild('viewer1') viewer: TelerikReportViewerComponent;

    constructor() {
        this.loadScript(`http://kendo.cdn.telerik.com/2022.3.913/js/cultures/kendo.culture.bg-BG.min.js`);
    }
    ...
  }
```

Then the actual change of the kendo current culture can happen in the [renderingBegin]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin(e,-args) %}) event:

```TypeScript
    renderingBegin() {
        kendo.culture("bg-BG");
    }
```

```HTML
<tr-viewer #viewer1 [containerStyle]="viewerContainerStyle" [serviceUrl]="'http://localhost:59655/api/reports/'"
    [reportSource]="{
        report: 'Employee Sales Summary.trdp',
        parameters: {}
    }" [viewMode]="'INTERACTIVE'" [renderingBegin]="renderingBegin"
    [scaleMode]="'SPECIFIC'" [scale]="1.0"
    [enableAccessibility]="false">
</tr-viewer>
```

## See Also
- [Change the culture of Kendo DatePicker widget in the parameters area of the HTML5 Report Viewer]({% slug how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer %}) 
