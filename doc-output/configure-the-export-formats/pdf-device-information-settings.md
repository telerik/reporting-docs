---
title: PDF Device Information Settings
page_title: PDF Device Information Settings at a glance
description: "Find detailed information about the different PDF rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings
tags: pdf, device, information, settings, options
published: True
position: 3
previous_url: /device-information-settings-pdf
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 70%;
}
</style>

# Device Information Settings for the PDF rendering format

The following table lists the device information settings for rendering in PDF format.

## Available PDF Device Information Settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|ComplianceLevel|String|The PDF/A compliance level. The supported values are:<ul><li>__None__</li><li>__PDF/A-1b__</li><li>__PDF/A-2b__</li><li>__PDF/A-3b__</li></ul>Default value: __None__. If EnableAccessibility is set to True, due to incompatibility the ComplianceLevel metadata is ignored.|
|EnableAccessibility|Boolean|Determines if the PDF will be generated in accordance to [PDF/UA (ISO standard 14289-1)](https://en.wikipedia.org/wiki/PDF/UA) specification.|
|SignCertFilename|String|The name of a certificate file. Absolute and relative paths are supported.<br/>You need to reference a '.pfx' file. The reason is that it includes both the public and private key that are required for the associated certificate. A '.cer' file embeds only the public key.|
|SignCertPassword|String|The password required to access the X.509 certificate data.|
|SignLocation|String|(Optional) The CPU host name or physical location of the signing.|
|SignReason|String|(Optional) The reason for the signing, such as (I agree …).|
|SignContactInfo|String|(Optional) Information provided by the signer to enable a recipient to contact the signer to verify the signature; for example, a phone number.|
|OwnerPassword|String|If specified the document will be encrypted and owner or user password will be required to open the document.|
|UserPassword|String|If owner password is specified the document will be encrypted and password will be required to open the document. User password gives read only permissions.|
|FontEmbedding|String|Specifies if the fonts used in the report should be embedded in the output PDF document. Valid values are:<ul><li>__Full__</li><li>__Subset__</li><li>__None__</li></ul>Specifying the __Subset__ option will embed only font glyphs that are used, thus reducing output file size while maintaining portability. Default value: __Subset__.|
|JavaScript|String|A JavaScript to be compiled and executed by the JavaScript interpreter. Netscape Communications Corporation’s Client-Side JavaScript Reference and the Adobe JavaScript for Acrobat API Reference give details on the contents and effects of JavaScript scripts.|
|StartPage|Integer|The first page of the report to render. A value of __0__ indicates that all pages are rendered.|
|EndPage|Integer|The last page of the report to render.|
|DocumentTitle|String|The document’s title.|
|DocumentAuthor|String|The name of the person who created the document.|
|DocumentProducer|String|The document producer. The default value is Telerik Reporting product name and version.|
|DocumentCreator|String|The document creator. The default value is Telerik Reporting product name and version.|
|DocumentSubject|String|The subject of the document.|
|DocumentKeywords|String|Keywords associated with the document.|
|DocumentNaturalLanguage|String|A language identifier in accordance to [RFC 1766](https://www.ietf.org/rfc/rfc1766.txt) that specifies the natural language for all text in the document. If absent, the language will be retrieved from report's culture. Example value: __en-US__.|
|UseSvgVectorRendering|Boolean|Determines if the SVG images will be rendered using vector-based or raster-based graphic primitives. The vector-based rendering preserves the image quality regardless the current zoom, but does not support all SVG elements. The raster-based rendering can be used with every SVG image but produces a bitmap which does not preserve its quality when zooming in/out in the PDF document. Default value: __true__.|
|ViewerHideToolbar|Boolean|A flag specifying whether to hide the viewer application’s tool bars when the document is active. Default value: __false__.|
|ViewerHideMenubar|Boolean|A flag specifying whether to hide the viewer application’s menu bar when the document is active. Default value: __false__.|
|ViewerHideWindowUI|Boolean|A flag specifying whether to hide user interface elements in the document’s window (such as scroll bars and navigation controls), leaving only the document’s contents displayed. Default value: __false__.|
|ViewerFitWindow|Boolean|A flag specifying whether to resize the document’s window to fit the size of the first displayed page. Default value: __false__.|
|ViewerCenterWindow|Boolean|A flag specifying whether to position the document’s window in the center of the screen. Default value: __false__.|
|ViewerDisplayDocTitle|Boolean|A flag specifying whether the window’s title bar should display the document title taken from the __DocumentTitle__ parameter. If __false__, the title bar should instead display the name of the PDF file containing the document. Default value: __false__.|
|ViewerDirection|String|The predominant reading order for text:<ul><li>__L2R__ : Left to right</li><li>__R2L__ : Right to left (including vertical writing systems, such as Chinese, Japanese, and Korean)</li></ul>This entry has no direct effect on the document’s contents or page numbering but can be used to determine the relative positioning of pages when displayed side by side or printed n-up. Default value: __L2R__.|
|ViewerPrintScaling|String|The page scaling option to be selected when a print dialog is displayed for this document. Valid values are __None__, which indicates that the print dialog should reflect no page scaling, and __AppDefault__, which indicates that applications should use the current print scaling. Default value: __None__.|
|ViewerRenderToolTips|Boolean|Determines if the tooltips in the report document will be rendered in the PDF document. The tooltips are displayed using __text annotations__, represented by a visible icon that shows a tooltip when hovered. Default value: __false__.|

For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

For more detailed explanation about the device information settings and their effect on the produced PDF document, see [Design Considerations for PDF Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations%}).

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
