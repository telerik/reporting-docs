---
title: Native Blazor Report Viewer Doesn't Display All Page Borders in ContinuousScroll
description: "Learn how to work around the problem when the Page Mode of the Native Blazor Report Viewer is set to ContinuousScroll, and not all borders are displayed around the pages."
type: how-to
page_title: Page borders are not displayed in ContinuousScroll mode of Native Blazor Report Viewer
slug: page-borders-not-displayed-in-continuous-scroll-in-native-blazor-viewer
position: 
tags: native,blazor,viewer,continuous,scroll,page,borders,separators
ticketid: 1603728
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

In the [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) when the `PageMode` is set to `ContinuousScroll` the borders around the pages are not displayed correctly.

## Suggested Workarounds

Add the following code in the page with the viewer:

````HTML
<style>
	.sheet .layer {
		border: 1px solid #cccc;
	}
	
	.trv-report-page {
		border-style: none;
		margin-top: 20px;
	}
</style>
````


## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
