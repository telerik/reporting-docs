---
title: Retrieving Themable Cell Color in RadSpreadProcessing
description: Learn how to retrieve the actual cell color in RadSpreadProcessing, including colors set through the document theme in Excel.
type: how-to
page_title: How to Retrieve Cell Color Set Through Document Theme in RadSpreadProcessing
slug: retrieve-cell-color-radspreadprocessing
tags: radspreadprocessing, document processing, cell color, themable color, document theme
res_type: kb
ticketid: 1656165
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When working with Excel files, cells can be formatted with colors, including those set through the document theme. If you've tried to retrieve the cell background color and encountered issues, especially with colors set in Microsoft Excel through the document theme, this article will guide you on how to accurately obtain the actual cell color.

This KB article also answers the following questions:
- How to get the background color of a cell in RadSpreadProcessing?
- How to handle themable colors in RadSpreadProcessing?
- How to work with document themes in RadSpreadProcessing?

## Solution

To retrieve the actual color of a cell that has been set through the document theme in Excel, it is necessary to understand how RadSpreadProcessing handles colors and themes. Follow the steps below:

1. Load the Excel file into a `Workbook` object using the appropriate format provider.
2. Access the specific cell or cells you're interested in.
3. Check if the cell's fill is of type `PatternFill`.
4. If so, retrieve the `PatternColor` and `BackgroundColor` properties, which are of type `ThemableColor`.
5. Use the `GetActualValue` method of the `ThemableColor` to get the actual color value, taking into account the document's theme.

Here's a sample code snippet demonstrating how to achieve this:

```csharp
string filePath = "Book1.xlsx";
Workbook workbook = new Workbook(); 
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

using (Stream input = new FileStream(filePath, FileMode.Open))
{
    workbook = formatProvider.Import(input);
}
Worksheet worksheet = workbook.Worksheets.First();
CellSelection selection = worksheet.Cells[0,1]; 
PatternFill solidPatternFill = selection.GetFill().Value as PatternFill;
if (solidPatternFill != null)
{
    ThemableColor patternColor = solidPatternFill.PatternColor;
    Color actualColor = patternColor.GetActualValue(workbook.Theme);
    // Output the RGB values of the actual color
    Debug.WriteLine("RGB: " + actualColor.R.ToString() + ", " + actualColor.G.ToString() + ", " + actualColor.B.ToString());
}
```

For colors set through the document theme, the `PatternColor.GetActualValue()` method is crucial for obtaining the actual color displayed in Excel.

## See Also

- [RadSpreadProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [Document Themes in RadSpreadProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/styling/document-themes)
- [Getting Actual Values of Themable Colors](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/styling/document-themes#getting-actual-values)
