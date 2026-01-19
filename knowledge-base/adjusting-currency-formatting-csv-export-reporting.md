---
title: Adjusting Currency Formatting for CSV Export
description: Learn how to ensure numeric values are recognized correctly when exporting reports with currency formatting to CSV
type: how-to
page_title: Handling Currency Formatting for CSV Export in Reporting
meta_title: Handling Currency Formatting for CSV Export in Reporting
slug: adjusting-currency-formatting-csv-export-reporting
tags: reporting, csv, export, currency formatting, textbox, format property, reportprocessor
res_type: kb
ticketid: 1703567
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Reporting</td>
        </tr>
    </tbody>
</table>

## Description

When exporting reports to CSV with the ReportProcessor class in Telerik Reporting, currency values formatted using a [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%})'s `Format` property (e.g., `"{0:C2}"`) include group separators and currency symbols. This formatting prevents Excel from recognizing the exported values as numbers. Contrary to expectations, the CSV rendering extension respects the `Format` property of report items, which is intentional behavior. Adjusting the `Culture` object does not resolve this issue due to changes in the report processing pipeline.

## Solution

To ensure numeric values are recognized correctly in CSV export, programmatically remove the `Format` property from the relevant TextBox items before exporting the report. The following examples demonstrate different approaches to resolving this issue:

Example 1:

Consider using data binding for the `Format` property:

`= RenderingFormat.Name = "CSV" ? Null : "{0:C2}"`

Example 2:

1. Locate the TextBox items in the report.
1. Clear the `Format` property of the TextBox items programmatically before the export operation.

Here is an example implementation:

````CSharp
private void GenerateReport(string format)
{
	//...
	if (format == "CSV")
	{
		var textBox2 = report.Items.Find("textBox2", true).FirstOrDefault();
		(textBox2 as Telerik.Reporting.TextBox).Format = null;
	}
	//...
}
````

To apply this approach to multiple textbox items in similar scenarios, modify the code that locates the items as needed. For example:

````CSharp
var textBoxItems = report.Items.Find(typeof(Telerik.Reporting.TextBox), true).ToList();
````

This approach removes formatting applied to the TextBox items, ensuring the exported CSV contains raw numeric values.

## See Also

* [CSV Rendering Design Considerations]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/csv-rendering-design-considerations%})
* [TextBox Report Item Overview]({%slug telerikreporting/designing-reports/report-structure/textbox%})
* [Device Information Settings for the CSV rendering format]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/csv-device-information-settings%})
