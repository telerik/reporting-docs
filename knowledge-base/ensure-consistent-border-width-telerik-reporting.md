---
title: Ensuring Consistent Border Width in Table Cells in Telerik Reporting
description: This article describes how to maintain uniform border widths across table cells in Telerik Reporting by managing background color settings.
type: how-to
page_title: How to Achieve Uniform Border Widths in Telerik Reporting Table Cells
slug: ensure-consistent-border-width-telerik-reporting
tags: telerik, reporting, table, border, width, consistency
res_type: kb
ticketid: 1674842
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

In some cases, the borders of table cells in a Telerik Report may appear inconsistently, with some borders looking thicker than others, even though the border width is set uniformly. This issue persists across different rendering formats, including PDF exports. This knowledge base article also answers the following questions:
- How to fix varying border widths in table cells?
- How to ensure border consistency in Telerik Reporting tables?
- What causes some table cell borders to appear thicker in Telerik Reporting?

## Solution

To achieve consistent border widths across all table cells, ensure that the background color of all cells is uniformly set. The issue with seemingly thicker borders arises from how borders and background colors are rendered. Part of the border is drawn inside the cell, and part outside. Then, the background color is applied, which can affect the visibility of the border's thickness.

Follow these steps to resolve the issue:

1. Check the background color settings for each table cell. Identify if any cells have their background color explicitly set to 'White' or any other color, while others are left as default.
2. Reset any explicitly set background colors to their default value. This ensures that all cells have uniform background settings, eliminating discrepancies in border visibility.
3. Alternatively, explicitly set a background color for all cells. This uniform application of background color will also ensure that the borders appear consistently across the table.

This approach addresses the root cause of the issue by aligning the rendering behavior of borders and background colors, ensuring uniform border thickness visibility across your report.

## See Also

- [Telerik Reporting Table Item](https://docs.telerik.com/reporting/table-working-with-table-cross-table-list-items)
- [Styling Report Items](https://docs.telerik.com/reporting/styling-report-items)
- [Report Item Properties](https://docs.telerik.com/reporting/report-items-properties)
