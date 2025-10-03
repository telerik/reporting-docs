---
title: Text Truncation in Rendered Reports When Using Spire.Office with Telerik Reporting
description: "Learn how to fix text truncation issues in Telerik Reporting when using the Spire.Office libraries in the same application."
type: troubleshooting
page_title: Fix Text Truncation When Using Spire.Office with Telerik Reporting
slug: text-truncation-spire-office-reporting
tags: reporting, spire, office, text, truncation, stringformat, gdi
res_type: kb
---

## Environment

<table>
  <tbody>
    <tr>
      <td>Product</td>
      <td>Progress® Telerik® Reporting</td>
      <td>Spire.Office</td>
    </tr>
    <tr>
      <td>Version</td>
      <td>19.2.25.1001</td>
      <td>8.12.2 or earlier</td>
    </tr>
  </tbody>
</table>

## Description

When using the Telerik Reporting in the same application that processes MS Office documents and PDF files with Spire.Office libraries, the text in the rendered reports gets truncated unexpectedly.

This issue occurs even when the Spire.Office operations are performed on completely unrelated documents before rendering the Telerik report.

## Cause

The issue is caused by Spire.Office modifying the global state of `System.Drawing.StringFormat.GenericTypographic`. After Spire.Office processes documents, the `GenericTypographic` method no longer returns a `StringFormat` object with the expected format flags.

**Expected StringFormat flags:**
- `StringFormatFlagsLineLimit`
- `StringFormatFlagsNoClip`
- `StringFormatFlagsNoFitBlackBox`

**Actual StringFormat flags after Spire.Office usage:**
- `StringFormatFlagsLineLimit`
- `StringFormatFlagsNoClip`
- `StringFormatFlagsNoFitBlackBox`
- `MeasureTrailingSpaces` (additional flag)

The extra `MeasureTrailingSpaces` flag causes incorrect text measurement in Telerik Reporting's GDI wrapper, leading to text truncation in some scenarios.

## Solution

To resolve this issue, manually remove the `MeasureTrailingSpaces` flag from the `GenericTypographic` StringFormat after using Spire.Office operations and before rendering Telerik reports:

````C#
using Telerik.Reporting;
using Telerik.Reporting.Processing;

// Spire.Office operations
Spire.Doc.Document document = new Spire.Doc.Document();
var wordDocPath = "./wordtest.docx";
var pdfFilePath = System.IO.Path.Combine("../../../", "wordtest.pdf");

document.LoadFromFile(wordDocPath);
Spire.Doc.ToPdfParameterList toPdf = new Spire.Doc.ToPdfParameterList();
document.SaveToFile(pdfFilePath, toPdf);
document.Close();

// Fix the StringFormat issue caused by Spire.Office
System.Drawing.StringFormat.GenericTypographic.FormatFlags &= ~System.Drawing.StringFormatFlags.MeasureTrailingSpaces;

// Telerik Reporting operations
// ...
````

## Additional Information

This issue affects only older versions of Spire.Office that use the GDI+ engine for text rendering. Starting from version `9.2.0`, it does not rely on GDI+.