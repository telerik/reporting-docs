---
title: Modify default Document Map and Parameter areas width in Html5 Report Viewer
description: How to change the default Document Map and Parameter areas sizes on initial load in the Html5 Report Viewer with Kendo splitter
type: how-to
page_title: Resize the default Document Map and Parameter areas sizes through the splitter
slug: modify-html5-viewer-area-width-through-kendo-splitter
position: 
tags: 
ticketid: 1398733
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116 and above</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<
td>All Html5 Report Viewers</td>
	</tr>
</table>


## Description
Sometimes it may be necessary to increase/decrease the default width of the _Document Map_ and _Parameters_ Area inside report viewer on initial load.

## Solution
In the Telerik Html5 Report Viewer, we have added Kendo splitter to control the sizes of the viewer's areas. This enables the end-user to resize them using the pointing device. By default _Document Map_ and _Parameter_ areas have width _210px_. This default/initial value is not configurable in our Html5 Viewers. As the Telerik Report Viewer uses Kendo UI widgets, the user could change the UI as desired through the corresponding Kendo widget settings and options.  
  
To modify the _Document Map_ or _Parameter_ area width you may include the following code in the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) or [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args)%}) event of the viewer :   
  

```JavaScript
var splitter = $("#reportViewerId").find(".k-splitter").data("kendoSplitter")

splitter.options.panes[0].size = "350px";// use array index 0 for Parameter area and 1 for Document Map area

splitter.resize(true);
```
  
The above code will resize the _Document Map_ area to the wanted size (_350px_). To resize the _Parameters_ area use index 1 (one).
