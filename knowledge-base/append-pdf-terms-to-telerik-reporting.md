---
title: Adding PDF Terms and Conditions to a Telerik Reporting Report
description: Learn how to append a PDF with terms and conditions to the last page of a Telerik Reporting report using Telerik Reporting and Telerik Document Processing.
type: how-to
page_title: How to Append Terms and Conditions PDF to Telerik Reporting Report
slug: append-pdf-terms-to-telerik-reporting
tags: telerik reporting, pdf, terms-and-conditions, radpdfprocessing, append-pdf, report-processing
res_type: kb
ticketid: 1690348
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 19.1.25.521| Telerik Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
| 2025.2.520| RadPdfProcessing |-|

## Description

I want to append a PDF containing general terms and conditions to the last page of my Telerik Reporting report (.trdp files). The terms and conditions PDF should always appear at the end, regardless of the report's content.

This knowledge base article also answers the following questions:
- How can I add a PDF page to a Telerik Reporting report?
- How can I programmatically append terms and conditions to a PDF report?
- Can Telerik Reporting and Telerik Document Processing work together to modify reports?

## Solution

To achieve this functionality, use Telerik Reporting to generate reports and Telerik Document Processing to manipulate the PDF. Follow these steps:

1. **Generate the Report PDF using Telerik Reporting**  
   Use Telerik Reporting to render the report as a PDF file. Refer to the [Telerik Reporting documentation](https://docs.telerik.com/reporting/introduction) for more details on generating reports locally.

2. **Import and Modify the Report using Telerik Document Processing**  
   Use Telerik Document Processing's RadPdfProcessing library to import the generated PDF, append a new page with the terms and conditions, and export the final document. Refer to [RadPdfProcessing documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) for additional details.

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
            // Set up image properties for compatibility
            Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
            Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

            string reportFolderPath = @"..\..\..\Reports";
            string pdfFolderPath = reportFolderPath + @"\Pdf Files";
            string[] reportFiles = Directory.GetFiles(reportFolderPath);

            foreach (string reportFilePath in reportFiles)
            {
                // Generate report PDF using Telerik Reporting
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

                // Import and modify the PDF using Telerik Document Processing
                string filePathToImport = pdfFolderPath + @"\" + fileName;
                PdfFormatProvider pdfProvider = new PdfFormatProvider();
                fileName = result.DocumentName + "_withTerms." + result.Extension;
                filePath = pdfFolderPath + @"\" + fileName;

                using (Stream output = File.OpenWrite(filePath))
                {
                    RadFixedDocument fixedDocument = pdfProvider.Import(File.OpenRead(filePathToImport), TimeSpan.FromSeconds(10));

                    // Add a new page with terms and conditions
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
                    TextFragment textFragment2 = new TextFragment("By Document Processing Libraries");
                    textFragment2.CharacterSpacing = 10;
                    textFragment2.WordSpacing = 20;
                    textFragment2.Position = simplePosition2;
                    page.Content.Add(textFragment2);

                    pdfProvider.Export(fixedDocument, output, TimeSpan.FromSeconds(10));
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
- [Telerik Reporting Documentation](https://docs.telerik.com/reporting/introduction)
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [PDF Format Provider](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#import)
