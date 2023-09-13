---
title: Scope
page_title: Expression/Data Scope Explained
description: "Learn what is Expression or Data Scope in Telerik Reporting and how you may determine it when designing reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-
tags: expression,scope,data,report,design
published: True
position: 1
previous_url: /expressions-scope
---

# Expression Scope

Expressions are evaluated against the data scopes. The data scopes are determined from the [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and groups in the report definition including: Report with Report groups and the Detail section, Table and Crosstab items with Table group and the Graph and Map items. That said, one expression is evaluated against the data set defined by its scope.

Data scopes are defined by the data items and groups. Data items contain all data from their data source and define the outermost scope. For example, the report item `Report1` defines the scope named `"Report1"` and contains all data filtered and ordered by the Filtering and Sorting criteria defined for the Report (if any). Data items can contain groups that partition the data by its grouping criteria into smaller sets and define the hierarchy of inner scopes. The detail groups or DetailSection define the innermost scope that contains a single data record from the corresponding data item.

The data items change the data scope. This means that all report items on the same report hierarchy level as the data item, including the latter, live in the scope of their parent. The data scope of the items within the data item is switched by the latter and is determined by the DataSource of the data item. This results in some data item specifics that you may observe on the surface of a data item:

	* The `Fields` [Global Object]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) represents the parent data scope when used with [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) and [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}). The inner fields of the data item DataSource cannot be accessed in them.
	* The [Filters property]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%}) recognizes as `Fields` the fields from the current data item DataSource. In this property you may access the parent data scope through the `ReportItem.DataObject` Global Object.

The report processor evaluates the expressions in a named scope or the default scope. The default scope depends on the report item property that the report processor is evaluating.

The rule used for resolving the default data scope is the following: Each expression is used in some property of a report item. The processor finds the nearest ancestor item defining a data scope. This scope is used for the expression evaluation.

A named scope can be the name of a data item, or a group. You must specify the current scope or a containing scope; you cannot specify a scope that is lower or at the same level in containment order than the current scope.

By default, all non-aggregating functions are usually evaluated in the default scope and operate over a single/detail item of the data source. If the current scope is a data item or a group then functions will be evaluated against the first item in the current set of data.

Aggregate functions always operate over the entire set of data defined by their scope. If the current scope is a detail section or a detail group, the calculations are performed over a single item of the data source.

>note You can set the scope of the expression evaluation by using the built-in `Exec` function.
