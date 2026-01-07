---
title: Grouping, Filtering and Sorting
page_title: Expressions in Grouping, Filtering and Sorting at a Glance
description: "Learn more about using Expressions when Grouping, Filtering and Sorting the data in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/grouping,-filtering-and-sorting
tags: grouping,,filtering,and,sorting
published: True
position: 5
previous_url: /expressions-grouping-filtering-sorting, /designing-reports/connecting-to-data/expressions/using-expressions/grouping%2c-filtering-and-sorting
reportingArea: General
---

# Grouping, Filtering and Sorting with Expressions

Another usage of expressions is the Grouping, Filtering, and Sorting criteria.

It is important to understand that these operations perform comparison/combination between the results of the evaluation of the used expression. These are valid only between items of the same data type. If the data types do not match, you must explicitly convert the data type that the expression evaluates to by using [conversion functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/conversion-functions%}) Here are the cases when you need to use conversion:

* Writing filter expressions that compare values of different data types.
* Writing sort expressions that combine fields of different data types.
* Writing group expressions that combine fields of different data types.
* Converting a value retrieved from the data source from one data type to a different data type.

## See Also

* [Grouping Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%})
* [Ordering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%})
* [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%})
