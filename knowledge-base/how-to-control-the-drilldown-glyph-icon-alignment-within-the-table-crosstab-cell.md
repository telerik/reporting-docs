---
title: Control the Drilldown Glyph Icon Alignment in Table Cell
description: "Learn how to set the icon possition of the drilldown action in a table cell in Telerik Reporting Table or Crosstab item."
type: how-to
page_title: Controling Drilldown Glyph Icon Alignment within Table/Crosstab Cell
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

Out of the box, the [drilldown]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%}) (toggle visibility action) icon is with a fixed position.

This article explains how to control it by using a panel and a textbox.

## Solution

In order to change the icon's position, our suggestion is in the place of the [Textbox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) toggle item to insert a [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}). Then add within the panel item another panel for toggle visibility action (drilldown) and a textbox for the cell text (the previously used textbox). This way you can control the drilldown icon's exact position within the main panel item.

## See Also

* [Textbox]({%slug telerikreporting/designing-reports/report-structure/textbox%})
* [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%})
* [How to Add a Drilldown/Toggle Visibility Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%})
