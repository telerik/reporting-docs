---
title: How to render reports to PDF with bookmarks in R2 2021
description: How to render reports to PDF with bookmarks in R2 2021
type: how-to
page_title: How to render reports to PDF with bookmarks in R2 2021
slug: how-to-render-reports-to-pdf-with-bookmarks-r2-2021
tags: PDFRendering
ticketid: 1525289
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>15.1.21.512</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Rendering Format</td>
			<td>PDF</td>
		</tr>
	</tbody>
</table>


## Description

When exporting a report with bookmarks to PDF in R2 2021 and R2 SP1 2021, the produced PDF does not have the report's bookmarks generated.

## Suggested Workarounds

There are three approaches that can be used to ensure that the produced PDF will have bookmarks:
 - The first and second workaround involve setting a property of the device info:
   ```cs
            var reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();

            var deviceInfo = new System.Collections.Hashtable();
           //choose one of the two
            deviceInfo["OutputDocumentMap"] = true;
            deviceInfo["ProcessItemActions"] = true; 

            var reportSource = new Telerik.Reporting.UriReportSource();

            reportSource.Uri = "Report_with_Bookmarks.trdp";

            Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", reportSource, deviceInfo);

            string fileName = result.DocumentName + "." + result.Extension;
            string path = "../../../";
            string filePath = System.IO.Path.Combine(path, fileName);

            using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
            {
                fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
            }
   ```
  - The third approach is adding a **TOC** section to the report. When the report has a TOC section, the produced PDF is with generated bookmarks - [How to Add a Table of Contents to Report Book](../table-of-contents-report-book).
