---
title: Report Structure
page_title: Report Structure at a Glance
description: "Learn more about the report structure and the groups, sections, and items a Telerik Reporting report contains."
slug: designing-reports/report-designer-tools/web-report-designer/user-guide/report-structure
tags: telerik, reporting, report, structure, groups, sections, items
published: True
position: 8
---

# The Basic Structure of the Report

The design of a report is divided into sections.

To view the report sections, open the report in [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) or [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}).

Report sections divide the report vertically. Depending on their type, for example, Page and Group sections, they appear on specific places in the report and the report items they contain are processed and rendered differently. Each section works in a specific way, for example, the section in which you choose to place a data-bound item determines how Telerik Reporting calculates the results.

To create a data-bound report, assign a data source to the report or its nested [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}), and either specify [`Expressions`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) for the items within the report, or a corresponding data item where to display the actual data. For more information on creating data-bound reports, refer to the [Connecting to Data]({%slug telerikreporting/designing-reports/connecting-to-data/overview%}) and [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}) articles.

You can reuse the styling of the report items in stylesheets. If a report uses stylesheets, they can be saved to an XML file and shared between multiple reports in your application. For more information, refer to the article on [exporting and reusing stylesheets]({%slug telerikreporting/designing-reports/styling-reports/exporting-and-reusing-style-sheets%}).

## Report Sections

A Telerik report consists of different sections that may contain report items. Each report section represents a specific area on the report page and defines the rendering of its report items.

Every section is an instance of the [`ReportSectionBase`](/reporting/api/Telerik.Reporting.ReportSectionBase) class. The `Height` property defines the space a section occupies on the page. Other specific properties, such as `PrintOnFirstPage` and `PrintOnLastPage`, define the behavior of the particular section.

When a new Telerik report is added to a project, it is initially divided into `PageHeader`, `Detail`, and `PageFooter` sections. The section type specifies rendering of the items inside, the order of their appearance, and the number of times they will be rendered when the report is data-bound.

The Telerik report contains the following report sections:

* [`Page Header`]
* [`Table of Contents (TOC)`]
* [`Report Header`]
* [`Group Header`]
* [`Detail`]
* [`Group Footer`]
* [`Report Footer`]
* [`Page Footer`]

### Page Header

The Page Header section is printed at the top of every page. For example, you can use the page header to repeat the report title on every page.

Since the paging of a report strongly depends on the format it is rendered to, this section and its items are processed by the corresponding rendering extension after the report data has been processed. This approach has the following implications:

* The built-in [`PageNumber` and `PageCount` objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}), which contain the current page number and the total report pages count, can be used in this section. All [Page Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}) can also be used in this section.
* It is possible to suppress the printing of the Page Header section on the first (set `PrintOnFirstPage`) and last (set `PrintOnLastPage`) page of a report, or hide it by using [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}). In this case, the occupied space will be used from the rest of the report content. It is not possible to use the `= (PageNumber = PageCount)` expressions to hide the `PageHeader` or `PageFooter` on the last page. This is a known limitation due to the fact that the resulting page count depends on the visibility of the `PageHeader` and `PageFooter` sections as this modifies the available space for the rest of the report content. At the same time, the above expression sets the visibility of the page sections to depend on the page count. This leads to uncertainty and the page count cannot be properly estimated.
* The Height of the section may be changed at runtime through [`Bindings`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}). It is recommended that you set the default height of the section to the maximal expected one. Then, you may reduce the height of each Page section with a proper Binding. The reason behind this approach is to assure that the available height of the page after rendering the Page Header and Footer will be positive, so that some detailed content can be placed on the page. If the combined height of the Page Header and Page Footer is bigger than the page height, the Page sections will be ignored and only the content will be rendered. The [behavior of the `KeepTogether` property]({%slug telerikreporting/designing-reports/report-structure/design-considerations-for-report-item-layout%}#Pagination1) may also change due to the extra expansion of Page sections. Setting the Page section height with a Binding to a larger value than the default one may result in other unpredictable behavior. The height of the Page section must not depend on the data rendered on the page. The logic behind is that the Page Section height is estimated prior to evaluating the corresponding page data as the Reporting engine needs to calculate the available space on each page before rendering the data on it.

	>note If the contents of the Page Header or Footer grows beyond its boundaries, the contents are clipped. Any report item that doesn't fit entirely in the section is removed, i.e. not rendered at all.

* It is not possible to use [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) in this section.
* [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) in this section are evaluated against the report [Data Scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}) defined by the data source of the report after the data has been filtered. To work with data from the current page, only you have to use the [`PageExec`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}) function or the other Page functions with a specified scope.

### Table of Contents

The Table of Contents (TOC) section provides a set of navigational links to report items and displays the page numbers where they can be found. The user can click the TOC entries to navigate to the report page which displays that item.

The TOC section can be displayed before or after the Report Header or Report Footer section based on the user preferences. For more information, see [Table of Contents]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%}) overview article.

### Report Header

The Report Header section is printed just once, at the beginning of the report.

* If there is a Page Header on the first page, the Report Header will be rendered after it.
* If there is a TOC section, you may specify its position with respect to Report Header (for example, `Before` or `After`).

Use the report header for information that might normally appear on a cover page, such as a logo, a title, or a date. In the Report Header section, all data fields must be aggregated, even if the data source returns only one row. Typically, you must use the `FIRST()` function for character and date data and the `SUM()` function for numeric data. When you place a data-bound report item that uses an aggregate function in the report header, it is calculated for the entire report data.

### Group Header

The Group Header section is printed at the beginning of each new group of records. Use the group header to print the group name. For example, in a report that is grouped by product, use the group header to print the product name.

In the Group Header section, all data fields must be aggregated, even if the data source returns only one row. Typically, you must use the `FIRST()` function for character and date data, and the `SUM()` function for numeric data. When you place a data-bound report item that uses an aggregate function in the Group Header, it is calculated for the entire group data.

### Detail

The Detail section displays the detailed information and is printed once for every row in the data source. This is where you place the report items that constitute the main body of the report.

### Group Footer

The Group Footer section is printed at the end of each group of records. Use a group footer to print a summary of group information. Similar to the Group Header section, you must always use aggregate functions for the data-bound items that are calculated for the group data.

### Report Footer

The Report Footer section is printed just once, at the end of the report.

* If there is Page Footer on the last page, the Report Footer will be rendered before it.
* If there is a TOC section, you may specify its position with respect to Report Footer (for example, `Before` or `After`).

Use the report footer to print report totals or other summary information for the entire report. Similar to the Report Header section, you must always use aggregate functions for the data-bound items that are calculated for the entire report data.

### Page Footer

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
