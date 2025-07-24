---
title: Implementing Full Page Background Image Rendering in Reports
description: Learn how to ensure full-page rendering in reports, including complete background images, regardless of content size.
type: how-to
page_title: Ensuring Full Page Background Image Display in Reports
meta_title: Ensuring Full Page Background Image Display in Reports
slug: full-page-rendering-background-image-reports
tags: reporting, page-rendering, background-image, pdf, print-preview
res_type: kb
ticketid: 1694156
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
</tbody>
</table>

## Description

I need to implement additional page rendering for my report to ensure the background image always covers the entire page. Currently, a second page appears due to large text, but it only displays the background image up to the last line of the text. The same issue occurs when exporting the report to PDF, where the background image ends at the text content instead of covering the full page. I want the second page to match the size of the first page and fully display the background image.

This knowledge base article also answers the following questions:
- How to render a complete background image in PDF reports?
- How to ensure full page rendering for reports with varying content?
- How to use Watermarks and PageSettings in Telerik Reporting?

## Solution

To ensure the background image covers the entire page, follow these steps:

* Use [Watermarks]({%slug telerikreporting/designing-reports/rendering-and-paging/watermarks%}) instead of setting the background image in the Style property of the Report or its Detail section. Watermarks are part of the PageSettings and are drawn on the entire page, ensuring the background appears fully even on pages with minimal data.
* Alternatively, set the `PageSettings > Style > Background Image` property. This will render the image on the entire page.

Both above settings are respected only in hard pagination formats like PrintPreview or PDF.

This means that in Interactive View Mode of the Report Viewer (see [Interactive and Print Layouts]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%})), the background image/watermark won't be visible. To overcome this, you may switch the viewMode of your Viewer to `PRINT_PREVIEW`. The PageSettings, including Watermarks and Background Image, are respected in this mode.

## See Also

* [Watermarks Documentation]({%slug telerikreporting/designing-reports/rendering-and-paging/watermarks%})
* [Styling Report Items Documentation]({%slug telerikreporting/designing-reports/styling-reports/styling-report-items%})
