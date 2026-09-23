---
title: WPFXAML/WPFXAMLInteractive Device Information Settings
page_title: WPFXAML/WPFXAMLInteractive Device Information Settings at a glance
description: "Find detailed information about the different WPFXAML/WPFXAMLInteractive rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/wpfxaml-wpfxamlinteractive-device-information-settings
tags: wpfxaml/wpfxamlinteractive, device, information, settings, options
published: True
position: 14
previous_url: /device-information-settings-wpfxamlinteractive
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

# Device Information Settings for the WPFXAML/WPFXAMLInteractive rendering format

The following table lists the device information settings for rendering in WPFXAML and WPFXAMLInteractive format.

This rendering extension is used by the WPF Report Viewer and by default is not visible in viewer's available rendering extensions list.

## Available WPFXAML/WPFXAMLInteractive Device Information Settings

> The names of the properties in Device Information Settings are **Case-Sensitive**.

| **Name**              | **Type** | **Group**     | **Description**                                                                                                                                                                                                                                                                                                                                 |
| --------------------- | -------- | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| StartPage             | Integer  | Paging        | The first page of the report to render. A value of **0** indicates that all pages are rendered.                                                                                                                                                                                                                                                 |
| EndPage               | Integer  | Paging        | The last page of the report to render.                                                                                                                                                                                                                                                                                                          |
| BitmapScalingMode     | string   | Image Quality | Specifies the algorithm used to scale bitmap images. The value must be a [BitmapScalingMode](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.bitmapscalingmode?view=windowsdesktop-7.0) enumeration member. By default it is set to **Unspecified**, which results in better performance, but produces a low quality scaling. |
| ValidateXmlCharacters | boolean  | Compatibility | Specifies whether Unicode characters that are not XML compliant, should be allowed in the report.                                                                                                                                                                                                                                               |

For an example of how to set up the settings for a rendering extension, see [extensions Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element).

## See Also

- [Device Information Settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview)
- [Export Formats](slug:telerikreporting/using-reports-in-applications/export-and-configure/export-formats)
