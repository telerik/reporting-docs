---
title: FreezeColumnHeaders Doesn't Behave Properly with Action Set on the Table Header
description: The frozen row with table column headers is hidden when scrolling if there is Action set on the header
type: troubleshooting
page_title: FreezeColumnHeaders not Respected with Action
slug: freeze-column-header-with-action-not-working
position: 
tags: table, crosstab, FreezeColumnHeaders, Action
ticketid: 1549900
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5</td>
		</tr>
	</tbody>
</table>


## Description

When you [Freeze Column Headers]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-header-freezing%}) of a Table/Crosstab and apply an [Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%}) to a Table Header Cell, the headers don't freeze in the web viewers.

## Suggested Workarounds

Add the TextBox with the Action in a [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) rather than directly in the Table/Crosstab cell. This sets the action on an item that is not directly in the Table/Crossttab and allows the header to freeze as expected in the Html5 Report Viewer and its wrappers.

### See Also

[FreezeColumnHeaders functionality doesn't behave properly when Action is set on the header](https://feedback.telerik.com/reporting/1485084-freezecolumnheaders-functionality-doesn-t-behave-properly-when-action-is-set-on-the-header)
