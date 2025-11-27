---
title: Resolving Headers Not Showing in Viewer and Font Substitution Issues in Telerik Reporting
description: Learn how to fix the issue where headers do not appear in the viewer but show in the designer, and address font substitution warnings in Telerik Reporting.
type: how-to
page_title: Headers Not Displaying in Viewer and Font Issues in Telerik Reporting
meta_title: Headers Not Displaying in Viewer and Font Issues in Telerik Reporting
slug: headers-not-displaying-in-viewer-font-substitution-telerik-reporting
tags: reporting, pageheadersection, headers, font, arial, noto-sans
res_type: kb
ticketid: 1704889
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>
Reporting
</td>
</tr>
<tr>
<td>Version</td>
<td>19.2.25.1001</td>
</tr>
</tbody>
</table>

## Description

I encounter issues where headers placed near the bottom of the [PageHeaderSection](https://docs.telerik.com/reporting/api/telerik.reporting.pageheadersection) are not visible in the viewer but display correctly in the designer. Additionally, the first item in a report sometimes appears with a different font, and a warning message indicates that "Font 'Arial' is substituted with font 'Noto Sans'."

This knowledge base article also answers the following questions:
- Why are headers not visible in the viewer but visible in the designer?
- How to fix font substitution warnings in Telerik Reporting?
- Why does the first report item have a different font than the rest?

## Solution

### Resolving Headers Not Showing in Viewer

Headers positioned near the bottom of the [PageHeaderSection](https://docs.telerik.com/reporting/api/telerik.reporting.pageheadersection) may not appear in the viewer due to rendering boundaries. Follow these steps:

1. Move header textboxes higher within the PageHeaderSection.
2. Ensure header elements, such as column headers, are within the visible bounds and not near the bottom edge.

For detailed guidance, refer to the knowledge base article: [Textbox element not showing or part of text hidden in a page section](https://docs.telerik.com/reporting/knowledge-base/text-cut-or-hidden-in-page-header).

### Resolving Font Substitution Issues

To address the "Font 'Arial' is substituted with font 'Noto Sans'" warning:

1. Check if the Arial font is available on your server or container. If not, copy the font to the server or container using the following Docker command:
   ```
   docker cp C:\Windows\arial.ttf CONTAINER_ID:/usr/share/fonts
   ```

2. Ensure the font is embedded in the report using the [privateFonts](https://docs.telerik.com/reporting/doc-output/configure-the-report-engine/privatefonts-element) configuration.

3. Use the same font across all report items to prevent inconsistencies.

Refer to these articles for further details:
- [The first instance of a report item is with a different font than the rest](https://docs.telerik.com/reporting/knowledge-base/font-is-incorrect-on-first-render-azure)
- [The font of the first few report items is not consistent with the rest](https://docs.telerik.com/reporting/knowledge-base/inconsistent-font-of-the-first-few-report-items)

## See Also

- [PageHeaderSection Overview](https://docs.telerik.com/reporting/api/telerik.reporting.pageheadersection)
- [Textbox element not showing or part of text hidden in a page section](https://docs.telerik.com/reporting/knowledge-base/text-cut-or-hidden-in-page-header)
- [The first instance of a report item is with a different font than the rest](https://docs.telerik.com/reporting/knowledge-base/font-is-incorrect-on-first-render-azure)
- [The font of the first few report items is not consistent with the rest](https://docs.telerik.com/reporting/knowledge-base/inconsistent-font-of-the-first-few-report-items)
- [privateFonts Configuration](https://docs.telerik.com/reporting/doc-output/configure-the-report-engine/privatefonts-element)
