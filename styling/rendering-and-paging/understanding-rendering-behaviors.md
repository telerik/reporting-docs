---
title: Rendering Behaviors
page_title: Rendering Behaviors Explained
description: "Learn more about the Rendering of Telerik Reports. Understand how the reports get paginated and how you may control this process."
slug: telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors
tags: understanding, rendering, behaviors
published: True
position: 1
previous_url: /designing-reports-page-layout-rendering-understanding-rendering-behaviors
reportingArea: General
---

# Understanding Rendering Behaviors

Depending on the renderer you select, certain rules are applied when rendering the report. How report items fit together on a page is determined by the combination of these factors:

* Rendering rules.
* The width and height of report items.
* The size of the report.
* The width and height of the page.
* Renderer-specific support for paging.

This topic discusses the general rules that are applied by Telerik Reporting. For more information, see [Design Considerations for Report Item Layout]({%slug telerikreporting/designing-reports/report-structure/design-considerations-for-report-item-layout%}).

## General Behaviors for Logical Page Renderers

Reports exported using MHTML and Excel formats are optimized for a computer screen-based experience where pages can be various lengths. To determine how a report will appear in a logical page renderer, use Interactive View of any Report Viewer. The corresponding rendering extension will be used - IMAGEInteractive, HTML5Interactive, XAMLInteractive or WPFXAMLInteractive. The report will appear as it would in a MHTML or Excel format.

When exporting a report to MHTML or Excel, the following rules are followed:

* The page breaks that you explicitly insert, are applied to report items. For example, if you insert a page break between each group, they are applied when the report is rendered.
* Report pages can grow to accommodate any report items that need to be kept together. This means that the report can extend beyond the screen width and can be viewed by using slider bars.
* Pagination is applied to reports vertically only.
* Page margins are not applied.

## General Behaviors for Physical Page Renderers

Reports exported using PDF and Image are optimized for a book-like or printed experience where pages are a consistent size. Page breaks are inserted vertically and horizontally at specific locations within the report. These specific locations are determined by the page width and page height settings.

>tip To determine how a report will appear in a physical page renderer, switch to Print Preview in any of the report viewers. The report appears as it would in PDF or Image formats.

When exporting a report to Image, PDF, RTF, XPS, Powerpoint, and Word, the following general rules are followed:

* Pages are rendered sequentially from left to right, then top to bottom. (when horizontal paging occurs)
* Explicitly set page breaks can cause report items to push other items to the next page.
* If a page break occurs through report items that must be kept together (e.g. placed in a Panel), the items that must be kept together are moved to the next page.
* If an item cannot be kept together, for example a text box that grows too large to fit within the vertical usable page area, then the item will be clipped at the physical page boundary and will continue on the next page.
* Pagination is applied to reports vertically and horizontally.

## Skip Blank Pages in the Rendered Report

Since R1 2021 SP1, the rendering engine may be forced to skip all pages that do not contain significant content. The latter are considered blank and this includes all pages that __only__ contain items of the following type: Report, Group, any Section, empty SubReport item, Cross-section item, i.e., they do not contain items like TextBox, PicturePox, Table, etc.

You can still control this rendering behavior, so that pages that do not contain significant content get rendered by setting the __SkipBlankPages__ property of the report to __False__.

Please, consider the following specifics of this rendering behavior:

* If a Subreport is missing from the final output, it might be because it contains errors. In that case, try setting the __SkipBlankPages__ property to __False__ in order to examine the actual error.
* The algorithm does not consider the content of the PageHeader, PageFooter and Watermarks as significant. The report’s body must contain significant content for the page to get rendered.
* All [Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) and paged export formats (without RTF-Table mode) conform to this behavior.
* The viewers show a dedicated message in the report area when it appears that the report has no pages to display.

## Page Header and Footer sections

The following rules apply to page headers and footers when rendered on the page:

* The header or footer is rendered at the top and bottom of every page within the usable page area (when present).
* When the page header or footer section is hidden on certain pages, it gets collapsed and its height is used from the rest of the report content.
* The header and footer do not grow or shrink based on their content. They are rendered on every page at the height specified when you created the respective page section, or the one set with Binding as explained in the article [The Basic Structure of the Report]({%slug report_structure_groups_sections%}) - section [Page Header]({%slug report_structure_groups_sections%}#page-header).
* If the contents of the header or footer grow beyond the boundaries of the header or footer, the contents are clipped. Any report item that doesn't fit entirely in the section is removed, i.e. not rendered at all.
* Page sections of report used as SubReport get neglected. Only page sections of the main report are rendered.
* In multi-column reports (supported only in Physical paging), there is only one page header and footer per page, regardless of the number of columns.
* Page Footer section Visibility should NOT depend on [PageCount]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}). The total page count depends on the Visibility of the Page Footer section as this changes the available space for the rest of the report content. Hence, if the Visibility of the Page Footer is set to depend on the PageCount, uncertainty will be introduced. The result will be incorrect PageCount.

## See Also

* [Rendering and Paging]({%slug telerikreporting/designing-reports/rendering-and-paging/overview%})
* [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%})
