---
title: Adjusting Currency Formatting for CSV Export in Telerik Reporting
description: Learn how to ensure numeric values are recognized correctly when exporting reports with currency formatting to CSV in Telerik Reporting.
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
<tr>
<td>Version</td>
<td>19.3.25.1111</td>
</tr>
</tbody>
</table>

## Description

When exporting reports to CSV with the ReportProcessor class in Telerik Reporting, currency values formatted using a TextBox's `Format` property (e.g., `"{0:C2}"`) include group separators and currency symbols. This formatting prevents Excel from recognizing the exported values as numbers. Contrary to expectations, the CSV rendering extension respects the `Format` property of report items, which is intentional behavior. Adjusting the `Culture` object does not resolve this issue due to changes in the report processing pipeline.

This knowledge base article also answers the following questions:
- How to export reports to CSV with numeric values in Reporting?
- How to remove currency formatting for CSV export in Reporting?
- How to handle Excel numeric recognition for exported CSV reports?

## Solution

To ensure numeric values are recognized correctly in CSV export, programmatically remove the `Format` property from the relevant TextBox items before exporting the report. Follow these steps:

1. Locate the TextBox items in the report.
2. Clear the `Format` property of the TextBox items programmatically before the export operation.

Here is an example implementation:

```csharp
private void GenerateReport(string format)
{
    // Check if the export format is CSV
    if (format == "CSV")
    {
        // Locate the specific TextBox item
        var textBox = report.Items.Find("textBox2", true).FirstOrDefault();
        if (textBox is Telerik.Reporting.TextBox textBox2)
        {
            // Clear the Format property
            textBox2.Format = null;
        }

        // Optional: Clear formatting for all TextBox items in the report
        var textBoxItems = report.Items.Find(typeof(Telerik.Reporting.TextBox), true).ToList();
        foreach (var item in textBoxItems)
        {
            if (item is Telerik.Reporting.TextBox textBoxItem)
            {
                textBoxItem.Format = null;
            }
        }
    }

    // Proceed with report generation logic
    ...
}
```

This approach removes formatting applied to the TextBox items, ensuring the exported CSV contains raw numeric values.

## See Also

- [CSV Rendering Design Considerations](https://docs.telerik.com/reporting/styling/rendering-and-paging/design-considerations-for-report-rendering/csv-rendering-design-considerations)
- [Telerik Reporting TextBox Documentation](https://docs.telerik.com/reporting/api/html/T_Telerik_Reporting_TextBox.htm)
- [How to Export Reports Programmatically](https://docs.telerik.com/reporting/programmatic-reporting/exporting-reports-programmatically)
