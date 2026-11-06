---
title: Print Reports Silently
description: "Learn how to print Telerik reports without a report viewer, printer-selection dialog, or print-progress UI."
type: how-to
page_title: Silent Report Printing in C#
slug: print-reports-silently-and-save-pdf
tags: printing, silent, trdp
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.2.26.1007 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Print a Telerik report without displaying a report viewer, printer-selection dialog, or print-progress UI.

## Solution

For unattended direct printing, supply valid `PrinterSettings` and set `ReportProcessor.PrintController` to `StandardPrintController`. Invalid printer settings can cause `PrintReport` to display a printer-selection dialog. Leaving the print controller unset uses the default controller, which displays print-progress UI.

The following helper prints a report directly without these dialogs. Pass a configured `ReportSource`, the name of a printer available to the application, and the required number of copies. The code uses `System.Drawing.Printing`. Verify that the application's execution environment supports this printing stack and the selected printer driver.

```C#
using System;
using System.Drawing.Printing;
using Telerik.Reporting;
using Telerik.Reporting.Processing;

public static class ReportOutput
{
	public static void PrintSilently(
		ReportSource reportSource,
		string printerName,
		short copies = 1)
	{
		if (reportSource == null)
		{
			throw new ArgumentNullException(nameof(reportSource));
		}

		if (copies < 1)
		{
			throw new ArgumentOutOfRangeException(nameof(copies));
		}

		var printerSettings = new PrinterSettings
		{
			PrinterName = printerName,
			Copies = copies
		};

		if (!printerSettings.IsValid)
		{
			throw new InvalidOperationException("The selected printer is not available.");
		}

		var processor = new ReportProcessor
		{
			PrintController = new StandardPrintController()
		};

		processor.PrintReport(reportSource, printerSettings);
	}
}
```

To print a TRDP file, create a `UriReportSource` and pass it to the helper. Set `Uri` to a report file accessible to the application. The example uses `Barcodes Report.trdp`. Provide an absolute path when needed, and replace the printer name with the name of your installed printer.

```C#
var reportSource = new UriReportSource
{
	Uri = @"Barcodes Report.trdp"
};

ReportOutput.PrintSilently(
	reportSource,
	printerName: "Your installed printer name",
	copies: 1);
```

The helper validates the selected printer and uses `StandardPrintController`. Set any parameters defined in the report on `reportSource.Parameters` before calling it.

> note For unattended printing, select a printer that does not require interactive input. The helper does not handle printer-driver prompts.

In a server-client application, the print operation runs on the machine executing this code, not on the browser client's machine. The [client-side printing approach](slug:print-a-report-directly-at-client-side-without-displaying-it-in-a-viewer) displays a print dialog and is not a silent-printing alternative.

## See Also

* [Print a Report Programmatically](slug:print-a-report-programmatically)
* [Embedded Report Engine](slug:telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine)