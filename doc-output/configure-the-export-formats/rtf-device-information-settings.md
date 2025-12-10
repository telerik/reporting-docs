---
title: RTF Device Information Settings
page_title: RTF Device Information Settings at a glance
description: "Find detailed information about the different RTF rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/rtf-device-information-settings
tags: rtf, device, information, settings, options
published: True
position: 7
previous_url: /device-information-settings-rtf
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

# Device Information Settings for the RTF rendering format

The following table lists the device information settings for rendering in RTF format.

## Available RTF Device Information Settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|
|RenderingMode|String|Specifies whether to use __Tables__ or __Frames__ to render the rtf file. Available modes are:<ul><li>__Auto__</li><li>__Tables__</li><li>__Frames__</li></ul>The default mode is __Auto__. If Table/List/Crosstab report items are used in the report, the mode automatically changes to Tables, if not it uses Frames. Setting it explicitly to different value than __Auto__ would force the RTF rendering extension to use the selected mode.|
|UseMetafile|Boolean|A flag specifying whether to render Graph, Map and Barcode items as [Metafile (EMF)](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-metafiles-about) or [Bitmap](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-types-of-bitmaps-about) images. The default value is __true__.|

For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
