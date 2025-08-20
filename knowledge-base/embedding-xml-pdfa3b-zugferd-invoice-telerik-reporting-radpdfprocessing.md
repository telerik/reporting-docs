---
title: Embedding a ZUGFeRD Invoice in a PDF Report
description: Learn how to embed XML into PDF/A-3b (ZUGFeRD Invoice) using Telerik Reporting and RadPdfProcessing libraries.
type: how-to
page_title: How to Add XML to PDF/A-3b ZUGFeRD Invoice with Telerik Reporting and RadPdfProcessing
meta_title: How to Add XML to PDF/A-3b ZUGFeRD Invoice with Telerik Reporting and RadPdfProcessing
slug: embedding-zugferd-invoice-in-pdf-report
tags: reporting, zugferd, invoice,xml, embed, compliance-level
res_type: kb
ticketid: 1695524
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
| 19.1.25.716 | Telerik Reporting|-|

## Description

This article demonstrates how to embed [ZUGFeRD](https://de.wikipedia.org/wiki/ZUGFeRD) (acronym for Zentraler User Guide des Forums elektronische Rechnung Deutschland) invoices to PDF reports combining **Telerik Reporting** and **Telerik Document Processing Libraries**.
 
## Solution

**Telerik Reporting** does not currently provide a built-in way to embed an XML file (such as the ZUGFeRD invoice) directly into the PDF during report generation. However, [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview), offered by the [Telerik Document Processing Libraries](https://docs.telerik.com/devtools/document-processing/introduction), provides such functionality out of the box.

The recommended workflow is:

1. [Generate the PDF Report using Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}).
1. [Import the PDF into RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#import).
1. [Embed the ZUGFeRD XML file](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/features/embedded-file-streams/embedded-file-streams#creating-an-embedded-electronic-zugferd-invoice).
1. [Export the final PDF](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#export).

### Code Example

Here is a code snippet that demonstrates the process:

````C#
using System.Diagnostics; 
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export;
using Telerik.Windows.Documents.Fixed.Model;

// Define paths for reports and PDFs
string reportFolderPath = @"..\..\..\Reports\Storage";
string pdfFolderPath = @"..\..\..\Reports\Pdf Files";
string[] reportFiles = Directory.GetFiles(reportFolderPath);

foreach (string reportFilePath in reportFiles)
{
    // Step 1: Generate PDF Report using Telerik Reporting
    var reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
    var deviceInfo = new System.Collections.Hashtable();

    var reportSource = new Telerik.Reporting.UriReportSource();
    reportSource.Uri = reportFilePath;

    Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", reportSource, deviceInfo);
    string fileName = result.DocumentName + "_byReporting." + result.Extension;
    string filePath = pdfFolderPath + @"\" + fileName;

    if (!result.HasErrors)
    {
        using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
        {
            fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
        }
    }

    // Step 2: Import the PDF Report, add ZUGFeRD XML, and Export PDF using Telerik Document Processing
    string filePathToImport = pdfFolderPath + @"\" + fileName;

    PdfFormatProvider pdfProvider = new PdfFormatProvider();
    RadFixedDocument fixedDocument = pdfProvider.Import(File.OpenRead(filePathToImport), TimeSpan.FromSeconds(10));

    // Embed the ZUGFeRD XML file
    byte[] xmlBytes = File.ReadAllBytes(@"zugferd-invoice.xml");
    fixedDocument.EmbeddedFiles.AddZugferdInvoice(xmlBytes);

    // Configure PDF export settings for compliance
    PdfExportSettings settings = new PdfExportSettings();
    settings.ComplianceLevel = PdfComplianceLevel.PdfA3B;
    pdfProvider.ExportSettings = settings;

    // Export the final PDF
    string exportedFileName = result.DocumentName + "_byDPL." + result.Extension;
    filePath = pdfFolderPath + @"\" + exportedFileName;
    using (Stream output = File.OpenWrite(exportedFileName))
    {
        pdfProvider.Export(fixedDocument, output, TimeSpan.FromSeconds(10));
    }

    Process.Start(new ProcessStartInfo { FileName = exportedFileName, UseShellExecute = true });
}
````

## See Also

* [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
* [Embedding ZUGFeRD Invoices](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/features/embedded-file-streams/embedded-file-streams#creating-an-embedded-electronic-zugferd-invoice)
