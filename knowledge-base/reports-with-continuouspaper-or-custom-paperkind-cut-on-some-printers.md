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

When the report is longer than specific height, some printers, mostly label ones, for example, "EPSON TM-U220 Receipt", just stop printing, ignoring the remaining part of the report document. They print as expected when the printed reports are short though.

Changing the `PaperSize` > `Height` or `ContinuousPaper` from the report definition [PageSettings](/api/telerik.reporting.drawing.pagesettings) doesn't help.

## Troubleshooting

The Reporting engine delegates the printing entirely to the [System.Drawing.Printing](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing?view=netframework-4.8) namespace. If the Microsoft functionality supports the particular printer, Telerik Reporting also does to the same extent.

There are many printers that support only limited paper sizes. This may be due to hardware or driver limitations. For example, the article [Instruction on how to set up the printer to print a bill which is longer than an A4 paper via EPSON TM-U220B](https://gettingstarted.cukcuk.com/huong_dan_thiet_lap_de_in_duoc_hoa_don_co_do_dai_lon_hon_trang_giay_a4_tren_may_in_epson_tmu220b.htm) explains that "When printing a bill with EPSON TM-U220B, it only prints to the length of 297 mm (equivalent to an A4 paper). The cause may be that driver of EPSON TM-U220B does not support the length of more than 297mm".

As an example, when printing a larger report from the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) to the `Microsoft PDF Printer` with either `ContinuousPaper = True` or `Custom` Paper size, the printed document may be cut as this PDF printer supports a limited number of paper kinds and doesn't support custom paper size. Hence, it tries to print on its default paper size, which leads to the cut page content.

If you test printing the same report with [Foxit PDF](https://www.foxit.com/pdf-reader/) Printer, the report would most probably be printed as expected to a PDF file as this PDF printer supports custom paper.

In such scenarios you may continue troubleshooting on the hardware side rather than your reports. As a first step, you may try printing a large single-page document outside Telerik Reporting with the same printer to confirm that the problem is not related to the Reporting functionality or settings.

## Solution

You need to select from the Printer Settings a PaperKind with Paper Height that is sufficient to accommodate the printed single-page document.

For example, the physical label printer that we test on is "Epson-TM-T20II-M267D". It supports few 'Roll Paper' paper kinds with a length of 3276mm. When we select such paper kind, usually, the long reports with `ContinuousPaper = True` are printed as expected. However, selecting a shorter paper when printing the same report may cut it when report's height is more than the printer paper size.

If the printer doesn't support long paper, you need to set report's `ContinuousPaper` to `False` and print the document paginated, with `PaperKind` and `PaperSize` that are supported by the specific printer.
