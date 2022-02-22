---
title: Data Functions
page_title: Data Functions 
description: Data Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions
tags: data,functions
published: True
position: 5
---
<style>
table th:first-of-type {
    width: 25%;
}
table th:nth-of-type(2) {
    width: 75%;
}
</style>

# Data Functions

## Data scope related functions

* __Exec(scope, expression)__ - executes the specified expression in the given parent [data scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}). Used with aggregate expressions as a second parameter; this function allows changing of the data scope in which the expression is evaluated. Scope parameter is the name of the parent (one or more levels up the hierarchy) data scope relative to the current data scope we need to evaluate the expression against. For example the expression =Fields.LineTotal / Exec('Report1', Sum(Fields.LineTotal))used in detail section will return the LineTotal amount as percentage from the whole report.             

* __Exec(scopeByColumns, scopeByRows, expression)__ - executes the specified expression in the context of the referenced body scope. A body scope is determined from the cross-section of a rows and columns axes data scope. Both specified scopes should be parent scopes relative to the current body scope. The function is applicable only from an item located in a body data scope. Used mostly with aggregate expressions as a third parameter; For example the expression =Sum(Fields.LineTotal) / Exec('Year', 'Category', Sum(Fields.LineTotal))used in the body section of a crosstab will return the LineTotal value accumulated for the current scope as percentage from the LineTotal value accumulated for the whole current year for the current category.             

* __Previous(scope, expression)__ - executes the specified expression in the context of the previous data member relative to the referenced scope by rows or by columns. If the scope parameter is omitted, the expression gets executed in the context of the previous data member relative to the current data member. In that case, the current data scope cannot be a body scope (a body scope is determined from the cross-section of a rows and columns axes data scope). For example the expression =Previous('Year', Sum(Fields.LineTotal))used in the body of a crosstab will return the LineTotal value accumulated for the whole previous year.             

* __RunningValue(scope, aggregateFunction)__ - the value for __RunningValue__  resets to 0 for each new instance of the specified parent scope. If a group is specified, the running value is reset when the group expression changes. If a data item is specified, the running value is reset for each new instance of the data item. Restrictions for __RunningValue__  are determined by the aggregate function specified in the function parameter. __RunningValue__ cannot be used in a filter or sort expression.             

* __IsMergedData()__ - determines if the current data context is of a merged data point. Returns a boolean. Can be used when applying conditional formatting to the merged data point of the Graph item. Example of a filter expression that determines if the data point is of a merged data: = IsMergedData() | Operator.Equals | = TrueFor additional information, check [Merging Small Slices on a Pie Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}) section.           

The set of data specified in the expression must have the same data type. To convert data that has multiple numeric data types to the same data type, use conversion functions like CInt, CDbl, etc.         

## Report sections / table rows(columns) running count

These functions return a running count of the current data scope occurrences within the current instance of the specified data scope in the function parameter. For example, if the expression =RowNumber("Year") is used within the scope of group "Month" that has a parent group "Year", the expression will eval to 1, 2, 3,.., 12 for each instance of the "Month" data scope inside the current particular year, and for the next year instance will be reset to 1, 2, 3,... Effectively, the counter gets reset for each subsequent instance of the specified scope. When omitted, the parent data scope is used as default.         

To get a running count in a parent group's occurrences, the function should be combined with Exec function usage. For example, in the setup above, the expression =Exec("Year", RowNumber("DataItemName")) used in the "Month" scope will get evaluated to 1, 1, 1,.., 1 for all 12 occurrences of the "Month" scope inside the first instance of the "Year" scope and then to 2, 2, 2... for the second occurrence of the "Year" data scope.         

| Function | Description |
| ------ | ------ |
| __RowNumber(scope)__ |Returns a running count of all rows inside the current instance of the specified parameter scope.|
| __ColumnNumber(scope)__ |Returns a running count of all columns inside the current instance of the specified parameter scope|

>note Data scope functions cannot be nested.
>Data scope functions are evaluated on-demand. This means that in some cases (using  __RowNumber()__  /  __ColumnNumber()__ functions) their results might vary according to the order of report actions execution.           

