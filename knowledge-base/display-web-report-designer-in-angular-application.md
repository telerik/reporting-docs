---
title: Displaying the Web Report Designer in Angular application.
description: Use Telerik Web Report Designer in Angular application
type: troubleshooting
page_title: Displaying the Web Report Designer in Angular application.
slug: display-web-report-designer-in-angular-application
position: 
tags: 
ticketid: 1462933
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.2.19.918 or higher</td>
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
With the [Telerik® Reporting R3 2019](../release-history/progress-telerik-reporting-r3-2019-13-2-19-918) we have introduced
our new Telerik Web Report Designer, which is HTML5/JavaScript/CSS3 jQuery-based widget that allows developers to integrate a report designer
into their web applications. 

## Solution
In this article we are going to integrate the jQuery-based Telerik Web Report Designer and HTML5 Telerik Report Viewer in angular application.

## Steps
1. Add a reference to all required [Telerik Web Report Designer resources](https://docs.telerik.com/reporting/web-report-designer#prerequisites)
in the main html page of the application. In the demo project linked below, this is index.html.
``` HTML
<head>
   ...
   <link rel="stylesheet" href="https://demos.telerik.com/reporting/api/reportdesigner/designerresources/ext_styles/webReportDesignerTheme-14.1.20.513.css" />
   
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2020.1.114/js/kendo.all.min.js"></script>
    
    <script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
    <script src="https://demos.telerik.com/reporting/api/reportdesigner/designerresources/js/webReportDesigner"></script>
  </head>
```

2. Declare jQuery in the component where the Telerik Web Report Designer will be initialized
``` TypeScript
declare var $: any;
```

3. Initialize the Telerik Web Report Designer in designer.component.ts.
``` TypeScript
this.designer = $("#webReportDesigner").telerik_WebReportDesigner({
	serviceUrl: "https://demos.telerik.com/reporting/api/reportdesigner/",
	report: "Product Catalog.trdp"
}).data("telerik_WebDesigner");
```

4. Initialize the Telerik HTML5 Report Viewer in viewer.component.ts
``` TypeScript
this.viewer = $("#reportViewer").telerik_ReportViewer({
    serviceUrl: "https://demos.telerik.com/reporting/api/reports/",
    reportSource: {
	report: 'Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null',
		parameters: {}
    }
}).data("telerik_ReportViewer");
```


## Additional resources
[Download the demo application](resources/telerik-report-web-designer-angular-app.zip).
To run the example:
- npm install
- npm start

## Known issues
Several things that you should keep in mind when using Telerik Web Report Designer in your projects.

1.[Telerik Web Report Designer](https://docs.telerik.com/reporting/web-report-designer#prerequisites) does not support theming. 
The Web Designer is built to use a customized version of Kendo SASS Default theme. The Designer loads all styles that are required by itself.
There is no additional option that could prevent it. The required styles are added to the body header of the document. If the application uses other Kendo theme, there will be conflicts between the two themes.

2. Because the Telerik Web Report Designer loads all required styles, when the designer widget is created, and in the latest version there is no check,
if the resources are already loaded, you will need to clean up the duplicated resources. See designer.component.ts in the demo project for more details. 

3. Telerik Web Report Designer could not be integrated in angular application together with Angular Telerik Report Viewer. 
That is why this article shows how to use the Telerik Web Report Designer in angular application with jQuery-based HTML5 Telerik Report Viewer.

## See Also
[Test whether Web Report Designer Service is Responding](https://reactjs.org/docs/test-web-report-designer-service.html)
