---
title: Aggregate Functions
page_title: Aggregate Functions at a Glance
description: "Find out what built-in Aggregate Functions are available in Telerik Reporting and how you may write expressions with them."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions
tags: aggregate,functions,report,expression
published: True
position: 1
previous_url: /expressions-aggregate-functions
reportingArea: General
---

# Aggregate Functions Overview

Aggregate functions perform a calculation on a set of multiple values and return a single value. All aggregate functions ignore null values.

To include aggregated values in your report, use the __Aggregates__ node in the __Edit Expression__ editor, which you can access in the Report Designer. You can specify a scope to identify which set of data to use for the calculation by using [data scope functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%}#data-scope-related-functions).

| Function | Description | Return Type |
| ------ | ------ | ------ |
| `AllDistinctValues(Expression, IncludeNullValues)` |Returns an array of all distinct values from the specified expression. The optional *IncludeNullValues* parameter determines if Null values<br/> should be included in the aggregation. By default Null values are included.|Returns an array of type `Object []`.|
| `AllValues(Expression, IncludeNullValues)` |Returns an array of all values from the specified expression. The optional *IncludeNullValues* parameter determines if Null values<br/> should be included in the aggregation. By default Null values are included.|Returns an array of type `Object []`.|
| `Avg(Expression)` |Returns the average of all non-null values from the specified expression.|The return type is determined by the type of the evaluated result of the expression.|
| `Count(Expression)` |Returns a count of the non-null values from the specified expression.|Returns an `Integer`.|
| `CountDistinct(Expression)` |Returns a count of the distinct values from the specified expression.|Returns an `Integer`.|
| `First(Expression)` |Returns the first value from the specified expression.|Determined by the type of expression.|
| `Last(Expression)` |Returns the last value from the specified expression.|Determined by the type of expression.|
| `Max(Expression)` |Returns the maximum value from all non-null values <br/> of the specified expression.|Determined by the type of expression.|
| `Min(Expression)` |Returns the minimum value from all non-null values <br/> of the specified expression.|Determined by the type of the expression.|
| `StDev(Expression)` |Estimates standard deviation based on a sample. The standard deviation is a measure of how widely values are dispersed <br/> from the average value (the mean). Null values are ignored.|Returns `float`.|
| `StDevP(Expression)` |Calculates standard deviation based on the entire population. The standard deviation is a measure of how widely values are<br/> dispersed from the average value (the mean). Null values are ignored.|Returns `float`.|
| `Sum(Expression)` |Returns a sum of the values of the specified expression.|Returns the summation of all expression values based on the data type of the __first__ expression value.|
| `Var(Expression)` |Estimates variance based on a sample. Null values are ignored.|Returns `float`.|
| `VarP(Expression)` |Calculates variance based on the entire population. Null values are ignored.|Returns `float`|

## See Also

* [Apply custom logic with user aggregate functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
