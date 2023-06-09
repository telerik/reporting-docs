---
title: Image Device Information Settings
page_title: Image Device Information Settings at a glance
description: "Find detailed information about the different Image rendering settings available, and understand their XML-based and JSON-based configuration file formats."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/image-device-information-settings
tags: image, device, information, settings, options
published: True
position: 1
previous_url: /device-information-settings-image
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 75%;
}
</style>

# Device Information Settings for the Image Rendering Formats

The following table lists the device information settings for rendering in __IMAGE__, __IMAGEPrintPreview__ and __IMAGEPrint__ formats.

## Available Image Device Information settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|OutputFormat|String|Defines the output format of the produced image. Supported formats are: __BMP__, __EMF__, __EMFPLUS__, __GIF__, __JPEG__, __PNG__, or __TIFF__. The default value for __IMAGE__ rendering extension is __TIFF__. The default value for __IMAGEPrint__ and __IMAGEPrintPreview__ rendering extensions is __EMF__.|
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|
|DpiX|Integer|The resolution of the output image in x-direction. The default value is __96__.|
|DpiY|Integer|The resolution of the output image in y-direction. The default value is __96__.|
|TiffCompression|String|Specifies the compression scheme of the output TIFF file. Respected only when __OutputFormat__ is set to __TIFF__. Supported compression kinds are: __LZW__, __CCITT3__, __CCITT4__, __RLE__, or __NONE__. The default value is __LZW__.|
|TextRenderingHint|string|Sets the rendering mode for text using a [TextRenderingHint](https://msdn.microsoft.com/en-us/library/ssazt6bs(v=vs.110).aspx) enumeration member. The default value depends on the machine settings - if it has [ClearType](https://learn.microsoft.com/en-us/typography/cleartype/) enabled, then __ClearTypeGridFit__ will be used. Otherwise the rendering algorithm will use __AntiAliasGridFit__ hinting. If text rendering hinting is not supported, the __SystemDefault__ value will be used.|

For a detailed example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}). 

## Example

The following example demonstrates how to configure the settings for __IMAGE__, __IMAGEPrintPreview__ and __IMAGEPrint__ formats.

XML-based configuration file:

````XML
<configuration>
…
	<Telerik.Reporting>
		<extensions>
			<render>
				<extension name="IMAGE">
					<parameters>
						<parameter name="OutputFormat" value="TIFF"/>
						<parameter name="TiffCompression" value="RLE"/>
					</parameters>
				</extension>
				<extension name="IMAGEPrintPreview">
					<parameters>
						<parameter name="OutputFormat" value="JPEG"/>
					</parameters>
				</extension>
				<extension name="IMAGEPrint">
					<parameters>
						<parameter name="OutputFormat" value="PNG"/>
						<parameter name="TextRenderingHint" value="AntiAliasGridFit"/>
						<parameter name="DpiX" value="1200"/>
						<parameter name="DpiY" value="1200"/>
					</parameters>
				</extension>
			</render>
		</extensions>
	</Telerik.Reporting>
…
</configuration>
````

JSON-based configuration file:

````JSON
"telerikReporting": {
	"extensions": [
	{
		"name": "IMAGE",
		"parameters": [
		{
			"Name": "OutputFormat",
			"Value": "TIFF"
		},
		{
			"Name": "TiffCompression",
			"Value": "RLE"
		}
	]
	},
	{
		"name": "IMAGEPrintPreview",
		"parameters": [
		{
			"Name": "OutputFormat",
			"Value": "JOEG"
		}
	]
	},
	{
		"name": "IMAGEPrint",
		"parameters": [
		{
			"Name": "OutputFormat",
			"Value": "PNG"
		},
		{
			"Name": "TextRenderingHint",
			"Value": "AntiAliasGridFit"
		},
		{
			"Name": "DpiX",
			"Value": "1200"
		},
		{
			"Name": "DpiY",
			"Value": "1200"
		},
	]
	}
	]
}
````

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
