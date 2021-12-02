---
title: WPFXAML/WPFXAMLInteractive Device Information Settings
page_title: WPFXAML/WPFXAMLInteractive Device Information Settings | for Telerik Reporting Documentation
description: WPFXAML/WPFXAMLInteractive Device Information Settings
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/wpfxaml-wpfxamlinteractive-device-information-settings
tags: wpfxaml/wpfxamlinteractive,device,information,settings
published: True
position: 14
---

# WPFXAML/WPFXAMLInteractive Device Information Settings



The following table lists the device information settings for rendering in WPFXAML and WPFXAMLInteractive format.

This rendering extension is used by the WPF Report Viewer and by default is not visible in viewer's available rendering extensions list.

## WPFXAML/WPFXAMLInteractive Device Information Settings


|  __Name__  |  __Type__  |  __Description__  |
| ------ | ------ | ------ |
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|
|BitmapScalingMode|string|Specifies the algorithm used to scale bitmap images. The value must be a  [BitmapScalingMode](https://msdn.microsoft.com/en-us/library/system.windows.media.bitmapscalingmode(v=vs.110).aspx) enumeration member. By default it is set to __Unspecified__ , which results in better performance, but produces a low quality scaling|




For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).         

# See Also


 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
