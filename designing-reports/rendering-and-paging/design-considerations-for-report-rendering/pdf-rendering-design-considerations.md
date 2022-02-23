---
title: PDF Rendering Design Considerations
page_title: PDF Rendering Design Considerations 
description: PDF Rendering Design Considerations
slug: telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations
tags: pdf,rendering,design,considerations
published: True
position: 3
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>

# PDF Rendering Design Considerations

The PDF Rendering Extension of Telerik Reporting produces a version __1.6 PDF file__ . The file can be opened with __Adobe Acrobat 7.0__  or later.  The file is compressed using the FlateDecode filter. The PDF rendering extension is a physical page renderer, thus has pagination behavior that differs from other rendering extensions such as HTML and Excel, which are not page oriented. PDF and Image Export Formats share the same high-level layout engine. Therefore all rules and design considerations that apply for the __Image Rendering Extension__ apply for __PDF__ as well. 

The __PDF rendering__ extension is based on the Image rendering extension, with some differences. For information common to the Image rendering extension and the PDF rendering extension, see [Design Considerations for Image Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}). This topic describes features that are specific to the PDF rendering extension. 

## PDF Viewers

Due to anti-aliasing which some PDF viewers apply, report item borders may not be displayed consistently at different zoom levels in the PDF viewer. Report item's solid type borders will be rendered with miter joints when two adjacent border segments have different color, or their color is transparent. Borders with miter joints will be anti-aliased in some PDF viewers. To make sure borders will be displayed consistently in a PDF viewer use a single color (e.g. black) for all borders of the report item. 

## Font Requirements

The PDF rendering extension embeds fonts by default. This functionality is controlled by the [FontEmbedding]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}) device information setting. Fonts that are used in a report must be installed on the machine where the application is running or [privateFonts]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%}) must be configured, so the PDF rendering can embed them. If you disable font embedding, the fonts used in the report must be installed on the client computers used to view the report. When the report engine generates a report in PDF format, it uses the information stored in the font to measure and create character mappings within the PDF file. If the referenced font is not available, the resulting PDF file might not contain the correct mappings and might not display correctly when viewed. Before deploying the report on a production server, you should test the PDF output on client computers to verify that the report renders correctly. Do not rely on the Designer Preview or rendering to HTML, because GDI font substitution in those formats behaves differently than PDF. If there are Unicode Glyphs missing on the server, you may see characters replaced with a question mark and if there is a font missing on the client, you may see characters replaced with boxes. 

>warning When designing a report that would be exported to PDF, you should make sure that the font you use in the report supports the characters that would be displayed. For example when you use a font that does not support non-Latin characters, but then non-Latin characters are added to the report and it is exported to PDF, they would be replaced by question mark character (?) as PDF doesn’t automatically substitute fonts. 


To view the list of fonts that are embedded in a PDF file, open the file in Adobe Acrobat and from the __File__  menu, view __Properties__ . The __Fonts__  tab displays the list of fonts that are embedded in the file. 

## PDF/A Standard

The PDF rendering extension supports three versions of the standard – PDF/A-1b (2005), PDF/A-2b (2011), PDF/A-3b (2013). The compliance level is defined with the rendering extension device info. For more information see: [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}). 

### PDF/A Limitations

Font embedding of subset or full is required. The default option is subset. 

### PDF/A-1b Limitations

JPEG2000 image compression models are forbidden

Transparency

Digital Signature functionality is not available due to the missing support for widgets without appearance.

## Password Protection

The PDF rendering extension allows password protection with document content encryption. You can specify owner password and user password. The user password gives read only permissions. The passwords are defined with the rendering extension device info. For more information see: [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}). 

## Digital Signature

The digital signature feature enables you to sign and validate a PDF document. A signature confirms that the document content originated from the signer and has not been modified in any way.         

In the PDF document model, the validation is performed per signature. A signed document is considered valid when it has not been changed after the signing and all of its certificates have a valid trusted root certificate. 

To sign a PDF document a path to a X.509 certificate is specified in the rendering extension device info. For more information see: [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}). 

## Metadata

The PDF rendering extension writes the following information to the PDF file: 


| PDF property | Value |
| ------ | ------ |
|Creator|If custom value is not specified with [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}), the default value is Telerik Reporting product name and version.|
|Producer|If custom value is not specified with [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}), the default value is Telerik Reporting product name and version.|
|CreationDate|Report execution time|


The metadata contents are written with ASCII encoding by default. In case the metadata fields contain special characters like accented characters or umlauts, they might not be persisted and displayed correctly. The PDF compliance standards impose using UTF-8 for the document metadata, so using any of the supported compliance levels (A-1b, A-2b, A-3b) or enabling the accessibility features will persist the special characters correctly. 

## Interactivity

### Bookmarks

The PDF rendering extension supports [Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview%}) interactive feature which is rendered as PDF Bookmarks. You can use the Bookmarks by opening the Bookmarks pane in Acrobat Reader to navigate inside the report. 

### Hyperlinks

URL actions on report items are rendered as hyperlinks in the PDF file. Hyperlinks are rendered as clickable links and when you click the hyperlink, the default Web browser opens and navigates to the specified URL. 

The PDF format URI Action does not provide control over the opening target. For that reason, the PDF viewer controls where to open the link. For example, if the PDF document is opened in a browser tab, the hyperlink may open in the same tab even when the NavigateToUrl action Target is set to a new window. 

### Limitations

The PDF Rendering extension has the following limitations:

* Only Unicode fonts are supported.

* Tooltips on Graph or Map data points are not rendered.

* Underlining justified text will only underline the words and not the spaces between them.

* Hiding the border of report items needs to be done with BorderStyle property, not BorderWidth property.  
  To hide the border, apply BorderStyle=None setting for the item.

* The PDF graphics subsystem may fail to render graphic primitives with very small size (i.e. thousandths of a millimeter), producing a corrupted PDF document. Such graphics primitives are usually graph data points (bars, columns, or pie slices) that represent a tiny portion of the supplied data. Since such small graphic primitives are practically invisible, the recommended approach is to set their visibility through the corresponding ConditionalFormatting properties. 

### Performance

The PDF Rendering extension has the following performance considerations:

* Rendering reports with many items with justified text may be slower.

## Accessibility

The accessibility of the PDF document is controlled by the __EnableAccessibility__ option in the device information settings or by the same option in the report viewer that exports a document in PDF format. If __EnableAccessibility__ is set to __true__, the produced PDF document will contain additional metadata and structure elements in order to satisfy the [PDF/UA (ISO standard 14289-1)](https://en.wikipedia.org/wiki/PDF/UA) requirements. Adding accessibility information to a PDF document will result in an increased file size compared to a PDF file with disabled accessibility features. 

Below are listed the most important characteristics of a PDF document generated by Telerik Reporting engine: 

* *Tagged contents* - all items in the report will have a corresponding specific entries in the PDF structure that will contain the actual text recognized by the screen readers and other assistive technologies. The rules to generate the text in tagged contents are the same used to generate the metadata in [report viewers with enabled accessibility.]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/accessibility%})

* *Description for non-textual items* - the PictureBox, Graph and Map items should provide meaningful accessible descriptions in the report definition. This description will be persisted used in a tag elements with configured actual and alternate text. Other graphical primitives like borders will be treated as non-informational elements and will be added in the PDF document structure as *artifacts* . 

* *Annotations* - all the links in the document will have a respective link annotation object in the PDF structure. 

* *Document Title* - the title should be provided from the device information settings object. In case it is unavailable, the [DocumentName](/reporting/api/Telerik.Reporting.Report#Telerik_Reporting_Report_DocumentName) property of the report will be used instead. 

* *Document Natural Language* - the document language should be provided from the device information settings object. In case it is unavailable, the __Name__  of the [Culture](/reporting/api/Telerik.Reporting.Report#Telerik_Reporting_Report_Culture)  property of the report will be used instead. 

## SVG Rendering

The PDF rendering extension can render SVG images in either vector-based or raster-based graphic primitives. 

* The vector-based rendering preserves the image quality regardless the current zoom, but does not support all SVG elements like gradients and embedded images. 

* The raster-based rendering can be used with every SVG image and produces a bitmap which looks best at 100% scale, but does not preserve its quality when zooming in/out in the PDF document. 

The SVG rendering mode is controlled by a key in the device information settings object. The key is named __UseSvgVectorRendering__ and accepts a boolean value. Its default value is __true__. 

# See Also

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})

 * [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [PDF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%})
