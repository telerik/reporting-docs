---
title: Modify default Document Map and Parameter areas width in Html5 Report Viewer
description: Resize the default areas sizes through the splitter
type: how-to
page_title: Change Side areas sizes in Html5 Viewer with the Kendo splitter
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
		<td>13.0.19.116+</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5 ASP.NET MVC</td>
	</tr>
</table>


## Description
Sometimes it may be necessary to increase/decrease the default areas' width of the _Html5 Report Viewer_ widgets.

## Solution
 In the Telerik Html5 Reprot Viewer, we have added Kendo splitter for its template areas, so the user to be able to resize them. By default _Document Map_ and _Parameter_ areas have width _210px_. This value is not configurable in our Html5 Viewers. As the Telerik Report Viewer uses Kendo UI widgets for its templates, the user could change the UI as desired through the corresponding Kendo widget settings and options.  
  
To modify the _Document Map_ or _Parameter_ area width you may include the following code in the [renderingEnd](https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-renderingend) or [pageReady](https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-pageready) event of the viewer :   
  

```JavaScript
var splitter = $("#reportViewerId").find(".k-splitter").data("kendoSplitter")

splitter.options.panes[0].size = "350px";// use array index 2 for Parameter area and 0 for Document Map area

splitter.resize(true);
```
  
The above code will resize the _Document Map_ area to the wanted size (_350px_). To resize the _Parameter_ area use index 2 (two).
