---
title: Aggregate Functions
page_title: Aggregate Functions at a Glance
description: "Learn which built-in aggregate functions Telerik Reporting provides and how to use them in report expressions across data scopes."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions
tags: aggregate,functions,report,expression
published: True
position: 1
previous_url: /expressions-aggregate-functions
reportingArea: General
components: [general]
---

# Aggregate Functions

Aggregate functions calculate a result from multiple values. Most aggregate functions ignore `null` values. `AllValues` and `AllDistinctValues` include `null` values by default and let you exclude them with `IncludeNullValues`.

To include an aggregate value in your report, use the **Aggregates** node in the **Edit Expression** editor in Report Designer. For example, `=Sum(Fields.OrderTotal)` calculates a total in the current data scope. Use [data scope functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions#data-scope-related-functions) to calculate a value over a different scope.

| Function | Description | Return Type |
| ------ | ------ | ------ |
| `AllDistinctValues(Expression, IncludeNullValues)` | Returns an array of all distinct values from the specified expression. The optional `IncludeNullValues` parameter determines whether `null` values are included. By default, `null` values are included. | Returns an array of type `Object[]`. |
| `AllValues(Expression, IncludeNullValues)` | Returns an array of all values from the specified expression. The optional `IncludeNullValues` parameter determines whether `null` values are included. By default, `null` values are included. | Returns an array of type `Object[]`. |
| `Avg(Expression)` | Returns the average of all non-null values from the specified expression. | The return type is determined by the type of the evaluated result of the expression. |
| `Count(Expression)` | Returns a count of the non-null values from the specified expression. | Returns an `Integer`. |
| `CountDistinct(Expression)` | Returns a count of the distinct values from the specified expression. | Returns an `Integer`. |
| `First(Expression)` | Returns the first value from the specified expression. | Determined by the type of expression. |
| `Last(Expression)` | Returns the last value from the specified expression. | Determined by the type of expression. |
| `Max(Expression)` | Returns the maximum value from all non-null values of the specified expression. | Determined by the type of expression. |
| `Min(Expression)` | Returns the minimum value from all non-null values of the specified expression. | Determined by the type of the expression. |
| `StDev(Expression)` | Estimates standard deviation based on a sample. The standard deviation measures how widely values are dispersed from the average value (the mean). `null` values are ignored. | Returns `float`. |
| `StDevP(Expression)` | Calculates standard deviation based on the entire population. The standard deviation measures how widely values are dispersed from the average value (the mean). `null` values are ignored. | Returns `float`. |
| `Sum(Expression)` | Returns a sum of the values of the specified expression. | Returns the summation of all expression values based on the data type of the **first** expression value. |
| `Var(Expression)` | Estimates variance based on a sample. `null` values are ignored. | Returns `float`. |
| `VarP(Expression)` | Calculates variance based on the entire population. `null` values are ignored. | Returns `float`. |

## See Also

* [Apply custom logic with user aggregate functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions)
* [Review the built-in function categories](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview)
* [Understand expression scope for aggregate calculations](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope)
