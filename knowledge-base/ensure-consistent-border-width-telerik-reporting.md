---
title: Ensuring Consistent Border Width in Table Cells in Telerik Reporting
description: "Learn how to maintain uniform border widths across table cells in Telerik Reporting by managing background color settings."
type: how-to
page_title: How to Achieve Uniform Border Widths in Telerik Reporting Table Cells
slug: ensure-consistent-border-width-telerik-reporting
tags: telerik, reporting, table, border, width, consistency
res_type: kb
ticketid: 1674842
---

## Environment

The following table identifies the product covered by this article:

| Property | Value |
|----------|-------|
| Product | Progress® Telerik® Reporting |

## Description

In some cases, the borders of table cells in a Telerik Report may appear inconsistently, with some borders looking thicker than others, even though the border width is set uniformly. This issue persists across different rendering formats, including PDF exports.

## Solution

To achieve consistent border widths across all table cells, set the same background color for each cell. The issue occurs because borders and background colors render together. Part of the border is drawn inside the cell, and part is drawn outside. The background color can affect the visible border thickness.

Follow these steps to resolve the issue:

1. Check the background color settings for each table cell. Identify if any cells have their background color explicitly set to `White` or any other color, while others are left as default.
2. Ensure the background colors of all table cells are either set to valid colors or left to the default (`transparent`) value:
   * Reset any explicitly set background colors to their default value. This ensures that all cells have uniform background settings, eliminating discrepancies in border visibility.
   * Alternatively, explicitly set a background color for all cells. This uniform application of background color will also ensure that the borders appear consistently across the table.

This approach addresses the root cause of the issue by aligning the rendering behavior of borders and background colors. It ensures uniform border thickness visibility across your report.

## See Also

- [How to structure table items]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%})
- [How to style report items]({%slug telerikreporting/designing-reports/styling-reports/styling-report-items%})
