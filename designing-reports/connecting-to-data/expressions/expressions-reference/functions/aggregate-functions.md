---
title: Aggregate Functions
page_title: Aggregate Functions | for Telerik Reporting Documentation
description: Aggregate Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions
tags: aggregate,functions
published: True
position: 1
---

# Aggregate Functions



## 

Aggregate functions perform a calculation on a set of multiple values and return a single value. All aggregate           functions ignore null values.         

To include aggregated values in your report, use the __Aggregates__  node in the __Edit Expression__  editor,            which you can access in the Report Designer.            You can specify a scope to identify which set of data to use for the calculation by            using [data            scope functions](3c53d216-23db-4749-8671-c7027d4daf1c#datascopefunctions).         


| Function | Description | Return Type |
| ------ | ------ | ------ |
| __AllDistinctValues(Expression, IncludeNullValues)__ |Returns an array of all distinct values from the specified expression. The optional *IncludeNullValues* parameter determines if Null values<br/>      should be included in the aggregation. By default Null values are included.|Returns an array of type Object [].|
| __AllValues(Expression, IncludeNullValues)__ |Returns an array of all values from the specified expression. The optional *IncludeNullValues* parameter determines if Null values<br/>      should be included in the aggregation. By default Null values are included.|Returns an array of type Object [].|
| __Avg(Expression)__ |Returns the average of all non-null values from the specified expression.|The return type is determined by the type of the evaluated result of expression.|
| __Count(Expression)__ |Returns a count of the non-null values from the specified expression.|Returns an Integer.|
| __CountDistinct(Expression)__ |Returns a count of the distinct values from the specified expression.|Returns an Integer.|
| __First(Expression)__ |Returns the first value from the specified expression.|Determined by the type of expression.|
| __Last(Expression)__ |Returns the last value from the specified expression.|Determined by the type of expression.|
| __Max(Expression)__ |Returns the maximum value from all non-null values <br/>  of the specified expression.|Determined by the type of expression.|
| __Min(Expression)__ |Returns the minimum value from all non-null values <br/>  of the specified expression.|Determined by the type of the expression.|
| __StDev(Expression)__ |Estimates standard deviation based on a sample. The standard deviation is a measure of how widely values are dispersed <br/>  	from the average value (the mean). Null values are ignored.|Returns float.|
| __StDevP(Expression)__ |Calculates standard deviation based on the entire population. The standard deviation is a measure of how widely values are<br/>  	dispersed from the average value (the mean). Null values are ignored.|Returns float.|
| __Sum(Expression)__ |Returns a sum of the values of the specified expression.|Returns the summation of all expression values in the most precise expression data type.|
| __Var(Expression)__ |Estimates variance based on a sample. Null values are ignored.|Returns float.|
| __VarP(Expression)__ |Calculates variance based on the entire population. Null values are ignored.|Returns float|




# See Also


# See Also

 * [How to create custom aggregate functions](https://www.telerik.com/support/kb/reporting/styling-and-formatting-reports/details/implementing-custom-aggregate-functions-)

 * [Apply custom logic with user aggregate functions ]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
