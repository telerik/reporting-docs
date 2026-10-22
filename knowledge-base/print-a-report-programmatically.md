---
title: Print a Report Programmatically
description: "Learn how to print a Report programmatically with specific printer settings from Telerik Reporting Report Viewers."
type: how-to
page_title: Print a Report without displaying it in a report viewer
slug: print-a-report-programmatically
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>All</td>
	</tr>
</table>

## Description

The ability to print a report is widely used feature that a Reporting product cannot go without. The ReportViewers we provide for viewing the reports, come with a **Print** button that takes care of this automatically. However, in case one might want to be in control over the printing - use the exposed methods.

## Solution

### HTML5 Report Viewers

For the HTML5-based report viewers, you could use the `print` [command](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands#print). For example:

````JavaScript
$('#printButton').click(function () {
	var rv = $("#reportViewer1").data("telerik_ReportViewer");
	rv.commands.print.exec();
});
````

The example above selects an HTML element with the `printButton` id using jQuery and in the click event handler invokes report viewer `print` command. Note that the `exec()` method of the command needs to be called.

### Desktop Report Viewers (WinForms/WPF)

Both Report Viewers come up with out-of-the-box methods for printing the report through code.

* WinForms Report Viewer - [ReportViewerBase.PrintReport Method](/api/telerik.reportviewer.winforms.reportviewerbase#collapsible-Telerik_ReportViewer_WinForms_ReportViewerBase_PrintReport)
* WPF Report Viewer - [ReportViewer.PrintReport Method](/api/telerik.reportviewer.wpf.reportviewer#collapsible-Telerik_ReportViewer_Wpf_ReportViewer_PrintReport)

Alternatively, the [ReportProcessor.PrintReport()](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_PrintReport_Telerik_Reporting_ReportSource_System_Drawing_Printing_PrinterSettings_) method could also be used. It accepts two parameters  - a [ReportSource](/api/telerik.reporting.reportsource) and the [PrinterSettings](https://docs.microsoft.com/en-us/dotnet/api/system.drawing.printing.printersettings?view=net-5.0) that should be used.

For example, here is how to print the Barcodes Report from the `ReportLibrary` class library project that can be found in the installation folder of the product - `{installation folder}\Examples\CSharp\.NET Framework\ReportLibrary`.

```C#
ReportProcessor reportProcessor = new ReportProcessor();
reportProcessor.PrintReport(new TypeReportSource() { TypeName = typeof(BarcodesReport).AssemblyQualifiedName }, new PrinterSettings());
```

#### Fit a Wider Report to Narrower Paper

The `ReportProcessor.PrintReport` overloads do not expose a fit-to-page argument. Reducing `PageSettings.PaperSize.Width` changes the pagination width. It does not proportionally shrink the report content. For example, changing the paper width from 120 mm to 80 mm does not automatically scale the report items to fit. Content that exceeds the available width can continue onto additional horizontal pages.

When adjusting the report layout, account for the available content width after margins, not only the nominal paper width. See [Understanding Pagination](slug:telerikreporting/designing-reports/rendering-and-paging/understanding-pagination) for details about physical pages, margins, and horizontal paging.

The example in [Modify Report Physical Width Proportionally](slug:programmatically-modify-report-physical-width-proportionally) adjusts the report width, paper width, report item widths, and horizontal positions. It does not scale item heights, vertical positions, or font sizes. Treat it as a horizontal layout adjustment, not uniform scaling that preserves the aspect ratio of the entire report.

For scaling by a PDF reader, see [Produce PDF Files Fitting the Physical Page on Printing](slug:how-to-produce-pdf-files-fitting-the-physical-page-on-printing). That approach delegates scaling to the reader, outside the reporting engine. Its example displays a print dialog and does not provide a silent replacement for direct `ReportProcessor.PrintReport` printing.

#### Printing Without Dialogs

Pass valid `PrinterSettings` when calling `ReportProcessor.PrintReport` to avoid a printer-selection dialog. Invalid printer settings can cause the method to request printer selection before printing begins.

The `ReportProcessor.PrintController` property controls the print controller, including print-progress UI. Changing the print controller does not bypass printer validation. Handle invalid printer settings before calling `PrintReport` when the application must not display a printer-selection dialog.

### Legacy ASP.NET WebForms Report Viewer

To print a report through the [Legacy ASP.NET ReportViewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview), you need to use the built-in print functionality. It depends on the **Adobe Acrobat Reader PDF plugin** (you need it installed to take advantage of true print and not the browsers' printing capabilities) and you have the option to select a printer from a list.

On the client side, you can invoke the print through the ReportViewer client object's `PrintReport()` method:

````HTML
<form id="form1" runat="server">
	<telerik:ReportViewer runat="server" id="ReportViewer1"></telerik:ReportViewer>
	<script type="text/javascript">
		<%=ReportViewer1.ClientID %>.PrintReport();
	</script>
</form> 
````

## See Also

* [HTML5 Report Viewer - Printing Reports](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports)
* [Embedded Report Engine](slug:telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine)
* [Print a report directly at client-side without displaying it in a Viewer](slug:print-a-report-directly-at-client-side-without-displaying-it-in-a-viewer)
