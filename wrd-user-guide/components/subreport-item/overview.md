---
title: Overview
page_title: SubReport - Overview
description: Learn how to use SubReports in the Web Report Designer to embed reports within other reports for creating master-detail hierarchies and reusable report components.
slug: web-report-designer-user-guide-components-subreport
tags: web, report, design, components, subreport, hierarchy, master, detail
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 0
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# SubReport

A SubReport is a report component that allows you to create:

* [Reusable components]({%slug creating-reusable-headers-and-footers%})&mdash;Create shared headers, footers, or report sections that can be used across multiple reports.

* Complex layouts&mdash;Combine different data sources and report structures within a single report. Embed one report inside another report. This lets you create complex report layouts. 

* Hierarchical data presentations&mdash;Visualize various relationships scenarios depending on the data organization and design requirements:

    * [Master-detail with a pair of related plain data sets]({%slug web-report-designer-user-guide-creating-master-detail-report%})&mdash;Display related data in a parent-child format (for example, categories and their products). The master report with categories passes a report parameter (CategoryID) to the child report with products to filter the relevant hierarchical data.

    * [Master-detail with a single hierarchical (nested) data set]({%slug wrd-user-guide-create-nested-hierarchy-with-subreport%})&mdash;Show nested data relationships with proper hierarchical structure, grouping and organization (for example, categories as a root level and child products for the respective category). The Web Report Designer offers binding to hierarchical data using the **DataSource** property of the **SubReport** item (instead of passing a report parameter). This method is cleaner when your detail report uses report bands (sections) to represent the rows of data, not a data bound Table or Graph item for example.

    * [Recursive hierarchical data presentation]({%slug wrd-user-guide-create-org-hierarchy-with-subreport%})&mdash;Organization Structure presentation. Use recursive SubReports and a self-referencing flat data source with relation between the individual rows. The hierarchy is achieved by having the main report reference itself as a SubReport, passing a parameter that filters child records based on the parent’s ID.

SubReports act as containers that automatically adjust their size based on the content of the embedded report.

## Prerequisites

Before working with SubReports, ensure you have:

* Created and configured [data sources]({%slug web-report-designer-user-guide-components-data-sources%}) for both master and child reports.
* Planned your data relationships and report hierarchy.

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%})
