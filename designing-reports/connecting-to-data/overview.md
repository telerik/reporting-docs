---
title: Connecting to Data Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/connecting-to-data/overview
tags: overview
published: True
position: 0
---

# Connecting to Data Overview



The topics in this section describe how to connect Telerik Reports to a data source, as well as         how to filter, order and group the data. Last but not least, you can also check how to create expressions         that when evaluated at runtime will customize the content and appearance of your reports.       

## Data Source Components

* Data Source components are used to connect [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) to different               types of data without writing any code.             

* Most of the Data Source components allow working with data source parameters which are used to filter the data on retrieval.               Data source parameters can be mapped to report parameters, data fields or to the result of the expression.             

* Data source components allow adding calculated fields in order to create new values that do not exist in the data source.             

For more details see topics in [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) section.         

## Data Items

* Data items are used to visualize the data in reports.             

* The data can be:             

   + [Filtered]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%});                 

   + [Ordered]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%});                 

   + [Grouped]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%}).                 

* The most straightforward approach for connecting a data item to data is to set data item's __DataSource__  property to a Data Source component.             

* In master-detail scenarios, the data item can be connected to the parent's data as well.             

For more details see topics in [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) section.         

## Expressions

* Expressions are widely used while designing reports in order to manipulate report's data, style and behavior. When the report runs,               the report processor evaluates the expressions using built-in scripting language and substitutes the property values where expressions were used               with the result of the expression.             

* There are built-in functions which allow to perform complex calculations in expressions. Users confident with any of the .NET languages               can extend the expression engine in order to use custom functions in their reports.             

* Examples of expression usage: grouping, sorting, filtering operations, properties of the report and report items(sections), bindings,               conditional formatting, report parameters etc.             

For more details see topics in [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) section.         

## Report Parameters

* The most common usage of report parameters is in the data-retrieval method which is one of the ways to improve the report's performance.             

* Referencing report parameters inside expressions can be achieved with __Parameters__  global object which at runtme will be               replaced with the actual value of report parameter.             

* Examples of report parameters usage: in properties of the report or report items(sections), grouping, sorting, filtering operations etc.             

For more details see topics in [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) section.         
