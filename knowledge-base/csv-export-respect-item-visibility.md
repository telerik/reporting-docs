---
title: Exclude Hidden Report Items from CSV with ReportProcessor
description: "Learn how to respect report item visibility during CSV export with per-call device settings and a shared ReportProcessor."
type: how-to
page_title: Respect Item Visibility in CSV Exports with ReportProcessor
slug: csv-export-respect-item-visibility
tags: csv, export, visibility, reportprocessor
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.2.26.1007 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

How can I exclude hidden report items from CSV when multiple reports use a shared `ReportProcessor` export path, without implementing a custom rendering extension?

## Solution

### Respect Item Visibility with a Shared `ReportProcessor`

To exclude hidden report items from CSV, use the `RespectItemVisibility` device information setting. It defaults to `true`, so the CSV renderer respects the processed items' `Visible` state unless the setting is disabled. Each report can define its own visibility rules without report-specific table names or column indexes in a shared export method.

> note `RespectItemVisibility` is available starting with Telerik Reporting 2026 Q4 (20.3.26.1007). Before that release, hidden report items were included in CSV by default. See [CSV Rendering Design Considerations](slug:telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/csv-rendering-design-considerations) for the version-specific behavior and format limitations.

Pass a separate `deviceInfo` collection for each rendering call. The following helper accepts a `ReportProcessor` and a configured `ReportSource`, so a shared export path can use different report definitions and parameters without a custom rendering extension.

```C#
using System;
using System.Collections;
using Telerik.Reporting;
using Telerik.Reporting.Processing;

public static class CsvExport
{
	public static RenderingResult RenderVisibleItems(
		ReportProcessor processor,
		ReportSource reportSource)
	{
		var deviceInfo = new Hashtable
		{
			["RespectItemVisibility"] = true,
			["NoStaticText"] = false,
			["NoHeader"] = false
		};

		RenderingResult result = processor.RenderReport("CSV", reportSource, deviceInfo);

		if (result.HasErrors)
		{
			throw new AggregateException("CSV rendering failed.", result.Errors);
		}

		return result;
	}
}
```

Supply a `UriReportSource` for a file-based report or an `InstanceReportSource` for an existing report instance. Set the required report source parameters before calling the helper. The returned `RenderingResult.DocumentBytes` contains the CSV document.

For comparison, set `RespectItemVisibility` to `false` to include hidden items. The setting affects CSV rendering only; it does not change the report definition or its PDF output.

### Distinguish Visibility, Static Text, and Headers

The settings control different aspects of the output:

- `RespectItemVisibility` excludes hidden report items when set to `true`.
- `NoStaticText` excludes static text when set to `true`, even if that text is visible. Leave it `false` when those values belong in the CSV output.
- `NoHeader` excludes the generated CSV header row when set to `true`. That row contains report item names, not their displayed values. It does not remove report header sections or selectively hide report items.

Returning an empty string from a `TextBox` expression clears its cell value but does not remove its CSV column. To exclude the item, use its visibility rules with `RespectItemVisibility`.

For the complete option names, types, and defaults, see [CSV Device Information Settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/csv-device-information-settings).

### Match Visible Fields and Values, Not PDF Layout

For report items represented in CSV, `RespectItemVisibility` provides visibility-based inclusion without a custom renderer. It does not make CSV identical to PDF. CSV flattens report data, ignores page headers and footers, and does not preserve PDF positioning, styling, or pagination. Compare the fields and values needed by the CSV consumer. Do not expect a page-for-page copy of the PDF.

If the required CSV structure goes beyond the built-in format, see [How to Create Custom Rendering Extension](slug:custom-rendering-extension). A custom implementation must define its own row-and-column mapping and CSV output rules. On versions supporting `RespectItemVisibility`, use the built-in setting for hidden-item exclusion.

## See Also

* [Configuring the CSV Rendering Extension](slug:configuring-the-csv-rendering-extension)