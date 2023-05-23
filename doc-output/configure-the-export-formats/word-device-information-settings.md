---
title: Word Device Information Settings
page_title: Word Device Information Settings at a glance
description: "Find detailed information about the different Word rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/word-device-information-settings
tags: word, docx, device, information, settings, options
published: True
position: 12
previous_url: /device-information-settings-word
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

# Device Information Settings for the Word rendering format

The following table lists the device information settings for rendering in Word (DOCX) format.

## Available Word Device Information Settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|
|UseMetafile|Boolean|A flag specifying whether to render Graph, Map and Barcode items as [Metafile (EMF)](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-metafiles-about) or [Bitmap](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-types-of-bitmaps-about) images. The default value is __true__.|

For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
