---
title: Kendo treeview icons missing in Document map area Telerik® Reporting R3 2018 SP1 (12.2.18.1017). 
page_title: Kendo treeview icons missing in Document map area after update to R3 2018 SP1
slug: document-map-missing-treeview-icons
position: 
tags: HTML5ReportViewer, DocumentMap, MissingIcons
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.2.18.1017</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>

## Description
After updating to R3 2018 SP1, Kendo treeview icons disappeared.

## Solution
The icons could appear again by adding the following style to your project:
```JavaScript
.k-treeview .k-plus:before,
.k-i-expand:before { content: "\e005"; }

.k-treeview .k-minus:before,
.k-i-collapse:before { content: "\e001"; }
```
