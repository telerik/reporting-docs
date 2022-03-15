---
title: How to set another language of the Kendo date picker in HTML5 MVC Report Viewer
description: This KB article gives a brief description of how to set another language of the Kendo date picker in HTML5 MVC Report Viewer
type: how-to
page_title: How to change the culture of the datepicker in HTML5 Report Viewer
slug: set-another-language-datepicker-html5-reportviewer-mvc
position: 
tags: Localization, HTML5MVCReportViewer
ticketid: 1495437
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
The datepicker is a [Kendo widget](https://docs.telerik.com/kendo-ui/controls/editors/datepicker/overview).
That's why the Html5 MVC Report Viewer localization will not affect its date representation.
This KB article gives a brief description of how to set another language. The example will demonstrate the date representation in Spanish.

## Solution
1. Add the following script after the script of the viewer:

    
    ```HTML
    <script src="~/Scripts/telerikReportViewer.kendo-14.2.20.1021.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2019.1.115/js/cultures/kendo.culture.es-PY.min.js"></script>    
    ```  
  
2. Add the following script in the web page which holds the report viewer:

    
     ```HTML
     <script src="http://kendo.cdn.telerik.com/VERSION/js/cultures/kendo.culture.[culture-identifier].min.js"></script>
     ```
   For example:
   
   ```HTML
   <script src="http://kendo.cdn.telerik.com/2019.1.115/js/cultures/kendo.culture.es-PY.min.js"></script>
   ```  
     
3.  Then the culture of the Kendo widget must be set through the script below which should be placed before the report viewer's initialization:

	```HTML
	<script type="text/javascript">
		kendo.culture("es-PY");
	</script>
	```
  
  
 ## Demo
 A sample project can be found in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/Change%20of%20Culture%20of%20Kendo%20DatePicker%20in%20the%20HTML5%20MVC%20RV).
 
