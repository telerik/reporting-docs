---
title: Image Rendering
page_title: Image Rendering Design Considerations at a glance
description: "Learn important details about the behavior and limitations of the Image rendering format, that need to be taken into account when designing a report with Image rendering in mind."
slug: telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations
tags: image, rendering, design, considerations
published: True
position: 2
previous_url: /designing-reports-considerations-image
reportingArea: General
---

# Design Considerations for the Image Rendering

The Image rendering extension renders a report to a bitmap or metafile. By default, the Image rendering extension produces a TIFF file of the report, which can be viewed in multiple pages. When the client receives the image, it can be displayed in an image viewer and printed.

The Image rendering extension can generate files in any of the formats supported by GDI+: BMP, EMF, GIF, JPEG, PNG, and TIFF.

> TIFF is not supported by the library `libgdiplus`. For that reason, the TIFF Image export doesn't work on Linux and Mac platforms.

The Image rendering extension processes the report by assembling all elements of the report and creates an image for each page. With extensions like the HTML rendering extension, you rely on the client browser to display the final report to the user. This can lead to varying user experiences, based on browser versions, settings and fonts. With an image, you are assured that each user is viewing the same style and layout.

## Rendering

Rendering takes into consideration the rules defined in [General Behaviors for PDF, Image, HTML and Print]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors%}) topic.

Report item's solid type borders will use miter joints when two adjacent border segments have different color, or their color is transparent.

## Limitations

Underlining justified text will only underline the words and not the spaces between them.

Due to metafile specifics, report item borders thinner than 1px may not be rendered consistently.

## Performance

Rendering reports with many items with justified text may be slower.

## Pagination

Paging takes into consideration the rules defined in [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%}) topic.

## Interactivity

This rendering extension does not support any interactive features.

## See Also

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) 
 * [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) 
 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
