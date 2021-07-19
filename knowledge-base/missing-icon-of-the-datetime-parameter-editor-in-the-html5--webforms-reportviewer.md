---
title: Missing icon of the DateTime parameter editor in the HTML5 ASP.NET WebForms ReportViewer
description: Missing icon of the DateTime parameter editor in the HTML5 ASP.NET WebForms ReportViewer.
type: how-to
page_title: Missing icon of the DateTime parameter editor in the HTML5 ASP.NET WebForms ReportViewer
slug: missing-icon-of-the-datetime-parameter-editor-in-the-html5--webforms-reportviewer
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting HTML5 Web Forms Report Viewer</td>
			<td>up to R1 2017</td>
		</tr>
	</tbody>
</table>

## Description

Missing icon of the DateTime parameter editor in the [HTML5 ASP.NET WebForms ReportViewer](../webforms-report-viewer-controls-overview).   
In the browser's console (**F12 Developer Tools**) you will see an error related to loading **http://&lt;host&gt;/BlueOpal/sprite.png**. The sprite is related to Telerik Kendo UI CSS used by the HTML5 Viewer.  
  
## Solution 

1. Replace the HTML5 ASP.NET WebForms ReportViewer with the [HTML5 Javascript Viewer](../html5-report-viewer). It is the same viewer, where settings will have to be applied in JavaScript instead of C#|VB<span>.</span>NET.

2. Load the correct Telerik Kendo UI CSS and JS files before creating the HTML5 ASP.NET WebForms ReportViewer. For example, in the &lt;head&gt; element of the page with the viewer load the CSS and JS files required by the viewer:  

```html
<head>
    <title>Telerik HTML5 Report Viewer Demo</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
 
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css" rel="stylesheet" id="common-css" />
    <link href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.blueopal.min.css" rel="stylesheet" id="skin-css" />
 
    <!--kendo.all.min.js can be used as well kendo.web.min.js and kendo.mobile.min.js-->
    <script src="/ReportViewer/js/kendo.subset.2015.3.930.min.js"></script>
...
</head>
```


This will load the styles before the viewer requests the default resources from the Reporting REST service. For more details, check [HTML5 ASP.NET WebForms ReportViewer: Styling and Appearance](../html5-webforms-report-viewer-customizing-styling).

