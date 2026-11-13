---
title: Report Structure
page_title: Report Structure - Web Report Designer User Guide
description: "Learn how sections, report items, groups, and tables of contents structure reports and organize content in the Telerik Web Report Designer."
slug: user-guide/report-structure
tags: telerik, reporting, report, structure, groups, sections, items
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
components: [wrdhtml5, wrdblazorwrapper, general]
position: 10
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# Report Structure

Each report consists of sections that divide the report vertically and [report items](#report-items) that you place in each section. A report section represents a specific area on the report page. It defines which items you can place there and how they appear.

![Report Sections - Web Report Designer User Guide - Telerik Reporting ><](./images/wrd-report-sections-callouts.png)

By default, every new report you create has three sections:

* [Page Header](#page-header)
* [Page Footer](#page-footer)
* [Detail section](#detail-section) (the main content area of the report)

In addition to the default sections above, you can also add:

* [Table of Contents (TOC)](#table-of-contents)
* [Report Header](#report-header)
* [Report Footer](#report-footer)
* [Report Groups](#report-groups)
* [Group Header](#group-header)
* [Group Footer](#group-footer)

## Page Header

The Page Header section is printed at the top of every page. Use it to repeat content, such as the report title, on every page of a multipage report.

> note The Page Header can display only the content that fits within the boundaries of the section. Any report item that does not fit entirely in the section is not rendered.

## Page Footer

The Page Footer section appears at the bottom of every page. Use it to print page numbers or page-specific information. You can hide the Page Footer on selected pages, such as all even pages or the first and last page. Hiding this section frees page space for the rest of the report content.

## Detail Section

The Detail section is where you place the report items that constitute the main body of the report. This section displays detailed information and is printed once for every row in the report data source. If the report has no data source, the Detail section is static and renders once, even when a table or chart item has its own data source.

## Report Items

[Report items](slug:user-guide/components/report-items) are the individual elements or components that make up a report. They display various types of report data, such as barcodes, charts, tables, and so on. A sales report, for example, may contain the following items:

* Text boxes displaying the report title, date, and other descriptive information.
* Images representing the company logo or brands.
* Charts showing sales data, such as product sales by region.

## Table of Contents

The Table of Contents (TOC) is a list that contains links to the report items along with their page numbers. When a user clicks a link in the TOC, the report opens the page that contains the specified report item. You can display the TOC before or after the Report Header or Report Footer.

For a sample report with a TOC, see the [Product Catalog Report Demo](https://demos.telerik.com/reporting/product-catalog).

## Report Header

Use the report header to place information typical for a cover page, such as logos, titles, or dates. The Report Header section is printed once, at the beginning of the report:

* If you place a Page Header on the first page, the Report Header will appear after it.
* If the report has a TOC section, you can place it before or after the Report Header.

## Report Footer

Use the report footer to print report totals or other summary information for the entire report. The Report Footer section is printed once at the end of the report:

* If you place a Page Footer on the last page, the Report Footer will appear before it.
* If the report has a TOC section, you can place it before or after the Report Footer.

## Report Groups

Report groups allow you to visually separate logically related datasets. Use group header and footer sections to show group boundaries and display introductory and summary information. For example, use report groups to represent detailed sales data for each region. The group header can contain the region name, and the footer can contain the total number of sales for that region.

## Group Header

The Group Header section is printed at the beginning of each new group of records. Use the group header to print the group name. For example, in a report that is grouped by product, use the group header to print the product name.

## Group Footer

The Group Footer section is printed at the end of each group of records. Use a group footer to print a summary related to the group.

## Next Steps

* [Create Your First Report](slug:web-report-designer-user-guide-getting-started)
* [Explore the Report Components](slug:web-report-designer-user-guide-components)
* [Connect Your Report to Data](slug:web-report-designer-user-guide-components-data-sources)
