---
title: Excel 2007 Device Information Settings
page_title: Excel 2007 Device Information Settings 
description: Excel 2007 Device Information Settings
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/excel-2007-device-information-settings
tags: excel,2007,device,information,settings
published: True
position: 4
---

# Excel 2007 Device Information Settings



The following table lists the device information settings for rendering in Excel 2007 (XLSX) format.

## Excel Device Information Settings


| Name | Type | Description |
| ------ | ------ | ------ |
|UseNativePageHeader|Boolean|Specifies whether to render the report’s page header in the native Excel page header                 section. When false (default value) the page header is rendered as a sequence of frozen rows at the top                 of the worksheet.|
|UseNativePageFooter|Boolean|Specifies whether to render the report’s page footer in the native Excel page footer section. When                 false, the footer is rendered as sequence of excel cells. Default value is true.|
|ShowGridlines|Boolean|Specifies whether Excel Gridlines are visible. Default value is false.|
|UseMetafile|Boolean|A flag specifying whether to render Graph, Map and Barcode items as  [Metafile (EMF)](http://msdn.microsoft.com/en-us/library/windows/desktop/ms536391(v=vs.85).aspx) or  [Bitmap](http://msdn.microsoft.com/en-us/library/windows/desktop/ms536393(v=vs.85).aspx) images. The default value is true.|
|UseExtendedFormatting|Boolean|Format strings used throughout the report will be hard-coded with "Custom Format" in Excel which includes the locale information of the server.                 This way the formatting from the report definition is preserved and does not depend on the client machine locale where the document is opened.                 The custom format information can be omitted by setting __UseExtendedFormatting = false__.                 Default value is true.|


For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).         


# See Also


 

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 

* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})

