---
title: RTF Device Information Settings
page_title: RTF Device Information Settings | for Telerik Reporting Documentation
description: RTF Device Information Settings
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/rtf-device-information-settings
tags: rtf,device,information,settings
published: True
position: 7
---

# RTF Device Information Settings



The following table lists the device information settings for rendering in RTF format.

## RTF Device Information Settings




| Name | Type | Description |
| ------ | ------ | ------ |
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|
|RenderingMode|String|Specifies whether to use __Tables__ or __Frames__ to render the rtf file.                 Available modes are: __Auto__ , __Tables__ and __Frames__ .                 The default mode is __Auto__ . If Table/List/Crosstab report items are used in the report, the mode                 automatically changes to Tables, if not it uses Frames. Setting it explicitly to different value than __Auto__ would force the RTF                 rendering extension to use the selected mode.|
|UseMetafile|Boolean|A flag specifying whether to render Graph, Map and Barcode items as  [Metafile (EMF)](http://msdn.microsoft.com/en-us/library/windows/desktop/ms536391(v=vs.85).aspx) or  [Bitmap](http://msdn.microsoft.com/en-us/library/windows/desktop/ms536393(v=vs.85).aspx) images. The default value is true|




For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).         

# See Also


 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
