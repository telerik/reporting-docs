---
title: Report Structure
page_title: Report Structur
description: "Learn which elements build the structure of the reports created in the Telerik Web Report Designer and use these report elements to convey information effectively."
slug: designing-reports/report-designer-tools/web-report-designer/user-guide/report-structure
tags: telerik, reporting, report, structure, groups, sections, items
published: True
position: 8
---

# The Basic Structure of a Report

The design of a report is divided into sections that divide the report vertically. Each report section represents a specific area on the report page and defines what items can be placed in it and how they will look.

By default, every new report you create has three sections:

* Page header
* Page footer
* Detail section (the main content area of the report)

In addition to the default sections above, you can also add:

* Table of Contents (TOC)
* Report Header
* Group Header
* Group Footer
* Report Footer

## Page Header

The Page Header section is printed at the top of every page. In reports that include multiple pages, you can use the Page Header to place the same content at the beginning of every page, for example, the report title.

>The Page Header can display only the content that fits within the boundaries of the section. Any content that doesn't fit within the section will be clipped.

## Table of Contents

The Table of Contents (TOC) section provides a set of navigational links to report items and displays the page numbers where they can be found. The user can click the TOC entries to navigate to the report page which displays that item.

The TOC section can be displayed before or after the Report Header or Report Footer section based on the user preferences. For more information, see [Table of Contents]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%}) overview article.

## Report Header

The Report Header section is printed just once, at the beginning of the report.

* If there is a Page Header on the first page, the Report Header will be rendered after it.
* If there is a TOC section, you may specify its position with respect to Report Header (for example, `Before` or `After`).

Use the report header for information that might normally appear on a cover page, such as a logo, a title, or a date. In the Report Header section, all data fields must be aggregated, even if the data source returns only one row. Typically, you must use the `FIRST()` function for character and date data and the `SUM()` function for numeric data. When you place a data-bound report item that uses an aggregate function in the report header, it is calculated for the entire report data.

## Group Header

The Group Header section is printed at the beginning of each new group of records. Use the group header to print the group name. For example, in a report that is grouped by product, use the group header to print the product name.

In the Group Header section, all data fields must be aggregated, even if the data source returns only one row. Typically, you must use the `FIRST()` function for character and date data, and the `SUM()` function for numeric data. When you place a data-bound report item that uses an aggregate function in the Group Header, it is calculated for the entire group data.

## Detail

The Detail section displays the detailed information and is printed once for every row in the data source. This is where you place the report items that constitute the main body of the report.

## Group Footer

The Group Footer section is printed at the end of each group of records. Use a group footer to print a summary of group information. Similar to the Group Header section, you must always use aggregate functions for the data-bound items that are calculated for the group data.

## Report Footer

The Report Footer section is printed just once, at the end of the report.

* If there is Page Footer on the last page, the Report Footer will be rendered before it.
* If there is a TOC section, you may specify its position with respect to Report Footer (for example, `Before` or `After`).

Use the report footer to print report totals or other summary information for the entire report. Similar to the Report Header section, you must always use aggregate functions for the data-bound items that are calculated for the entire report data.

## Page Footer

The Page Footer section is printed at the end of every page. Use a page footer to print page numbers or per-page information.

This section and its items are processed by the corresponding rendering extension after the report data has been processed. Therefore, the same implications listed for the Page Header apply also to the Page Footer section.

It is possible to hide this section for particular pages by using a [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}) expression over the `Style.Visible` property. For example, you may hide it on all even pages.

To hide the Page Footer on the first and/or last pages, use the dedicated `PrintOnFirstPage` and `PrintOnLastPage` Boolean properties. Hiding the section leads to freeing page space for the rest of the report content. Note that setting the `PrintOnLastPage` to `true` may lead to unintuitive pagination of the section preceding the last Page Footer. This occurs because determining the last page number and hiding the last Page Footer are interdependent when the last non-Page Footer section fits in the space regularly occupied from the Page Footer. For example, this may be observed when replacing the last Page Footer section with a Report Footer section.

## Report Groups

Report groups allow you to visually separate groups of data and to display introductory and summary data for each group.

Report groups provide logical sections of data within the report while the group header and footer sections provide visual representation of the group boundaries. For example, you can group sales by shipping date and calculate the total amount of sales for each day.

Usually, the data that identifies the group will be displayed in a separate section at the beginning of the group, for example, in the group header. The group footer is generally used to summarize the group data in a separate section at the end of the group.

You can group the data within the report by fields and expressions. To define Report Groups, add the `Group` objects to the `Groups` collection of the report. Report Groups are always nested according to the order in the `Groups` collection.

To display a summary of group data, use the `GroupHeaderSection` and `GroupFooterSection` properties that appear once for each group member at the beginning and the end respectively. The `DetailSection` displays report detail data and always appears inside the innermost group.

## Report Items

Report items are controls that are used to display various types of report data such as barcodes and graphs. For more information, refer to the [Report Items section]({%slug telerikreporting/designing-reports/report-structure/overview%}).
