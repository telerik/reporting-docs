---
title: Some Html5 Report Viewer Styles are Broken with Kendo Themes 2022.1.119
description: How to fix the styles of the Html5 Report Viewer when using Kendo Themes 2022.1.119
type: how-to
page_title: Kendo Themes 2022.1.119 Break the Html5 Report Viewer Styles
slug: html5-viewer-styles-broken-with-kendo-2022-1-119
position: 
tags: 
ticketid: 1551073
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
			<td>Viewer</td>
			<td>All HTML5 Report Viewers</td>
		</tr>
	</tbody>
</table>


## Description
There are styling issues in the [Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and its wrappers when you use it with the Kendo themes version 2022.1.119. For example, the Preview button of the Report Paramaeters' area is not styled, the ComboBox parameter 
editors are broken when opening the dropdown, etc.

## Suggested Workarounds
You need to reference the older Kendo CSS styles in the view/page with the ReportViewer. This fixes the appearance of the broken elements. You may leave the new styles 
referenced on the other pages, as well as on the layout page. This way, the old styles should be applied only to the Viewer's page and the new styles will be used in the rest.
