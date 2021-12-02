---
title: How to Add/Remove Page Header & Footer Sections
page_title: How to Add/Remove Page Header & Footer Sections | for Telerik Reporting Documentation
description: How to Add/Remove Page Header & Footer Sections
slug: telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header-&-footer-sections
tags: how,to,add/remove,page,header,&,footer,sections
published: True
position: 2
---

# How to Add/Remove Page Header & Footer Sections



By default, every new report is created with a page header section and a page footer section.

* Any control you place in the page header section is rendered at the top of each page of the report's output.

* Any control you place in the page footer section is rendered at the bottom of each page of the report's output.

## To Add or Remove the Page Header/Footer Section

1. Right-click in the empty space around the sections.

1. Select __Page Header__  or __Page Footer__  .

  

  ![](images/ReportDesign001.png)

## Page Header/Footer Specifics

The size of page sections can be controlled with [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}). However, the inner items won't force the page sections            to grow. If a report item inside a page section grows beyond its parent size, the page section would not grow to accommodate it and the part that does not fit would be cut off.           Listed below are page section specific properties:         

*  __PrintOnFirstPage__  : Set to False to suppress the page section on the first page of the report.

*  __PrintOnLastPage__  : Set to False to suppress the page section on the last page of the report.

The PageHeader *PrintOnFirstPage*  has priority over its *PrintOnLastPage* . The opposite is valid for the PageFooter.           For that reason, when a report contains only one page, hence it is both the first and the last, for the PageHeader the *PrintOnFirstPage*  property           will be respected, and for PageFooter - the *PrintOnLastPage* .         

>caution Page sections are not related to the report itself, but are relative to the paper or             screen. Thus page sections of nested/detail reports are ignored and only the page sections of the main report             are visible.           


>caution [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) cannot be used in page sections, because the latter are processed             after the report data has been processed. At this moment the report data source is not available anymore.           


## Adding Calculated Page Totals to a Header or Footer

For some reports, it is useful to include a page-scoped aggregate in the page header or page footer of the report.           For example, a per-page sum total may be rendered if the page includes numeric values.         

For more information, please refer to the PageExec description in the [Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}) article.         

# See Also
 * [PageHeaderSection](/reporting/api/Telerik.Reporting.PageHeaderSection)  * [PageFooterSection](/reporting/api/Telerik.Reporting.PageFooterSection) 

 * [Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%})

 * [Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%})
