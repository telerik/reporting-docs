---
title: Overview
page_title: Ordering Data at a Glance
description: "Learn how to order the data in Telerik Reporting at the data item and group level through the Sorting collections."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview
tags: overview,ordering,sorting,data,item,group
published: True
position: 0
previous_url: /data-items-ordering-data, /designing-reports/connecting-to-data/data-items/ordering-data/
reportingArea: General
---

# Ordering Data Overview

In Telerik Reporting data items can order the data they are bound to by taking advantage of the sorting capabilities of the Telerik Reporting engine.

Sorting can be performed at the data item and group level through the __Sorting__ collections. Sorting for groups controls the order of grouping data, not the detail data. Group level sorting occurs before the sorting for the report as a whole.

You specify the sorting criteria by adding [Telerik.Reporting.Sorting](/api/Telerik.Reporting.Sorting) objects to the data items' or groups' Sorting collections. Each sorting is made up of an Expression and a Direction:

* Expression can be a single data field or a combination of multiple expressions. See[Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}).
* Direction can be either "Asc" (ascending) or "Desc" (descending).

Data items and groups may contain one or more Sortings that are combined at runtime and applied together to the data.

Sorting criteria is defined through the [Edit Sorting Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-sorting-dialog%}).

Depending on where the Sorting is applied – to a data item or a group – it may produce different results:

* A sorting applied to a data item sets the order of the detail data thus resulting on the order of appearance of the detail rows (including the DetailSection and detail groups). As the First and Last aggregate functions depend on the order of the data they operate with, they may return different values depending on the data items’ sorting.
* A sorting applied to a group sets the order of the members of this group thus resulting on the order of appearance of the rows/columns depending on if this is a row or column group.
