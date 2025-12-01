---
title: Custom Aggregate Functions
page_title: Creating and Utilizing Custom User Aggregate Functions 
description: "Learn how to create, embed and use custom User Aggregate Functions in expressions in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions
tags: user,aggregate,functions,expressions,create,report
published: True
position: 2
previous_url: /expressions-user-aggregate-functions
reportingArea: General
---

# Custom User Aggregate Functions

User aggregate functions allow you to apply custom logic when accumulating values over a set of rows from the data source. They are used by the Telerik Reporting engine as all built-in aggregate functions.

## Implementing a custom aggregate function

User aggregates are __public__ or __internal__ (__Public__ or __Friend__ in VB.NET) classes that implement the [IAggregateFunction](/api/Telerik.Reporting.Expressions.IAggregateFunction) interface.

Aggregate function implementation accumulates values from each row using the __Accumulate__ method. The aggregate can take an arbitrary number of input parameters and will receive them as items in the object array parameter passed in this method.

The function merges its value with other instances of the aggregate using the __Merge__ method. For example if you implement __SUM__ aggregate and merge an instance of the aggregate with current accumulated value of __4+5=9__ within the current aggregate instance with accumulated value of __1+2+3=6__ the result should be __15__.

The function returns value using the __GetValue__ method.

Apply [AggregateFunctionAttribute](/api/Telerik.Reporting.Expressions.AggregateFunctionAttribute) to the custom aggregate class implementation to define an interface for the users of the aggregate function. The __Name__ parameter of the attribute defines how to refer to the function in expressions.

## Example

{{source=CodeSnippets\CS\API\Telerik\Reporting\Expressions\IAggregateFunctionSnippets.cs region=AggregateFunctionImplementation}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Expressions\IAggregateFunctionSnippets.vb region=AggregateFunctionImplementation}}

## Invoking a Custom Aggregate Function

You can use a custom aggregate within expressions the same way you invoke an built-in aggregate function:

`=Concatenate(Fields.ProductName)`

## Extending Reporting Engine with User Functions

If your custom aggregate functions are linked from an external assembly, in order the Standalone designer to recognize them, you will have to [extend the configuration of the start application]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}). To run the report in other project use the same approach - add the assembly to the root folder from where the application is executed and configure it to load the external assembly by extending the configuration.

> Custom aggregates are not supported when you preview the report in Visual Studio. To see the aggregate output, use a __ReportViewer__ control.
