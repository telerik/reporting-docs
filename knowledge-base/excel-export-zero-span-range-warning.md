---
title: Zero Span Range Warning During Excel Export
page_title: Diagnose Zero Span Range Warnings in Excel Export
description: "Understand the Zero span range warning in Telerik Reporting Excel exports, interpret its row and column spans, and investigate potentially missing cell content."
type: troubleshooting
slug: excel-export-zero-span-range-warning
tags: excel, xlsx, rendering, layout, trace, zero span range
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.2.26.1007| Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

During Excel export, the reporting engine can log a `Zero span range` warning when the computed worksheet range for a report item spans fewer than one row or column. For example:

```text
Zero span range - (177819, 10) - (0, 3)
```

The message uses the format `Zero span range - (startRowIndex, startColIndex) - (rowSpan, colSpan)`:

* The first pair contains the internal starting row and column indices of the worksheet range.
* The second pair contains the number of rows and columns that the range spans.

In this example, the range starts at internal row index `177819` and column index `10`, with a row span of `0` and a column span of `3`. These indices describe the worksheet layout, not a data-record index or a report-item name.

## Cause

The Excel layout engine calculates spans from report-item boundaries mapped to worksheet grid positions. Positions within the layout engine's precision tolerance can be treated as the same boundary. However, the warning alone does not identify the report item or establish the cause in a particular report.

When this condition occurs, the engine logs a warning and returns no worksheet range for the item. This warning is not itself an exception, but it should not automatically be ignored. For example, a TextBox value is not written when no range is available for that item.

## Solution

To investigate the warning:

1. Inspect the exported workbook for missing values or unexpected layout, even if the export completes successfully.
1. Check report-item dimensions and edge alignment, including layout changes applied at runtime. Use the [report layout troubleshooting guidance](slug:troubleshoot-report-definition-tips#troubleshooting-report-layout) to isolate the affected section or item, and check for [Bindings and Conditional Formatting that change the layout](slug:troubleshoot-report-definition-tips#fixing-report-designer-warnings).
1. Reduce the report and input data to the smallest example that retains the warning for easier troubleshooting.

## See Also

* [Design Considerations for Excel Rendering](slug:telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations)