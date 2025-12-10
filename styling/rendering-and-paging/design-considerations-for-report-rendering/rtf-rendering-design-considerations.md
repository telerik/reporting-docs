---
title: RTF Rendering
page_title: RTF Rendering Design Considerations Explained
description: "Learn important details about the behavior and limitations of the RTF rendering format, that need to be taken into account when designing a report with RTF rendering in mind."
slug: telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/rtf-rendering-design-considerations
tags: rtf, rendering, design, considerations
published: True
position: 6
previous_url: /designing-reports-considerations-rtf
reportingArea: General
---

# Design Considerations for the RTF Rendering

The RTF Rendering Extension of Telerik Reporting produces __RTF v1.6__  files. It is recommended that the exported file is viewed with __Microsoft Word 97__ or later.

## Design Consideration for RTF Rendering (Frames Mode)

Telerik Reporting relies on __Frames__ to a achieve a WYSIWYG layout and preserve the original report outlook as much as possible. Consumer applications that __do not support Frames__ might produce __unexpected results__ and are not recommended.

### Limitations

* __Vertical Alignment__ is not supported.
* __Report Background Color__ is not supported.
* __TextWrap = false__ is not supported.
* __Inset and Outset Borders__ are not supported.
* __Rotated Text__ is rendered by an image.
* __RTL Text Handling__ is left to the consumer application.
* Maximum __Page Width__ and __Height__ is __22 inches__.
* __Simple Report__ __Items__ (_TextBox_, _PictureBox_, etc.) __cannot span multiple pages__. They should fit on a single page.
* Table of contents interactivity actions (navigational links) are not supported.

## Design Consideration for RTF Rendering (Tables Mode)

When a report contains a __Table__ or a __CrossTab__ item, the RTF Rendering Extension switches to an alternative rendering mode and uses tables since they are natural for those two items.

When a report is exported to RTF in the Table mode it is represented by a series of tables nested in one another representing the hierarchical structure of the report. Each container (for example a ReportSection or Panel) is rendered as a table and its child elements are positioned in the respective row and column of this table. The rows and columns of the table are calculated and sized depending on the locations and sizes of the child elements. Non-container items (for example a TextBox or PictureBox) are rendered as the contents of the cell they fall in. If a child element is a container itself, then a new table is nested in the respective cell.

### HtmlTextBox Limitations

Due to the media limitations, the following CSS style properties set on the HTML tags *are NOT respected*:

* __borders__
* __padding__
* __background-color__ on Block elements is rendered as background-color of the text
* __text-align (including the center tag)__

### Paging

* The report is paged by the consumer application (MS Word most often) based on the table generated and the page size. The exact number of pages might not be the same as in the Image Rendering Extensions.
* Since the paging is left to the consumer application the page breaks might not be at exactly the same spots as in the Image Rendering Extensions.
* The GroupSection.PrintOnEveryPage is not respected.
* KeepTogether properties might produce slightly different results from the ImageRendering Extensions in certain circumstances, since the decision of whether a certain table row can be kept together on the current page is taken by the consumer application.
* Page widths that are up to 22 inches wide are supported.
* If the report grows more than the page width, the page will be automatically expanded to accommodate the report if possible.
* If an item’s bounds (location and size) are exactly or close to the page bounds (i.e. the item occupies exactly one page entirely), an additional page might be added after it.

### Page Headers / Footers

* Page  Headers/Footers are rendered by using the native page header/footer of the document and are always rendered on every page. PrintOnFirstPage/PrintOnLastPage properties are not respected.
* If the report is part of a ReportBook, then it does not render its Page Header/Footer.
* Contents inside the Page Header/Footer are rendered with tables as well.
* The global objects PageNumber and PageCount are inserted as calculated fields.

### Limitations

* BackgroundImages are usually not rendered. Only if the container has no children or the simple item has no content its BackgroundImage will appear. So, for example, if you have a Panel with TextBoxes inside it, then it will not render its BackgroundImage.
* Item borders are rendered as cell borders on the cell that the item occupies.
* Mixing a lot of items that are not aligned to each other in the same container increases the complexity of the generated table, thus increasing document rendering and opening times and file size.
* Text boxes grow when they contain non-breaking spaces.
* When text is exported, text with font decoration in certain fonts may generate unexpected or missing glyphs in the rendered report.
* Some older readers do not support nested tables and other crucial features so export results may be unexpected. The recommended application for opening RTF files generated by Telerik Reporting is Microsoft Office Word 2007.
* __Watermarks__ are not supported.
* __Table of Contents__ is not supported.
* __BackgroundImage.Repeat__ in __PageSettings__ is not respected, since the RTF natively supports tiled background patterns.
* If a TextBox item with justified text is rendered on two or more pages, the last line of each page (except the last page) will be left-aligned due to the justification algorithm used by RTF.

## Interactivity

This rendering extension does not support any interactive features.

## See Also

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
 * [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
