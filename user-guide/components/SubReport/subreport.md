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

A SubReport is a report component that allows you to embed one report inside another report. This lets you create complex report layouts, display hierarchical data relationships, and build reusable report components that can be shared across multiple reports.

SubReports act as containers that automatically adjust their size based on the content of the embedded report. You can use SubReports to create:

* [Master-detail relationships]({%slug web-report-designer-user-guide-creating-master-detail-report%})&mdash;Display related data in a parent-child format (for example, customers and their orders).
* Reusable components&mdash;Create shared headers, footers, or report sections that can be used across multiple reports.
* Complex layouts&mdash;Combine different data sources and report structures within a single report.
* [Hierarchical data]({%slug wrd-user-guide-create-nested-hierarchy-with-subreport%})&mdash;Show nested data relationships with proper grouping and organization.
* [Organization Structure]({%slug wrd-user-guide-create-org-hierarchy-with-subreport%})&mdash;Use recursive SubReports and a self-referencing flat data source. The hierarchy is achieved by having the main report reference itself as a SubReport, passing a parameter that filters child records based on the parent’s ID.

## Prerequisites

Before working with SubReports, ensure you have:

* Created and configured [data sources]({%slug web-report-designer-user-guide-components-data-sources%}) for both master and child reports.
* Planned your data relationships and report hierarchy.

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%})
