---
title: Characters do not appear correctly in PDF files
description: Characters are not displayed correctly in PDF files.
type: troubleshooting
page_title: Characters are not rendered correctly in PDF files
slug: characters-not-appearing-correctly-in-pdf-files
res_type: kb
---

## Environment

<table>
	<tbody>
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

The Telerik Reporting rendering mechanisms use native objects for the selected media.

To produce a PDF that visualizes content correctly via Telerik Reporting, the report must be designed with **TrueType font** that is available on the machine where reports are processed and rendered. Reports are processed and rendered server-side.

## Possible Causes

* The used font is not TrueType.
* The used font does not support the characters you need to display.
* The used font is not available on the server and/or the client machines.
* The font author has restricted font embedding _(see [Fonts Requirements]({%slug telerikreporting/designing-reports/rendering-and-paging/fonts-requirements%}))_.

## Solution

* If the text contains special characters like **custom glyphs, icons**, you need to check if the font supports them. You may need to switch to a font with **Unicode characters support** e.g. Arial Unicode MS.
* If the **font cannot be installed on the server machine**, where reports are processed and rendered, you can use [Telerik Reporting privateFonts settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%}). The settings are applicable only through the configuration file of the application. You will need to declare a [Telerik.Reporting section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) first.
* If the **font is not available on the client machine**, you can fully embed the fonts in the PDF file during its generation _(will not work if font embedding is restricted)_. You will need to declare a [Telerik.Reporting section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) first. Then you need to configure the PDF extension and the `FontEmbedding` parameter of its [Device Information settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}):

	````HTML
<Telerik.Reporting>
		<extensions>
		<render>
			<extension name="PDF" >
			<parameters>
				<parameter name="FontEmbedding" value="Full"/>
			</parameters>
			</extension>
		</render>
		</extensions>
	</Telerik.Reporting>
````
	````JSON
"telerikReporting": {
		"extensions": [
		{
			"name": "PDF",
			"description":  "PDF Description",
			"parameters": [
			{
				"Name": "FontEmbedding",
				"Value": "Full"
			}
			]
		}
		]
	}
````


## Notes

The settings can be edited in code if you export programmatically - [Set rendering parameters programmatically]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}#set-rendering-parameters-programmatically).

## See Also

* [PDF Rendering Design Considerations]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations%})
* [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%})
