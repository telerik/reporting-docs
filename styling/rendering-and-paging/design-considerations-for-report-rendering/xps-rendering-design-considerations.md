---
title: XPS Rendering
page_title: XPS Rendering Design Considerations at a glance
description: "Learn important details about the behavior and limitations of the XPS rendering format, that need to be taken into account when designing a report with XPS rendering in mind."
slug: telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/xps-rendering-design-considerations
tags: xps, rendering, design, considerations
published: True
position: 7
previous_url: /designing-reports-considerations-xps
reportingArea: General
---

# Design Considerations for the XPS Rendering

The XPS Rendering Extension of Telerik Reporting produces XPS files that comply with version 1.0 of the XML Paper Specification.

An XPS document is a paginated set of related pages. The pages have a fixed layout, are organized into one or more fixed documents, and stored according to the Open Packaging Conventions. The file can be opened with the built-in XPS viewer in Windows Vista or later.

XPS and Image rendering extensions share the same high-level layout engine. Therefore all rules and design considerations that apply for the Image Rendering Extension apply for XPS as well.

For information common to the Image rendering extension and the XPS rendering extension, see [Image Rendering Design Considerations]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}). This topic describes features that are specific to the XPS rendering extension.

## Styling

* If a TextBox item with justified text is rendered on two or more pages, the last line of each page (except the last page) will be left-aligned.
* Cross-section items are not supported.

## Interactivity

This rendering extension does not support any interactive features.

>note XPS glyphs do not work with TrueType Collection Fonts. When you use such fonts in report, only the first font in the collection is used for the creation of the XPS document.

## See Also

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
 * [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
