---
title: How to move Parameters Area and Document Map on different place of the view
description: Display report filters and document map on a different position of the report viewer area
type: how-to
page_title: How to move Parameters Area and Document Map on different place of the view
slug: how-to-move-parameters-area
position: 
tags: HTML5ReportViewer, Layout
ticketid: 1165986
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>prior to R1 2019 (13.0.19.116)</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>


## Important note
This article is applicable for versions prior to R1 2019, e.g. till [R3 2018 SP2](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2018-sp2-12-2-18-1129), including. After R1 2019 Telerik Web Report Viewers use Kendo splitter for resizing Parameters and Document map areas. At this point, there is no way to change the Parameters Areas position.

## Description
The following article demonstrate how to display the Parameters area and/or Document Map area on different place than the default ones. By default, the [HTML5 Viewer's](../html5-report-viewer) parameters area is positioned on the right sight of the viewer and the Document Map - on the left sight.

## Solution
To change their location, you can customize the viewer's HTML by apply custom CSS to the viewer's elements. The provided examples are modified with custom JS and CSS rules. 
1. In **Html5ReportViewer-Top.html** file contains a report viewer which has Parameters Area at the top and Document Map as default - at the left side.
2. In **Html5ReportViewer-Reversed.html** file contains a report viewer which has Parameters Area at the left side and Document Map at the right side, i.e. I reversed them.

For example when parameters area is at the top, when toggling its visibiliity, the requirement would be to move other areas to avoid the remaining white spaces. This is done by custom functions *updatePagesAreaTopMargin*, *updatePagesAreaLeftMargin* and *updateDocumentMapArea*:
``` JavaScript
function updatePagesAreaTopMargin(condition, marginType) {
	if (condition) {
		$(".trv-pages-area").css(marginType, "3.5em");
	}
	else {
		$(".trv-pages-area").css(marginType, "0em");
	}
}
function updatePagesAreaLeftMargin(condition, marginType) {
	if (condition) {
		$(".trv-pages-area").css(marginType, "12em");
	}
	else {
		$(".trv-pages-area").css(marginType, "0em");
	}
}
function updateDocumentMapArea(condition, marginType) {
	if (condition) {
		$(".trv-document-map").css(marginType, "3.5em");
	}
	else {
		$(".trv-document-map").css(marginType, "0em");
	}
}
```
Then apply these functions in callback function *updateUi* that will be called every time the UI needs an update (for more information, please check [the full list of options during viewer's initialization](../html5-report-viewer-jquery-fn-telerik-reportviewer)):
``` JavaScript
updateUi: function (e) {
    var rv = e.data.sender;
	updatePagesAreaLeftMargin(rv.commands.toggleDocumentMap.checked(), "margin-left");
	updatePagesAreaTopMargin(rv.commands.toggleParametersArea.checked(), "margin-top");
	updateDocumentMapArea(rv.commands.toggleParametersArea.checked(), "margin-top");
}
```
At the end, it would be needed to add custom CSS rules as provided ones in the attached project (between <style></style> tags in viewer initialization file).

The rest of the placements could be done by following the same logic.

### See Also
You can download the sample application containing both approaches from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/samplecustomizinghtml5viewerparamarea.zip?sfvrsn=2bd66a3_2).
In order to build it successfully, you will need to use the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %}) to upgrade/downgrade to the latest installed version on the machine.
