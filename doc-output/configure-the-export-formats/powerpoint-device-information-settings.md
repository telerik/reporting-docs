---
title: PowerPoint Device Information Settings
page_title: PowerPoint Device Information Settings at a glance
description: "Find detailed information about the different PowerPoint rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/powerpoint-device-information-settings
tags: powerpoint, pptx, device, information, settings, options
published: True
position: 13
previous_url: /device-information-settings-powerpoint
reportingArea: General
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

# Device Information Settings for the PowerPoint rendering format

The following table lists the device information settings for rendering in PowerPoint (PPTX) format.

## Available PowerPoint Device Information Settings

> The names of the properties in Device Information Settings are **Case-Sensitive**.

| **Name**              | **Type** | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                       |
| --------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| StartPage             | Integer  | The first page of the report to render. A value of **0** indicates that all pages are rendered.                                                                                                                                                                                                                                                                                                                                       |
| EndPage               | Integer  | The last page of the report to render.                                                                                                                                                                                                                                                                                                                                                                                                |
| UseMetafile           | Boolean  | A flag specifying whether to render Graph, Map and Barcode items as [Metafile (EMF)](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-metafiles-about) or [Bitmap](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-types-of-bitmaps-about) images. The default value is **true**.                                                                                                                    |
| UseSvgImages          | Boolean  | A flag specifying whether the Skia graphics engine embeds SVG images for Graph, Gauge, Barcode, Shape, and Cross-Section report items using the Office 2019 SVGBlip extension. When enabled, the exported items use resolution-independent vector graphics. When disabled, the Skia engine inserts raster images instead. This setting does not affect the GDI graphics engine, which uses EMF images. The default value is **true**. |
| IncludeRasterFallback | Boolean  | When `UseSvgImages` is enabled, specifies whether to include a raster fallback image alongside the embedded SVG. The fallback ensures compatibility with Office versions older than 2019 that do not support the SVGBlip extension. The default value is **false**.                                                                                                                                                                   |

For an example of how to set up the settings for a rendering extension, see [extensions Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element).

## See Also

- [Device Information Settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview)
- [Export Formats](slug:telerikreporting/using-reports-in-applications/export-and-configure/export-formats)
