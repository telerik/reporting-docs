---
title: How to Determine the Effective Visibility of the Angular Viewer Parameters Area
description: How to determine whether the Angular Viewer parameters area is currently visible
type: how-to
page_title: Determine Parameters Area Visibility of Angular Viewer
slug: how-to-determine-effective-visibility-of-parameters-area
position: 
tags: 
ticketid: 1502945
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
			<td>Angular</td>
		</tr>
	</tbody>
</table>

## Description

In the Angular Report Viewer component, one may successfully control the visibility of the parameter area with the means of the _parametersAreaVisible_ [option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%}#available-options). However, it cannot be used to determine the current state of the parameters area visibility that may have changed due to user interaction with the viewer.

## Suggested Workarounds

The _parametersAreaVisible_, as any other option of the viewer, specifies only the initial/default value of the corresponding property, and its value is not updated afterward. That's why it is not possible to take the state of the parameters area visibility from it.

As a workaround, you may use _jQuery_ to get the html element of the parameters area and check whether its width is 0. If so, the parameters' area is hidden. This may be done, for example, on the _updateUi_ [event]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events%}). Here is also the code for selecting the area and taking its width:

````JavaScript
$(".trv-parameters-area").width()
````

