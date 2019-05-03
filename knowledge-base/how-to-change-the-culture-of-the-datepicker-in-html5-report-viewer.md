---
title: Change the culture of Kendo DatePicker widget in the parameters area of the HTML5 Report Viewer
description: This KB article gives a brief description of how to set another language of the Kendo date picker in HTML5 Report Viewer. The approach can be also used for all the wrappers of the Html5 Viewer
type: how-to
page_title: How to change the culture of the datepicker in HTML5 Report Viewer
slug: how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer
position: 
tags: Localization, HTML5ReportViewer
ticketid: 1405944
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
    </tbody>
</table>


## Description
The datepicker is a (Kendo widget)[https://docs.telerik.com/kendo-ui/controls/editors/datepicker/overview]. That's why the Html5 Report Viewer (or any other Web- based viewer) localization will not affect its date representation. This KB article gives a brief description of how to set another language. The example will demonstrate the date representation in French.

## Solution
1. Add the following script in the web page which holds the report viewer:

    
     ```HTML
     <script src="http://kendo.cdn.telerik.com/VERSION/js/cultures/kendo.culture.fr-FR.min.js"></script>
     ```
   For example:
   
   ```HTML
   <script src="http://kendo.cdn.telerik.com/2019.1.115/js/cultures/kendo.culture.fr-FR.min.js"></script>
   ```  
     A list with all versions can be found [here](https://docs.telerik.com/kendo-ui/intro/installation/prerequisites).
     
2.  Then the culture of the Kendo widget must be set through the script below which should be placed before the report viewer's initialization:

	```HTML
	<script type="text/javascript">
		kendo.culture("fr-FR");
	</script>
	```
