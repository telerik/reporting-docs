---
title: Hide table borders extending to the next page
description: How to hide table borders that extend to the end of the page
type: how-to
page_title: Remove Extra Table Borders When the Table Is Paged
slug: hide-table-borders-extending-to-the-next-page
position: 
tags: 
ticketid: 1453320
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

By design, the borders of the [Table item](../table-working-with-table-cross-table-list-items) will be drawn to the end of the page to indicate that the table is continued to the next page.
When the table is paged vertically the vertical borders will be extended to the bottom of the page. When the table is paged horizontally 
the horizontal borders will be extended to the right end of the page.

In some scenarios, this behavior is not wanted and the borders of the table need to be hidden.

## Solution

Open Table item's properties in the report designer and set **Style.BorderStyle.Default** property to **None**.
In this case, only the borders of each cell (TextBox item) will be visualized. 

## See Also

[Using Styles to Customize Reports](../style-using-styles-to-customize-reports)
