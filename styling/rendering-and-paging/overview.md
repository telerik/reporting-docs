---
title: Overview
page_title: Rendering and Paging at a glance
description: "Learn more about the available rendering extensions (renderers) that allow you to export your reports to different formats. Understand how the different renderers behave and how pagination is handled."
slug: telerikreporting/designing-reports/rendering-and-paging/overview
tags: rendering, extensions, renderers, paging
published: True
position: 0
previous_url: /designing-reports-page-layout-rendering, /styling/rendering-and-paging/, /styling/
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# Rendering and Paging

Telerik Reporting includes a set of rendering extensions (also referred to as renderers) for exporting reports to different formats. Each renderer applies a set of rules when rendering reports. When exporting a report to file formats such as PDF which uses pagination based on physical page size, you might need to alter the layout of the report, so the exported report looks and prints correctly after the rules for the specific rendering extension are applied.

Getting satisfactory results for exported reports is often a continuous and repetitive process; you create and preview the report in Report Designer, export the report to the preferred format, review the exported report, and then make changes to the report back in the Report Designer.

## Rendering extensions

Telerik Reporting includes a set of renderers that you can use to export reports to different formats. By default Telerik Reporting outputs reports in the following formats: Image, PDF, HTML5, MHTML, Excel 97-2003, XLSX, PPTX, DOCX, RTF, XAML, and CSV.


| Extension Name | Description |
| ------ | ------ |
|PDF|Renders a report in the Adobe Acrobat Reader. The format is shown as an Acrobat (PDF) File in the Export drop-down of the Report Viewers toolbar.|
|XLS|Renders a report in Microsoft Excel. The report opens in Microsoft Excel 97 or later.|
|CSV|The Comma-Separated Value (CSV) rendering extension renders reports as a flattened representation of data from a report in a standardized, plain-text format that is easily readable and exchangeable with many applications. The report opens in a viewing tool associated with CSV file formats.|
|RTF|Renders a report in Rich Text Format. The report opens in Microsoft Word 97 or later.|
|XPS|Renders a report in XML Paper Specification (XPS) format - electronic representation of digital documents based on XML. The report opens in Microsoft XPS Viewer.|
|DOCX|Renders a report in Microsoft Word 2007 format (also known as OpenXML) - it is a zipped, XML-based file format developed by Microsoft for representing word processing documents.|
|XLSX|Renders a report in Microsoft Excel 2007 format (also known as OpenXML) - it is a zipped, XML-based file format developed by Microsoft for representing spreadsheets.|
|PPTX|Renders a report in Microsoft PowerPoint 2007 format (also known as OpenXML) - it is a zipped, XML-based file format developed by Microsoft for presentations.|
|MHTML|Renders a report in MHTML. The report opens in Internet Explorer. The format is shown as Web Archive in the Export drop-down of the Report Viewers toolbar.|
|IMAGE|Renders a report in image format with [physical page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). The format is shown as TIFF in the Export drop-down of the Report Viewers toolbar.|
|IMAGEInteractive|Renders a report in image format with [interactive page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).|
|HTML5|Renders a report in XHTML 1.1 compliant HTML with [physical page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). (This is a multi-stream rendering extension and should be only used with [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__))|
|HTML5Interactive|Renders a report in XHTML 1.1 compliant HTML with [interactive page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). (This is a multi-stream rendering extension and should be only used with [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__))|
|XAML|Renders a report in XAML for Silverlight with [physical page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). (This is a multi-stream rendering extension and should be only used with [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__))|
|XAMLInteractive|Renders a report in XAML for Silverlight with [interactive page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). (This is a multi-stream rendering extension and should be only used with [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__))|
|WPFXAML|Renders a report in XAML for WPF with [physical page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). (This is a multi-stream rendering extension and should be only used with [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__))|
|WPFXAMLInteractive|Renders a report in XAML for WPF with [interactive page layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). (This is a multi-stream rendering extension and should be only used with [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__)) |

All __Telerik Reporting__ output formats have specific characteristics that determine their usage and impose certain limitations, which need to be taken into consideration when designing reports. For example, the CSV rendering extension is useful for creating reports that can be used as a data source by another application or process, layout rendering extensions produce reports in a format suitable for viewing by users, while physical rendering extensions are intended for precise printing.

For more information on the rendering extensions, refer to [Design Considerations for Report Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview%})

## Rendering Behaviors

There are three types of renderers:

* __Data__ renderers: CSV renderer.
* __Logical__ page layout renderers: Excel (XLS and XLSX) and MHTML renderers. Rendering extensions IMAGEInteractive, HTML5Interactive, XAMLInteractive, and WPFXAMLInteractive are for internal use by the Report Viewers in Interactive View.
* __Physical__ page layout renderers: IMAGE, HTML5, XAML, WPFXAML, PDF, RTF, XPS, PPTX, DOCX renderers. Rendering extensions IMAGE, HTML5, XAML, and WPFXAML are used by corresponding Report Viewers in Print Preview.

Depending on the renderer you select, certain rules are applied when rendering the report. How report items fit together on a page is determined by the combination of these factors:

* Rendering rules.
* The width and height of report items.
* The size of the report.
* The width and height of the page.
* Renderer-specific support for paging.

For example, reports rendered with IMAGEInteractive and HTML5Interactive formats are optimized for a computer screen-based experience where pages can be of various lengths. For more information, see [Understanding Rendering Behaviors]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors%}).

## Pagination

Pagination refers to the number of pages within a report and how report items are arranged on these pages. Pagination varies depending on the used renderer, page break, and keep-together options you configure the report to use.

A successfully designed report that is optimized for the renderer that you plan to use to deliver your report, requires understanding of the rules used to control pagination. Reports exported by using the data and logical rendering extensions are typically not affected by pagination. When you use a logical rendering extension such as the HTML rendering extension, you might want to know how the report looks printed and also how well it renders using a physical page renderer such as PDF. You can use the Preview in the Report Designer and export the report to easily get an idea of how the report looks in the different layouts.

The physical page renderers impact the report layout and physical page size the most. To learn more, see [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%}).

## See Also

* [Understanding Rendering Behaviors]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors%})
* [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%})
