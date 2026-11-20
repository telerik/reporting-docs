---
title: Ensuring Consistent Border Width in Table Cells in Telerik Reporting
description: "Learn how to fix inconsistent table-cell borders in Telerik Reporting by setting a consistent background color for every cell."
type: how-to
page_title: How to Achieve Uniform Border Widths in Telerik Reporting Table Cells
slug: ensure-consistent-border-width-telerik-reporting
tags: telerik, reporting, table, border, width, consistency
res_type: kb
ticketid: 1674842
---

## Environment

This article applies to the following product:

| Product |
|---|
| Progress® Telerik® Reporting |

## Description

In some cases, table cell borders in a Telerik Reporting report can appear inconsistent. Some borders look thicker than others, even when you set the same border width. This issue can occur across rendering formats, including PDF exports. This article answers the following questions:

* How do you fix varying border widths in table cells?
* How do you ensure consistent borders in Telerik Reporting tables?
* What causes some table cell borders to appear thicker in Telerik Reporting?

## Solution

To achieve consistent border widths across table cells, set the background color consistently for every cell. Seemingly thicker borders result from how the renderer draws borders and applies background colors. Part of the border is drawn inside the cell, and part is drawn outside. The background color can then affect the visible border thickness.

Follow these steps to resolve the issue:

1. Check the background color settings for each table cell. Identify cells with a background color explicitly set to `White` or another color while other cells use the default.
1. Ensure that all table cells use either a valid background color or the default transparent value:
   * Reset explicitly set background colors to the default. This gives all cells the same background settings and removes discrepancies in border visibility.
   * Alternatively, set the same background color for every cell. This consistent setting makes the borders appear uniform across the table.

This approach addresses the root cause of the issue by aligning the rendering behavior of borders and background colors, ensuring uniform border thickness visibility across your report.

## See Also

* [Table Item Overview](slug:telerikreporting/designing-reports/report-structure/table-crosstab-list/overview)
* [Styling Report Items](slug:telerikreporting/designing-reports/styling-reports/styling-report-items)
