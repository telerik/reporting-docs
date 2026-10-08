---
title: HTML5Interactive Device Information Settings
page_title: HTML5Interactive Device Information Settings at a glance
description: "Find detailed information about the different HTML5Interactive rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/html5interactive-device-information-settings
tags: html5interactive, device, information, settings, options
published: True
position: 11
previous_url: /device-information-settings-html5-interactive
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

# Device Information Settings for the HTML5Interactive rendering format

The following table lists the device information settings for rendering in HTML5Interactive format.

## Available HTML5Interactive Device Information Settings

> The names of the properties in Device Information Settings are **Case-Sensitive**.

| **Name**    | **Type** | **Group** | **Description**                                                                                                                                                                                                                                                                         |
| ----------- | -------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| UseSVG      | Boolean  | Graphics  | A flag specifying whether to render Graph item as SVG or Bitmap image. The default value is **true**.                                                                                                                                                                                   |
| ContentOnly | Boolean  | Output    | A flag specifying whether the rendered document will be stripped down HTML without HTML, HEAD, Script and Body elements. All of the HTML content will be placed in a div element. The actions meta data and the page style will be served as resources. The default value is **false**. |

For an example of how to set up the settings for a rendering extension, see [extensions Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element).

## See Also

- [Device Information Settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview)
- [Export Formats](slug:telerikreporting/using-reports-in-applications/export-and-configure/export-formats)
