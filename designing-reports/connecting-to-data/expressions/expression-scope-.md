---
title: Expression Scope 
page_title: Expression Scope  | for Telerik Reporting Documentation
description: Expression Scope 
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-
tags: expression,scope,
published: True
position: 1
---

# Expression Scope 



Expressions are evaluated against the data scopes. Data scopes are 		determined from the data items and groups in the report definition 		including: Report with Report groups and the Detail section, 		Table and Crosstab items with Table group and the Chart item. That said 		one expression is evaluated against the data set defined by its scope.  		

Data scopes are defined by the data items and groups. Data items 		contain all data from their data source and define the outermost scope. 		For example the report item Report1 defines the scope named Report1 and 		contains all data filtered and ordered by the Filtering and Sorting 		criteria defined for the Report (if any). Data items can contain groups 		that partition the data by its grouping criteria into smaller sets and 		define the hierarchy of inner scopes. The detail groups or DetailSection 		define the innermost scope. 		

The report processor evaluates the expressions in a named scope or 		the default scope. The default scope depends on the report item property 		that the report processor is evaluating. 		

The rule used for resolving the default data scope is the following: 		Each expression is used in some property of a report item. The processor 		finds the nearest ancestor item defining a data scope. This scope is used 		for the expression evaluation.

A named scope can be the name of a data item, or a group. You must 		specify the current scope or a containing scope; you cannot specify a 		scope that is lower or at the same level in containment order than the 		current scope.

By default all non-aggregating functions are usually evaluated in 		the default scope and operate over a single/detail item of the data  		source. If the current scope is a data item or a group then functions 		will be evaluated against the first item in the current set of data. 		

Aggregate functions always operate over the entire set of data 		defined by their scope. If the current scope is a detail section or a 		detail group the calculations are performed over a single item of the 		data source. 		

You can set the scope of the expression evaluation by using the 		built-in __Exec__  function.

# See Also

