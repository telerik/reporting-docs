---
title: HTML5 Device Information Settings
page_title: HTML5 Device Information Settings at a glance
description: "Find detailed information about the different HTML5 rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/html5-device-information-settings
tags: html5, device, information, settings, options
published: True
position: 10
previous_url: /device-information-settings-html
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

# Device Information Settings for the HTML5 rendering format

The following table lists the device information settings for rendering in HTML5 format.

## Available HTML5 Device Information Settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|UseSVG|Boolean|A flag specifying whether to render Map and Graph items as [SVG](https://www.w3.org/Graphics/SVG) or [Bitmap](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-types-of-bitmaps-about) images. The default value is __true__.|
|ContentOnly|Boolean|A flag specifying whether the rendered document will be stripped down HTML without HTML, HEAD, Script and Body elements. All of the HTML content will be placed in a div element. The actions meta data and the page style will be served as resources. The default value is __false__.|
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|

For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
