---
title: Adding More Content to a PDF Report
description: Learn how to append a PDF with terms and conditions to the last page of a Telerik Reporting report using Telerik Reporting and Telerik Document Processing.
type: how-to
page_title: How to Append More Content to a PDF Report
slug: append-pdf-terms-to-telerik-reporting
tags: telerik, reporting, pdf, pdfprocessing, append 
res_type: kb
ticketid: 1690348
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 19.1.25.521| Telerik Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
| 2025.2.520| RadPdfProcessing |-|

## Description

This article demonstrates how to append a PDF, containing general terms and conditions, to the last page of my Telerik Reporting report (.trdp files exported as PDF documents). The terms and conditions PDF should always appear at the end, regardless of the report's content.

## Solution

To achieve this functionality, use:

* [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}) to generate reports.
* [Telerik Document Processing](https://docs.telerik.com/devtools/document-processing/introduction) to manipulate the PDF and add some extra content.

Follow these steps:

1. **Generate the Report PDF using Telerik Reporting**  
   Use Telerik Reporting to render the report as a PDF file. Refer to the [Generating Reports Locally with Code]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) article for more details on generating reports locally.

2. **Import and Modify the PDF Report using Telerik Document Processing**  
   Use Telerik Document Processing's [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) library to [import](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#import) the generated PDF, append a new page with the terms and conditions, and export the final document. Refer to [RadPdfProcessing documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) for additional details.

### Example Code

Below is a complete example demonstrating how to generate the report PDF and append a new page:

```csharp
using System.Diagnostics;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Data;
using Telerik.Windows.Documents.Fixed.Model.Editing;
using Telerik.Windows.Documents.Fixed.Model.Text;

namespace GeneratePDFReportsAndUpdate
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
            Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;
            //https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/images

            string reportFolderPath = @"..\..\..\Reports";
            string pdfFolderPath = reportFolderPath + @"\Pdf Files";
            string[] reportFiles = Directory.GetFiles(reportFolderPath);

            foreach (string reportFilePath in reportFiles)
            {
                var reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
                var deviceInfo = new System.Collections.Hashtable();

                var reportSource = new Telerik.Reporting.UriReportSource();
                reportSource.Uri = reportFilePath;

                Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", reportSource, deviceInfo);
                string fileName = result.DocumentName + "_byReporting." + result.Extension;
                string path = System.IO.Path.GetTempPath();
                string filePath = pdfFolderPath + @"\" + fileName;
                if (!result.HasErrors)
                {
                    using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
                    {
                        fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
                    }
                }
                Process.Start(new ProcessStartInfo() { FileName = filePath, UseShellExecute = true });

                // By Document Processing
                string filePathToImport = pdfFolderPath + @"\" + fileName;

                Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider pdf_provider = new PdfFormatProvider();
                string[] pdfFilesByReporting = Directory.GetFiles(pdfFolderPath);


                fileName = result.DocumentName + "_byDPL." + result.Extension;
                filePath = pdfFolderPath + @"\" + fileName;

                using (Stream output = File.OpenWrite(filePath))
                {
                    //import the PDF report
                    RadFixedDocument fixedDocument = pdf_provider.Import(File.OpenRead(filePathToImport), TimeSpan.FromSeconds(10));

                    //add a new page to the document
                    //https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/textfragment

                    RadFixedPage page = new RadFixedPage();
                    fixedDocument.Pages.Add(page); 
                    FixedContentEditor editor = new FixedContentEditor(page);

                    SimplePosition simplePosition = new SimplePosition();
                    simplePosition.Translate(20, 20);
                    TextFragment textFragment = page.Content.AddTextFragment("General terms and conditions");
                    textFragment.CharacterSpacing = 5;
                    textFragment.WordSpacing = 15;
                    textFragment.Position = simplePosition;

                    SimplePosition simplePosition2 = new SimplePosition();
                    simplePosition2.Translate(20, 120);
                    TextFragment textFragment2 = new TextFragment("by Document Processing Libraries");
                    textFragment2.CharacterSpacing = 10;
                    textFragment2.WordSpacing = 20;
                    textFragment2.Position = simplePosition2;
                    page.Content.Add(textFragment2);


                    pdf_provider.Export(fixedDocument, output, TimeSpan.FromSeconds(10));
                }

                Process.Start(new ProcessStartInfo() { FileName = filePath, UseShellExecute = true });
            }
        }
    }
}
```

### Key Steps Explained:
1. **Generate a PDF**: Use Telerik Reporting's `ReportProcessor` to render the `.trdp` file as a PDF.
2. **Import the PDF**: Use `PdfFormatProvider` from RadPdfProcessing to load the generated PDF.
3. **Add a Page**: Create a new page and use `FixedContentEditor` to add the terms and conditions text.
4. **Export the Modified PDF**: Save the final PDF with the appended terms and conditions.

## See Also
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [PDF Format Provider]([https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#import](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider))
