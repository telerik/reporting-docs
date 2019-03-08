---
title: Expand Document Map tree on the initial load in the Html5 Report Viewers
description: How to make the Document Map (Bookmark) tree expanded by default on the initial load in the Html5 Report Viewers
type: how-to
page_title: How to make Document Map tree expanded by default in the Html5 Viewers
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
You may want to have the _Document Map_ tree expanded by default on the initial load of the viewer. Currently, the user has to click on the tree node and expand it after the page is rendered.

## Solution
The _DocumentMap_ area is a [Kendo UI TreeView](https://docs.telerik.com/kendo-ui/api/javascript/ui/treeview) widget. It may contain multiple nested nodes that are collapsed by default. Expanding initially all nodes is not supported out of the box.   
  
You may get the _Kendo treeView_ widget and expand its nodes, for example with the [expand](https://docs.telerik.com/kendo-ui/api/javascript/ui/treeview/methods/expand) method. It will be necessary to iterate over all the nodes of the _Document Map_, for example using recursion - _AllExpand_ function in the code below.
For expanding the nodes you may use the [RenderingEnd ](../html5-report-viewer-reportviewer-events-renderingend) event of the viewer, where the _args.documentMapAvailable_ property specifies whether the report has a _Document Map_ set.
Here is a sample code :  
  

```JavaScript
<script type="text/javascript">
  ...
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
        AllExpand(kendoTreeView, kendoTreeView.element);
    }
  }

  $(document).ready(function () {
     ...
     // Viewer configuration
     $("#reportViewer1")
	.telerik_ReportViewer({
		...
		renderingEnd: onRenderingEnd
    });
    ...
  });
</script>
```
