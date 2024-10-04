---
title: Modify default Document Map and Parameter Areas width in HTML5 Report Viewer
description: "Learn how to change the default Document Map and Parameter Area size on initial load in the HTML5 Report Viewer with Kendo splitter"
type: how-to
page_title: Resize the default Document Map and Parameter Area sizes through the splitter
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
		<td>All Html5 Report Viewers</td>
	</tr>
</table>


## Description
Sometimes it may be necessary to increase/decrease the default width of the _Document Map_ and _Parameters_ Area inside report viewer on initial load.

In the Telerik HTML5 Report Viewer, we have added a [Kendo Splitter](https://demos.telerik.com/kendo-ui/splitter/index) to control the sizes of the viewer's areas. This enables the end-user to resize them using the pointing device. By default, _Document Map_ and _Parameter_ areas have a width of `210px`. This default value is not configurable in our HTML5 Report Viewers. As the Telerik Report Viewer uses Kendo UI widgets, the user could change the UI as desired through the corresponding Kendo widget settings and options.  

## Solution
  
To modify the _Document Map_ or _Parameter_ area width you may include the following code in the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) or [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args)%}) event of the viewer:   
  
### Solution for Document Map

````JavaScript
renderingEnd: function () {
    var splitter = $("#reportViewerId").find(".trv-document-map-splitter").data("kendoSplitter");
    splitter.options.panes[0].size = "350px";
    splitter.resize(true);
}
````

### Solution for Parameter Area

````JavaScript
renderingEnd: function () {
	var splitter = $("#reportViewerId").find(".k-splitter").data("kendoSplitter");
	splitter.options.panes[1].size = "350px";
	splitter.resize(true);
}
````
