---
title: HTML5 Device Information Settings
page_title: HTML5 Device Information Settings | for Telerik Reporting Documentation
description: HTML5 Device Information Settings
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/html5-device-information-settings
tags: html5,device,information,settings
published: True
position: 10
---

# HTML5 Device Information Settings



The following table lists the device information settings for rendering in HTML5 format.

## HTML5 Device Information Settings


|  __Name__  |  __Type__  |  __Description__  |
| ------ | ------ | ------ |
|UseSVG|Boolean|A flag specifying whether to render Map and Graph items as  [SVG](http://www.w3.org/Graphics/SVG/) or  [Bitmap](http://msdn.microsoft.com/en-us/library/windows/desktop/ms536393(v=vs.85).aspx) images. The default value is true.|
|ContentOnly|Boolean|A flag specifying whether the rendered document will be stripped down HTML without HTML, HEAD, Script and Body elements. 								All of the HTML content will be placed in a div element. The actions meta data and the page style will be served as resources. 								The default value is false.|
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render|




For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).         

# See Also


 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
