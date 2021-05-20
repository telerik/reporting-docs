---
title: Close the Multi-Select Parameter Editor in the Html5 Report Viewer on Each Selection
description: How to hide the list of available values on each selection in the multi-select parameter editor in the Html5 Report Viewer
type: how-to
page_title: How to close multi-select parameter editor on each user selection
slug: close-multi-select-parameter-editor-on-each-selection-html5-viewer
position: 
tags: 
ticketid: 1519420
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
The multi-select parameter editor in the Html5 Report Viewer is a [Kendo Multiselect widget](../../kendo-ui/api/javascript/ui/multiselect) .Generally, you may control 
whether its popup with the available values is opened or closed. In some cases, it is required that the popup closes on each item selection. 
The implementation of the Html5 Viewer doesn't include this functionality and the popup with the available values stays opened until the user clicks outside the popup area.  
The reason for this is that if the __AutoRefresh__ of the corresponding Report Parameter is __True__ and the popup closes on each item select, the report would be 
automatically refreshed on each item selection, which may be overhead.

## Suggested Workarounds
Here is a sample code you may apply in the [renderingEnd](../html5-report-viewer-reportviewer-events-renderingend) event handler of the viewer:
```JavaScript
$("#reportViewer1")
    .telerik_ReportViewer({
    ....
        renderingEnd: function () {
            var multiselect = $(".k-widget .k-multiselect .trv-combo").data("kendoMultiSelect");
            multiselect.bind("change", function () {
                if (!multiselect.open()) { multiselect.toggle() };
            });
        }
    });
```
Generally, the above function selects the Kendo Multiselect widget and sets up its [Change event](../../kendo-ui/api/javascript/ui/multiselect/events/change) handler to close the popup if it is opened.
