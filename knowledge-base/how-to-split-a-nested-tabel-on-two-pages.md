---
title: How to split a nested table on two pages
description: How to force a nested table to break between pages. 
type: how-to
page_title: Render nested tables on multiple pages
slug: how-to-split-a-nested-tabel-on-two-pages
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>All</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Item</td>
			<td>Table Report Item</td>
		</tr>
	</tbody>
</table>


## Description

By default, [Table/CrossTab/List item]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview %}) is kept together when the report is paged. 
However, a common requirement when using *nested* tables in the report is to force them to break between pages. In this article, we will explain how to achieve that behavior.  
  
## Solution
  
To force a nested table to break between pages, set [**KeepTogether**](../p-telerik-reporting-processing-table-keeptogether) property to *false* for the parent table and the **parent table's row** that is containing the nested table.  
  
## Notes

If the nested table contains report items that do not have *KeepTogether* properties (Graph, Map, PictureBox, Barcode, Shape), they will not be split between the pages.  

## See Also

[Understanding Pagination](../designing-reports-page-layout-rendering-understanding-pagination).

