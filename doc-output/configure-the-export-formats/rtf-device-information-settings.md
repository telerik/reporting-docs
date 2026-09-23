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

# Device Information Settings for the RTF rendering format

The following table lists the device information settings for rendering in RTF format.

## Available RTF Device Information Settings

> The names of the properties in Device Information Settings are **Case-Sensitive**.

| **Name**      | **Type** | **Group** | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------- | -------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| StartPage     | Integer  | Paging    | The first page of the report to render. A value of **0** indicates that all pages are rendered.                                                                                                                                                                                                                                                                                                                                                   |
| EndPage       | Integer  | Paging    | The last page of the report to render.                                                                                                                                                                                                                                                                                                                                                                                                            |
| RenderingMode | String   | Layout    | Specifies whether to use **Tables** or **Frames** to render the rtf file. Available modes are:<ul><li>**Auto**</li><li>**Tables**</li><li>**Frames**</li></ul>The default mode is **Auto**. If Table/List/Crosstab report items are used in the report, the mode automatically changes to Tables, if not it uses Frames. Setting it explicitly to different value than **Auto** would force the RTF rendering extension to use the selected mode. |
| UseMetafile   | Boolean  | Graphics  | A flag specifying whether to render Graph, Map and Barcode items as [Metafile (EMF)](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-metafiles-about) or [Bitmap](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-types-of-bitmaps-about) images. The default value is **true**.                                                                                                                                |

For an example of how to set up the settings for a rendering extension, see [extensions Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element).

## See Also

- [Device Information Settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview)
- [Export Formats](slug:telerikreporting/using-reports-in-applications/export-and-configure/export-formats)
