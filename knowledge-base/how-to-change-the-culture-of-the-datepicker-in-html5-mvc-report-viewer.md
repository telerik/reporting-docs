---
title: Set DatePicker Culture in MVC Report Viewer
description: "Learn how to set another language/culture for the Kendo DatePicker widget in MVC Report Viewer."
type: how-to
page_title: Changing the culture of the DatePicker in MVC Report Viewer
slug: how-to-change-the-culture-of-the-datepicker-in-html5-mvc-report-viewer
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
That is why the Html5 MVC Report Viewer localization will not affect its date representation.

This KB article gives a brief description of how to set up another language. The example will demonstrate the date representation in **Spanish**.

## Solution

1. Add the following script after the script for the report viewer:

	````HTML
<script src="http://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/cultures/kendo.culture.es-PY.min.js"></script>
```` 

2. Then, the culture of the Kendo widget must be set through the script below which should be placed before the report viewer's initialization:

	````HTML
<script type="text/javascript">
		kendo.culture("es-PY");
	</script>
````


 ## Demo
 
 A sample project can be found in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/Change%20of%20Culture%20of%20Kendo%20DatePicker%20in%20the%20HTML5%20MVC%20RV).
