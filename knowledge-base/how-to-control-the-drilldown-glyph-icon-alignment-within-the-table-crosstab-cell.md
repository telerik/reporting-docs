---
title: Control the Drilldown Glyph Icon Alignment within the Table/Crosstab Cell
description: Explains how to set the icon possition of the drilldown action
type: how-to
page_title: How to Control the Drilldown Glyph Icon Alignment within the Table/Crosstab Cell
slug: how-to-control-the-drilldown-glyph-icon-alignment-within-the-table-crosstab-cell
position: 
tags: action, table, crosstab
ticketid: 
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
			<td>Report element</td>
			<td>Action</td>
		</tr>
	</tbody>
</table>


## Description
Out of the box, the [drilldown](./designing-reports-interactivity-how-to-add-drilldown-action) (toggle visibility action) icon is with a fixed position. 
This article explains how to control it by using a panel and a textbox.


## Solution
In order to change the icon's position, our suggestion is in the place of the [Textbox](./report-items-text-box) toggle item to insert a [Panel](./report-items-panel). 
Then add within the panel item another panel for toggle visibility action (drilldown) and a textbox for the cell text (the previously used textbox). 
This way you can control the drilldown icon's exact position within the main panel item.

### See Also
- [Textbox](./report-items-text-box)
- [Panel](./report-items-panel)
- [How to Add a Drilldown/Toggle Visibility Action](./designing-reports-interactivity-how-to-add-drilldown-action)
