---
title: Kendo Treeview Icons Missing in Document Map Area
page_title: Treeview icons missing in Document map after upgrade to R3 2018 SP1
description: "Learn how to add the missing Kendo Treeview Icons to the Document Map Area of the Html5 Report Viewer in version R3 2018 SP1(12.2.18.1017)."
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

After updating to R3 2018 SP1 (12.2.18.1017), Kendo treeview icons disappeared.

## Solution

The icons could appear again by adding the following styles to your project:

````CSS
.k-treeview .k-plus:before,
.k-i-expand:before { content: "\e005"; }

.k-treeview .k-minus:before,
.k-i-collapse:before { content: "\e001"; }
````

