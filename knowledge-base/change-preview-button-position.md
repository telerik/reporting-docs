---
title: Change the Position of the Preview Button in the MVC Report Viewer
description: How to change the position of the preview button in the MVC Report Viewer
type: how-to
page_title: Move the Preview Button
slug: change-preview-button-position
position: 
tags: MVC Report Viewer
ticketid: 1480523
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.1.20.618</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 ASP.NET MVC</td>
		</tr>
	</tbody>
</table>


## Description
By default, the **Preview** button in the MVC Report Viewer is positioned at the bottom of the **Parameters Area**. If your application has
only a limited number of **Parameter Editor** in the **Parameters Area**, you may want to move the **Preview** button higher. This document explains how to do this.

## Solution
In this guide, we propose two possible solutions. Both solutions use the following three CSS classes to modify the position of the **Preview** button:

- `trv-parameters-area-preview-button`
- `trv-parameters-area-footer`
- `trv-parameters-area-content`

The CSS class `trv-parameters-area-preview-button` belongs to the **Preview** button and it is in the same `<div>` as the `trv-parameters-area-footer` CSS class.
The CSS class `trv-parameters-area-content` is within a second `<div>` element. By default, all three classes have a `position` set to `absolute`.
You need to remove all these absolute positions to reorder the **Parameter Editors** and the **Preview** button.

### Modify the styles on the Report Viewer page
Remove the absolute positions on the Report Viewer page. For example, you can use the following styles on the page:

````
.trv-parameters-area-preview-button {
	position: relative !important;
}
.trv-parameters-area-footer {
	position: relative !important;
}
.trv-parameters-area-content {
	position: relative !important;
}
````

### Modify the styles in the local CSS file
The second approach is to modify the three CSS classes in the `telerikReportViewer-version.css` file, then to 
reference it locally so that the viewer styles get loaded from the local path instead of from the service. By default, the CSS files are located in the product's
installation folder, for example, `C:\Program Files (x86)\Progress\Telerik Reporting R2 2020\Html5\ReportViewer\styles`.

>Note
>
>If you use this approach, you must modify the `telerikReportViewer-version.css` file and copy it to the local folder whenever you upgrade Report Viewer to a new version.

## See Also
[How to Change the Parameter Editor's Type]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-change-parameter-editors-type%})

[How to Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
