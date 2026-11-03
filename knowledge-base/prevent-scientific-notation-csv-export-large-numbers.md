---
title: Preventing Scientific Notation in CSV Export for Large Numbers
description: Learn how to prevent scientific notation in CSV-exported documents opened in Excel when working with large numeric values.
type: how-to
page_title: Display Large Numbers in CSV Export Without Scientific Notation
meta_title: Display Large Numbers in CSV Export Without Scientific Notation
slug: prevent-scientific-notation-csv-export-large-numbers
tags: reporting, csv, scientific-notation, exporting, formatting,excel
res_type: kb
ticketid: 1720116
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td>
Reporting
</td>
</tr>
</tbody>
</table>

## Description

When exporting reports to CSV in Telerik Reporting, large numeric values may display in scientific notation (e.g., `2.61001E+11` instead of `261001003930`) upon opening the files in Excel. This behavior occurs because Microsoft Excel automatically formats large numbers in scientific notation when opening CSV files. The issue persists even when trying formatting expressions such as `{0:N2}` or converting numeric values to strings. The column in question may also contain both numeric and text values.

While the export to XLSX lets us pass the formatting, for example '{0:N2}', the CSV file is a plain text file format, and we cannot pass the number formatting.

This knowledge base article also answers the following questions:
- How to prevent Excel from converting numbers to scientific notation in CSV exports?
- How to display large numeric values correctly in CSV exports?
- How to handle mixed numeric and text values in CSV reports?

## Solution

To prevent scientific notation in CSV exports and correctly display large numbers:

1. **Modify Excel Import Settings**:  
   When opening the CSV file in Excel, disable automatic data type detection:
   - Open a blank workbook in Excel.
   - Go to the **Data** tab and click **From Text/CSV** (or **Get Data > From File > From Text/CSV**).
   - Select the CSV file and click **Import**.
   - In the import window, set the data type for the column(s) containing large numbers to **Text**.
   - Click **Load**.

2. **Use Thousands Separator in Values**:  
   Add a thousands separator to numeric values in your report. For example, format the value as `100,000,000,000`. This forces Excel to treat the value as a string in CSV exports, avoiding scientific notation.

   Example expression in Telerik Reporting:
   ```
   = RenderingFormat.Name = "CSV" ? Format("{0:N0}", Fields.Value) : Fields.Value
   ```

3. **Export to XLSX Instead of CSV**:  
   Export the report to XLSX format instead of CSV. XLSX supports formatting, and you can directly use expressions like `{0:N2}` to control the number format.

4. **Manually Format Cells in Excel**:  
   If you already opened the CSV and see scientific notation, change the cell format to **Number**:
   - Select the column or cells containing the numbers.
   - Right-click and choose **Format Cells**.
   - Choose **Number** and specify the desired number of decimal places.

## See Also

- [Exporting Reports to CSV](https://docs.telerik.com/reporting/designing-reports/understanding-report-rendering/rendering-overview#csv)
- [Text Functions in Telerik Reporting](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions)
- [Working with Expressions in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/expressions-overview) 
