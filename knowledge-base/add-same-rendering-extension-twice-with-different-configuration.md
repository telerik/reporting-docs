---
title: Add the Same Export Extension Twice with Different Configuration
description: "Learn how to add the same extension twice for exporting with different configuration in Telerik Reporting."
type: how-to
page_title: Duplicating a rendering format with specific settings
slug: add-same-rendering-extension-twice-with-different-configuration
ticketid: 1569011
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

In some scenarios, you may need to add the same extension twice. For example, for XLSX once with a native header and once without.

## Suggested Workarounds

You may register the second extension with a different name, i.e. `XLSX1` as a custom extension, and set its `type` to the built-in type from our code that renders in the corresponding format, for example, XLSX. The following configuration generates two XLSX rendering types, one with `UseNativePageHeader` set to `true`, and the other to `false`:

````XML
<Telerik.Reporting>
	<extensions>
		<render>
			<extension name="XLSX" description="abc">
				<parameters>
					<parameter name="UseNativePageHeader" value="true" />
				</parameters>
			</extension>
			<extension name="XLSX1" type="Telerik.Reporting.OpenXmlRendering.Spreadsheet.SpreadsheetReport, Telerik.Reporting.OpenXmlRendering" description="xlsx1">
				<parameters>
					<parameter name="UseNativePageHeader" value="false" />
				</parameters>
			</extension>
		</render>
	</extensions>
</Telerik.Reporting>
````

Here is how you may register some alternative rendering extension with the built-in renderers in Telerik Reporting:

````XML
<extension name="XLSX1" type="Telerik.Reporting.OpenXmlRendering.Spreadsheet.SpreadsheetReport, Telerik.Reporting.OpenXmlRendering" description="xlsx1" />
<extension name="DOCX1" type="Telerik.Reporting.OpenXmlRendering.Wordprocessing.WordprocessingReport, Telerik.Reporting.OpenXmlRendering" description="docx1" />
<extension name="PPTX1" type="Telerik.Reporting.OpenXmlRendering.Presentation.PresentationReport, Telerik.Reporting.OpenXmlRendering" description="pptx1" />
<extension name="XLS1" type="Telerik.Reporting.ExcelRendering.Excel97.ExcelReport, Telerik.Reporting" description="xls1" />
<extension name="CSV1" type="Telerik.Reporting.CsvRendering.CsvRenderingExtension, Telerik.Reporting" description="csv1" />
<extension name="PDF1" type="Telerik.Reporting.ImageRendering.PdfReport, Telerik.Reporting" description="pdf1" />
````

## See Also

* [How to Create Custom Rendering Extension]({%slug custom-rendering-extension%})
