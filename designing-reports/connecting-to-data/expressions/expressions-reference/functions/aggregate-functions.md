---
title: Aggregate Functions
page_title: Aggregate Functions at a Glance
description: "Learn which built-in aggregate functions Telerik Reporting supports, how they calculate values, and how to use data scopes in report expressions."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions
tags: aggregate,functions,report,expression
published: True
position: 1
previous_url: /expressions-aggregate-functions
reportingArea: General
components: [general]
---

# Aggregate Functions Overview

Aggregate functions calculate a result from multiple values and return a single value. Most aggregate functions ignore null values. `AllDistinctValues` and `AllValues` include null values by default. Use the `IncludeNullValues` parameter to control this behavior.

To include aggregated values in your report, use the **Aggregates** node in the **Edit Expression** editor in the Report Designer. Specify a scope to identify which set of data to use for the calculation by using [data scope functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions#data-scope-related-functions).

| Function | Description | Return Type |
| --- | --- | --- |
| `AllDistinctValues(Expression, IncludeNullValues)` | Returns an array of all distinct values from the specified expression. The optional `IncludeNullValues` parameter determines whether null values are included. Null values are included by default. | Returns an array of type `Object []`. |
| `AllValues(Expression, IncludeNullValues)` | Returns an array of all values from the specified expression. The optional `IncludeNullValues` parameter determines whether null values are included. Null values are included by default. | Returns an array of type `Object []`. |
| `Avg(Expression)` | Returns the average of all non-null values from the specified expression. | The return type is determined by the type of the evaluated result of the expression. |
| `Count(Expression)` | Returns a count of the non-null values from the specified expression. | Returns an `Integer`. |
| `CountDistinct(Expression)` | Returns a count of the distinct values from the specified expression. | Returns an `Integer`. |
| `First(Expression)` | Returns the first value from the specified expression. | Determined by the type of the expression. |
| `Last(Expression)` | Returns the last value from the specified expression. | Determined by the type of the expression. |
| `Max(Expression)` | Returns the maximum value from all non-null values of the specified expression. | Determined by the type of the expression. |
| `Min(Expression)` | Returns the minimum value from all non-null values of the specified expression. | Determined by the type of the expression. |
| `StDev(Expression)` | Estimates standard deviation based on a sample. Standard deviation measures how widely values are dispersed from the average value (the mean). Null values are ignored. | Returns `float`. |
| `StDevP(Expression)` | Calculates standard deviation based on the entire population. Standard deviation measures how widely values are dispersed from the average value (the mean). Null values are ignored. | Returns `float`. |
| `Sum(Expression)` | Returns a sum of the values of the specified expression. | Returns the summation of all expression values based on the data type of the **first** expression value. |
| `Var(Expression)` | Estimates variance based on a sample. Null values are ignored. | Returns `float`. |
| `VarP(Expression)` | Calculates variance based on the entire population. Null values are ignored. | Returns `float`. |

## See Also

* [Apply custom logic with user aggregate functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions)
