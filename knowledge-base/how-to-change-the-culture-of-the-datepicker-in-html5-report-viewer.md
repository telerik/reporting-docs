---
title: Set DatePicker Culture in HTML5 Report Viewer
description: "Learn how to set another language/culture for the Kendo DatePicker widget in HTML5 Report Viewer."
type: how-to
page_title: Changing the culture of the DatePicker in HTML5 Report Viewer
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
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
The datepicker is a [Kendo widget](https://docs.telerik.com/kendo-ui/controls/editors/datepicker/overview). That's why the Html5 Report Viewer (or any other Web-based viewer) localization will not affect its date representation. 

This KB article gives a brief description of how to set another language. The example will demonstrate the date representation in **French**.

## Solution
1. Add the following script in the web page which holds the report viewer:

	````HTML
<script src="http://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/cultures/kendo.culture.fr-FR.min.js"></script>
````

	A list with all versions can be found in [Kendo Supported Versions](https://docs.telerik.com/kendo-ui/intro/supporting/jquery-support).

2. Then, the culture of the Kendo widget must be set through the script below which should be placed before the report viewer's initialization:

	````HTML
<script type="text/javascript">
		kendo.culture("fr-FR");
</script>
````

