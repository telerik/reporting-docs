---
title: Expand Document Map tree by default in Html5 Report Viewers
description: How to expand Document Map tree initially in the Html5 Viewers
type: how-to
page_title: Make Bookmark tree expanded by default in Html5 Viewers
slug: how-to-expand-document-map-tree-by-default-in-html5-viewers
position: 
tags: 
ticketid: 1398733
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
You may want to have the Bookmark (Document Map) tree expanded by default. Currently, the user has to click on the tree node and expand it after the page is rendered.

## Solution
The _DocumentMap_ area is a [Kendo UI TreeView](https://docs.telerik.com/kendo-ui/api/javascript/ui/treeview) widget that is loaded on request with nested nodes. Expanding initially all nodes is not supported out of the box.   
  
You may get the _Kendo treeView_ element and expand it, for example with the [expand](https://docs.telerik.com/kendo-ui/api/javascript/ui/treeview/methods/expand) function. You may use the [RenderingEnd ](../html5-report-viewer-reportviewer-events-renderingend) event, where the _args.documentMapAvailable_ property specifies whether the report has a Document Map set. Consider the following code :  
  

```JavaScript
function AllExpand(treeview, e) {
    var Nodes = $(e).find("li");
    if (Nodes.length > 0) {
        treeview.expand(Nodes);
        for (var i = 0; i < Nodes.length; i++) {
            AllExpand(treeview, Nodes[i]);
        }
    }
    return;
}

function onRenderingEnd(e, args) {
    if (args.documentMapAvailable) {
        var kendoTreeView = $("#reportViewer1-documentMap").data("kendoTreeView");
        AllExpand(kendoTreeView, kendoTreeView.element)
    }
}
```
  
The _onRenderingEnd_ function is the handler for _RenderingEnd_ event of the viewer. 
