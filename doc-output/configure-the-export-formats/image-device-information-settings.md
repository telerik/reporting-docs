---
title: Image Device Information Settings
page_title: Image Device Information Settings at a glance
description: "Find detailed information about the different Image rendering settings available, and understand their XML-based and JSON-based configuration file formats."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/image-device-information-settings
tags: image, device, information, settings, options
published: True
position: 1
previous_url: /device-information-settings-image
reportingArea: General
components: [general]
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 15%;
}
table th:nth-of-type(4) {
	width: 60%;
}
</style>

# Device Information Settings for the Image Rendering Formats

The following table lists the device information settings for rendering in **IMAGE**, **IMAGEPrintPreview**, and **IMAGEPrint** formats.

## Available Image Device Information settings

> The names of the properties in Device Information Settings are **Case-Sensitive**.

| **Name**          | **Type** | **Group**     | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ----------------- | -------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| OutputFormat      | String   | Output        | Defines the output format of the produced image. Supported formats are: **BMP**, **EMF**, **EMFPLUS**, **GIF**, **JPEG**, **PNG**, or **TIFF**. The default value for **IMAGE** rendering extension is **TIFF**. The default value for **IMAGEPrint** and **IMAGEPrintPreview** rendering extensions is **EMF**. If you provide an invalid 'OutputFormat', for example, 'PDF', the extension will fall back to **BMP**.                                                                                                                           |
| StartPage         | Integer  | Paging        | The first page of the report to render. A value of **0** indicates that all pages are rendered.                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| EndPage           | Integer  | Paging        | The last page of the report to render.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| DpiX              | Integer  | Image Quality | The resolution of the output image in the x-direction. The default value is **96**.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| DpiY              | Integer  | Image Quality | The resolution of the output image in the y-direction. The default value is **96**.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| TiffCompression   | String   | Image Quality | Specifies the compression scheme of the output TIFF file. Respected only when **OutputFormat** is set to **TIFF**. Supported compression kinds are: **LZW**, **CCITT3**, **CCITT4**, **RLE**, or **NONE**. The default value is **LZW**.                                                                                                                                                                                                                                                                                                          |
| TextRenderingHint | string   | Image Quality | Sets the rendering mode for text using a [TextRenderingHint](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.text.textrenderinghint?view=dotnet-plat-ext-7.0) enumeration member. The default value depends on the machine settings - if it has [ClearType](https://learn.microsoft.com/en-us/typography/cleartype/) enabled, then **ClearTypeGridFit** will be used. Otherwise, the rendering algorithm will use **AntiAliasGridFit** hinting. If text rendering hinting is not supported, the **SystemDefault** value will be used. |

For a detailed example of how to set up the settings for a rendering extension, see [extensions Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element).

## Example

The following example demonstrates how to configure the settings for **IMAGE**, **IMAGEPrintPreview**, and **IMAGEPrint** formats.

{{source=CodeSnippets\MvcCS\XmlConfiguration\ImageDeviceInfoConfiguration.xml region=ImageDeviceInfoConfiguration}}
{{source=CodeSnippets\Blazor\Docs\JSON\ImageDeviceInfoConfig.json region=ImageDeviceInformation}}

## See Also

- [Device Information Settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview)
- [Export Formats](slug:telerikreporting/using-reports-in-applications/export-and-configure/export-formats)
