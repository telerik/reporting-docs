---
title: Reports with ContinuousPaper or Custom PaperKind are Cut when Printed on Some Printers
description: "Learn why the reports with PageSettings with ContinuousPaper set to True and/or PaperKind set to Custom may be cut when printed from printers that don't support custom paper sizes."
type: how-to
page_title: Reports with custom PageSettings are printed with cropped content
slug: reports-with-continuouspaper-or-custom-paperkind-cut-on-some-printers
position: 
tags: 
ticketid: 1606702
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

When the report is longer than a specific height, some printers, mostly label ones, for example, "EPSON TM-U220 Receipt", just stop printing, ignoring the remaining part of the report document. They print as expected when the printed reports are short, though.

Changing the `PaperSize` > `Height` or `ContinuousPaper` from the report definition [PageSettings](/api/telerik.reporting.drawing.pagesettings) doesn't help.

## Troubleshooting

The Reporting engine delegates the printing entirely to the [System.Drawing.Printing](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing?view=netframework-4.8) namespace. If the Microsoft functionality supports the particular printer, Telerik Reporting also does to the same extent.

Many printers support only limited paper sizes. This may be due to hardware or driver limitations. For example, the article [Instruction on how to set up the printer to print a bill which is longer than an A4 paper via EPSON TM-U220B](https://helpv2.cukcuk.com/en/kb/instruction-on-how-to-set-up-the-printer-to-print-a-bill-which-is-longer-than-an-a4-paper-via-epson-tm-u220b/) explains that "When printing a bill with EPSON TM-U220B, it only prints to the length of 297 mm (equivalent to an A4 paper). The cause may be that the driver of EPSON TM-U220B does not support a length of more than 297mm".

As an example, when printing a larger report from the [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) to the `Microsoft PDF Printer` with either `ContinuousPaper = True` or `Custom` Paper size, the printed document may be cut as this PDF printer supports a limited number of paper kinds and doesn't support custom paper size. Hence, it tries to print on its default paper size, which leads to the cut page content.

If you test printing the same report with [Foxit PDF](https://www.foxit.com/pdf-reader/) Printer, the report would most probably be printed as expected to a PDF file, as this PDF printer supports custom paper.

In such scenarios, you may continue troubleshooting on the hardware side rather than your reports. As a first step, you may try printing a large single-page document outside Telerik Reporting with the same printer to confirm that the problem is not related to the Reporting functionality or settings.

## Solution

Select, from the Printer Settings, a [`PaperKind`](/api/telerik.reporting.drawing.pagesettings#Telerik_Reporting_Drawing_PageSettings_PaperKind) with Paper Height that is sufficient to accommodate the printed single-page document.

For example, the physical label printer that we tested on is "Epson-TM-T20II-M267D". It supports a few 'Roll Paper' paper kinds with a length of **3276mm**. When we select such a paper kind, usually, the long reports with `ContinuousPaper = True` are printed as expected. However, selecting a shorter paper when printing the same report may cut it when the report's height is more than the printer paper size.

If the printer doesn't support long paper, you need to set the report's `ContinuousPaper` to `False` and print the document paginated, with [`PaperKind`](/api/telerik.reporting.drawing.pagesettings#Telerik_Reporting_Drawing_PageSettings_PaperKind) and [`PaperSize`](/api/telerik.reporting.drawing.pagesettings#Telerik_Reporting_Drawing_PageSettings_PaperSize) that are supported by the specific printer.

## Custom EMF Printing: Narrow or Distorted Output

If you render a report with `ReportProcessor.RenderReport("IMAGE", ...)` and print the EMF streams through your own `System.Drawing.Printing.PrintDocument`, distinguish the rendered page settings from the settings and drawing rectangle used by that print document. The report's `PageSettings` do not automatically configure an independently created `PrintDocument`.

For example, a custom handler that calls `e.Graphics.DrawImage(pageImage, e.MarginBounds)` scales the entire rendered page into the print document's margin rectangle. Removing a `DefaultPageSettings.PaperSize` assignment does not remove this scaling. Report margins are already part of the rendered page, so fitting that page inside another set of margins can reduce the content width again. If the destination rectangle has different proportions from the rendered page, the output can also appear stretched or compressed.

The roll width, report content width, and driver-reported printable width are different measurements. For example, an 80 mm report page with left and right margins of 0.08 inches has approximately 75.94 mm of content width. The printer's printable area is a separate constraint. Selecting an 80 mm paper form does not guarantee printing to both physical edges.

### Compare with Telerik-Managed Printing

Use `ReportProcessor.PrintReport(reportSource, printerSettings)` with valid settings for the selected printer as a comparison with the custom EMF loop. See [Print a Report Programmatically](slug:print-a-report-programmatically) for the supported API and an example.

Telerik's printing implementation applies page settings from the rendered page's layout information for each page. It then draws the page image to `PageBounds`, compensating for the printer's hard margins. It does not unconditionally leave all page settings at the printer defaults.

For a custom print loop, keep the rendered page dimensions, physical page settings, drawing units, and destination rectangle consistent. Do not assume that printer defaults alone perform this mapping, and do not stretch the image independently in width and height to fill a differently proportioned rectangle. Changing the paper size or replacing `MarginBounds` with `PageBounds` alone is not a complete fix unless the page geometry and hard-margin handling also agree.

### Diagnose the Width and Page-Length Mismatch

1. Before printing, record the number of rendered EMF streams and their physical page dimensions. If rendering already produced multiple pages, inspect the effective report page settings and width before attributing the pagination to the driver.
1. During the print job, record the effective paper size, margins, `PageBounds`, `MarginBounds`, and `HardMarginX` and `HardMarginY` values. Compare these with the rendered page dimensions using consistent units rather than treating image pixels as physical paper dimensions.
1. Compare the same report on the same printer through Telerik-managed printing and the custom handler. If only the custom path is narrow or distorted, investigate its page-setting and drawing calculations before changing the report layout or driver.
1. Verify the installed printer model and driver's supported paper forms, maximum length, printable area, and cutter configuration. The 3276 mm form tested on the TM-T20II does not establish that a TM-T88IV or another model supports the same form.

The [continuous-paper pagination settings](slug:telerikreporting/designing-reports/rendering-and-paging/understanding-pagination#print-on-continuous-roll-paper) control the rendered page's content-driven height. They do not guarantee a particular physical cut position or override the printer's capabilities. A successful test with a different printer does not, by itself, validate the custom handler's page geometry on the target device.
