---
title: Generating Accessible PDF Reports
page_title: Generating Accessible PDF Reports with Telerik Reporting
description: Learn how to generate accessible PDF/UA files from Telerik report sources.
type: how-to
slug: kb-generating-accessible-pdf-reports
tags: accessibility, pdf, pdfua, export
published: True
---

## Environment

| Product | Author | 
| ---- | ---- | 
| Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Generate a PDF/UA document from a Telerik report source by setting the PDF device information setting `EnableAccessibility` to `true`. 

## Solution

Use a supported Telerik report definition, such as a TRDP file, as the input to `ReportProcessor.RenderReport`. Set `EnableAccessibility` in the device information table, then save the returned PDF bytes.

The following example assumes that `C:\Reports\MyReport.trdp` exists within the application's base directory. Default report-path validation rejects report definitions outside that directory.

```csharp
using System;
using System.Collections;
using System.IO;
using Telerik.Reporting;
using Telerik.Reporting.Processing;

internal static class Program
{
    private static void Main()
    {
        const string reportDirectory = @"C:\Reports";
        Directory.CreateDirectory(reportDirectory);

        var reportSource = new UriReportSource
        {
            Uri = Path.Combine(reportDirectory, "MyReport.trdp")
        };

        var deviceInfo = new Hashtable();
        deviceInfo["EnableAccessibility"] = true;

        var reportProcessor = new ReportProcessor();
        var result = reportProcessor.RenderReport("PDF", reportSource, deviceInfo);

        if (result.HasErrors)
        {
            throw new InvalidOperationException("The report could not be rendered.");
        }

        var pdfPath = Path.Combine(reportDirectory, "AccessibleReport.pdf");
        File.WriteAllBytes(pdfPath, result.DocumentBytes);
    }
}
```

The code creates `C:\Reports\AccessibleReport.pdf` with PDF accessibility tags enabled. This setting alone does not ensure that the report content is accessible.

In the report definition, provide meaningful `AccessibleDescription` values for `PictureBox`, `Graph`, and `Map` items. Set appropriate `DocumentTitle` and `DocumentNaturalLanguage` values in the device information table. Alternatively, ensure that the report's `DocumentName` and `Culture` properties provide appropriate fallback values.

## Notes

`UriReportSource` accepts TRDX, TRDJ, TRDP, and TRBP report definition files. The documented built-in report converters do not include RDLC, RPT, or other non-Telerik report formats. Convert or recreate the report as a supported Telerik report before you use this example.

To add accessibility tags to an existing PDF document, use RadPdfProcessing as a separate workflow. See <a href="https://www.telerik.com/document-processing-libraries/documentation/libraries/radpdfprocessing/features/accessibility-support/create-accessible-pdf-documents" target="_blank" rel="noopener">Creating Accessible PDF Documents with RadPdfProcessing</a>.

## See Also

* [PDF device information settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings)
* [Generating reports locally with code](slug:telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine)
* [Report sources overview](slug:telerikreporting/designing-reports/report-sources/overview)
