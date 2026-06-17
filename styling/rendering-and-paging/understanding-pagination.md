---
title: Pagination
page_title: Understanding Report Pagination - Telerik Reporting
description: "Learn how Telerik Reporting controls pagination through page settings, page breaks, Keep Together rules, and multi-column layouts."
slug: telerikreporting/designing-reports/rendering-and-paging/understanding-pagination
tags: understanding, pagination
published: True
position: 2
previous_url: /designing-reports-page-layout-rendering-understanding-pagination
reportingArea: General
---

# Understanding Pagination

Pagination refers to the number of pages within a report and how report items are arranged on those pages. Pagination varies depending on the renderer used, the page break settings, and the keep-together options configured for the report.

A report optimized for its target renderer requires an understanding of the pagination rules described in this article.

This article explains how physical page size and report layout affect how page break renderers process a report.

## Page Setup

When you render a report, specify page setup options at run-time or design-time. Users can change some options through the **Page Setup** dialog. Page setup options apply to all report output types.

### Page Settings

The `PageSettings` property of the `Report` object exposes the following customizable properties:

| **Property** | **Description** |
| ------ | ------ |
| **Landscape** | **True** to print in landscape orientation, **False** to print in portrait orientation.|
| **Margins** |A `Telerik.Reporting.Drawing.MarginsU` object that lets you individually specify the margins on all four sides of the report.|
| **PaperKind** |The type of paper to print the report on, such as `Letter`, `Legal`, `A3`, or `A4`. Setting this automatically sets the correct dimensions in the `PaperSize` property.|
| **PaperSize** |When **PaperKind** is set to `Custom`, specify a non-standard set of paper dimensions.|
| **ContinuousPaper** | **True** to print the report's content without adding vertical page breaks.|
| **ColumnCount and ColumnSpacing** |Related to multi-column layout. These properties define the number of columns for the report's content and the space between them.|
| **BackgroundColor, BackgroundImage** |Define the color or image applied to the whole physical page, repeated on each page.|
| **BorderStyle, BorderWidth, BorderColor** |Define the style, width, and color for the border drawn around the content area of the physical page. The content area is determined by the `PaperKind`, `PaperSize`, `Landscape`, and `Margins` properties.|
| **Watermarks** |Typically used to indicate a document's status, for example, draft or internal distribution only. Watermarks are overlaid on the report content.|

### Physical Page

The physical page size is the paper size. The paper size that you specify for the report controls how the report is rendered. Reports rendered in physical page formats insert page breaks horizontally and vertically based on the physical page size to provide an optimized reading experience when printed or viewed in a physical page format. Reports rendered in logical page formats insert page breaks horizontally based on the physical size to provide an optimized reading experience when viewed in a Web browser.

You can change page size by changing the `PaperSize.Height` and `PaperSize.Width` properties in the **Properties** pane. The page size does not grow or shrink to accommodate the contents of the report. If you want the report to appear on a single page, the whole report content must fit on the physical page. If it does not fit and you use physical page format, the report will occupy additional pages. If the report grows past the right edge of the physical page, then a page break is inserted horizontally. If the report body grows past the bottom edge of the physical page, then a page break is inserted vertically.

The `PaperSize.Height` can be set to be undetermined through the `ContinuousPaper` property. As a result the page will use all PageSettings properties, excluding `PaperSize.Height` property. The height of the page will be determined by the height of the content.

By design, if the remaining part of the document is less than 1% of single-column width, this part will not be displayed. For example, if you add a textbox whose width is equal to the report's width and you set a border to it, the right border will not be displayed in Print Preview mode.

### Margins

Margins are specified by changing the `Top`, `Bottom`, `Left`, and `Right` properties in the **Properties** pane. The area of the physical page that remains after space is allocated for margins, column spacing (multi-column), and the page header and footer, is referred to as usable page area. Margins are only applied when you render and print reports in physical page formats.

### Multi-columns (Newsletter-Style Columns)

When a report is divided into multiple columns, physical pages are divided vertically into columns, each of which is considered a logical page. Suppose you have two columns on a physical page - the content of your report fills the first column and then the second column. If the report does not fit entirely within the first two columns, the report fills the first column and then the second column on the next page. Columns continue to be filled, from left to right, top to bottom until all report items are rendered. For more information, see [How to Create a Multi-Column Report](slug:telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report).

### Print on continuous (roll) paper

When you set the report's `PageSettings.ContinuousPaper` property to `true`, all `PageSettings` properties are respected except `PaperSize.Height`. The report's content is measured and rendered into a page tall enough to contain all the content, including the page margins. If the content cannot fit within the page width, the report pages horizontally and each page uses the same height.

Page breaks are not expected when printing on continuous paper. Setting a report section's `PageBreak` results in physical pages having the same height, sufficient to contain all the content.

In a `ReportBook`, each report's `PageSettings` properties are respected when paging the document. Each individual report prints separately on continuous (roll) paper.

## Paging and Keep Together

Based on report content and page settings the report is divided into one or more pages. The actual report content is rendered on a page after margins are subtracted from the page size.

If the report body cannot fit in the available page width, a new page is added to accommodate the content. At design-time, a vertical red line indicates the available width (the snap grid must be enabled in the Designer). Ensure report sections and items do not cross this boundary to prevent them from splitting across pages.

>caution If every other page in a report seems to be blank, the most probable reason is that a report item is stretching over the right page margin (appears over the vertical red line in report designer) and in case it has no background or border, you will not be able to detect it, but it is still there and is causing a new page to be created.

In the vertical direction, by default sections are not split across different pages. Soft page break is an instrument to cut the report content and continue on the next page. Here are the items with their respective properties that enable inserting a soft page break.

* If you want to force a page break before or after a section, use the section’s `PageBreak` property.

* Table/Crosstab items also support page breaks before and/or after each TableGroup instance. This is supported in both horizontal and vertical direction and is controlled using the [Telerik.Reporting.TableGroup.PageBreak](/api/Telerik.Reporting.TableGroup#Telerik_Reporting_TableGroup_PageBreak) property.

* Set the `KeepTogether` property of a Report item or section, or `GroupKeepTogether` of a Report group, to `false` to allow it to split during rendering.

### Inserting Page Breaks Without Group Hierarchies

To force a page break at a specific point without building a group hierarchy, use one of the following approaches:

* **Detail section `PageBreak`**: The simplest option when each data record should appear on its own page. Set the Detail section's `PageBreak` property to `After`. Each record then renders on a new page with no group configuration needed.
* **Table row group `PageBreak`**: When multiple content blocks share one data source, add a **Table** report item and define row groups to separate the blocks. Set the `TableGroup.PageBreak` property to `After` or `Before` on each row group. This avoids report-level group nesting while providing precise break control at each logical boundary.
* **Panel with `KeepTogether`**: When a block of related items must not split across pages, place the items inside a **Panel** and set `KeepTogether = True`. The panel moves to the next page as a unit if it does not fit on the current page.

In older Telerik Reporting versions, simple report items (that is, non-container items) are always kept together on a page if possible. If not, they are rendered at the beginning of the next page. If they still cannot fit because they are longer than a whole page, they are split. The `PictureBox`, `Shape`, and `Chart` items are always kept together.

>note In recent Telerik Reporting versions, all items can be split between pages if they do not fit on the current page.

By default, groups are not kept together on a single page. You can instruct the rendering engine to try to keep the entire group or the group header with the first detail on a single page if possible by setting the GroupKeepTogether property of the Group component. If group is kept together using `GroupKeepTogether` property, the engine will ignore the PageBreak property set for the Detail section.

By default, Table item is kept together. To force nested table to break set `KeepTogether = False` for parent table's row/column that contains nested table.

>note If the Report group has `GroupKeepTogether = FirstDetail` and the `Detail` section has `KeepTogether = False`, if even a part of the detail section without any report items (essentially _blank_ content) can be rendered on the page with the **group header**, that part of the detail section is treated as the first detail and the group header section renders on that page.

>note If the content that should be kept together is too large to fit on a single page, it is not moved and is left on the current page, forcing the rest of the content to move to next page, as if `KeepTogether` is `False`.
>
>_Example_: Report group has `GroupKeepTogether = FirstDetail`, this means that the summary height of the group header, height of all child group headers (if any) and height of the first detail should be able to fit on a single page in order for the KeepTogether algorithm to work and move the whole Group on a new page.

>note You can change the Page sections' `Height` and `Visible` properties for specific pages by applying [Bindings](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings).
This results in more or less available space for the rest of the report content on the affected pages.
The paging logic respects the changed space when fitting content on the current page.
However, it cannot predict whether available space will change on the next page.
For that reason, when applying paging rules on the current page, the engine assumes the available space on the next page remains as designed in the report definition, that is, without dynamic changes.
Consider this implication when applying such Bindings, as it may lead to unexpected pagination behavior.
>
>_Example_: If you have a _Panel_ with `KeepTogether = True`, the expectation is to have it entirely on a new page if it cannot fit on the current one but can fit on a new page. Assume that the _Panel_ `Height` is such that it fits on a physical page without a _PageHeader_ but cannot fit when one is present. In this scenario, if your report has _PageHeader_, the _Panel_ will be split even if the _PageHeader_ `Visible` property is `False` or its `Height` is reduced with _Bindings_ to allow the _Panel_ to fit entirely on a new page. The reason is that the Reporting engine calculates the expected available area for the next page based on the report definition property values for the Page sections' `Height`. The `Visible` property is not taken into account. If there is no _PageHeader_ section in the report, the _Panel_ `KeepTogether` will work as expected.

## Horizontal Paging

If the report spans over several pages in width then its sections are stretched from the left edge of the left-most page’s printable area to the right edge of the right-most page’s printable area, as displayed in the following diagram:

![Image illustrating how the horizontal paging behaves.](images/SectionSpan.jpg)

>caution If your report item (table) is too wide to fit on the page it will cause a horizontal overflow and will continue on the next page. However whenever this happens if there is additional content below the table a blank page for each additional page (needed by the table) will be generated. To understand this better consider the following example: 

|   |   |   |
| ------ | ------ | ------ |
|page 1 (first part of table)|page 2 (second part)|page 3 (third part)|
|page 4 (another content here)|page 5 (empty)|page 6 (empty)|

## Report sections

Report sections automatically grow and can shrink (controlled by property) to accommodate the report items contained within. They do not reflect the physical page size and can grow beyond the boundaries of the physical page size to span multiple report pages. Exception in this rule make the PageHeader and PageFooter sections, which can only grow horizontally, and cannot shrink in any dimension. Page sections can be only hidden, and in that case their space is taken up from the rest of the report content.

## See Also

* [Rendering and Paging](slug:telerikreporting/designing-reports/rendering-and-paging/overview)
* [Understanding Rendering Behaviors](slug:telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors)