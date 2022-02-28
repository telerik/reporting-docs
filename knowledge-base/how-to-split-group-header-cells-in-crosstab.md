---
title: Unmerge Crosstab row/column headers
description: how to split group header cells in a Table/Crosstab
type: how-to
page_title: Split Table group headers
slug: how-to-split-group-header-cells-in-crosstab
position: 
tags: table,crosstab,row header,column header,unmerge
ticketid: 1171917
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Sometimes it is required the row(column) grouping cells/items to appear **unmerged** in the _CrossTab_. 

## Solution
It is necessary to insert additional columns(rows) in the **Body** area of the _CrossTab_ and hide the corresponding items (cells/columns/rows) in the **Row Group** / **Column Group** and **Corner** areas (details on CrossTab areas can be found in [Understanding Crosstab Areas]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas %}) article).

The approach is demonstrated in [those sample reports](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/crosstabunmergeheaderssamplereports.zip?sfvrsn=db3863fc_2).
+ **report_original(merged).trdp** is the original report with merged by default row and column headers.
+ **report_unmerged_onlyRows.trdp** is the report with unmerged row headers and merged column headers. Check the [video demonstrating how to split header rows](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/rows_unmergecrosstab.swf?sfvrsn=26f1af42_2) for transition from the original report to the report with only rows unmerged. 
+ **report_unmerged_RowsAndColumns.trdp** is the report with unmerged row and column headers. Check the [video demonstrating how to split header columns](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/columns_unmergecrosstab.swf?sfvrsn=196cfad3_2) for transition from the report with only rows unmerged to the report with both header rows and columns unmerged.
