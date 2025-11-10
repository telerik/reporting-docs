---
title: Multivalue Parameters
page_title: Multivalue Parameters Explained
description: "Learn what is a Multivalue Parameter in Telerik Reporting and how you may configure and use it in SQL queries and inside report."
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters
tags: using,multivalue,parameters
published: True
position: 4
previous_url: /designing-reports-parameters-using-multivalue-parameter
reportingArea: General
---

# Using Multivalue Parameters

A multivalue parameter allows the user to select more than one value for the parameter from a list of available values. When you define a list of available values for a multivalue parameter, a `<select all>` option is automatically added to the list of values in the report parameter editor. You can use this option to select and clear all values in the list. The expression for a multivalue parameter does not differ from the expression for a single value parameter i.e., the expression begins with the __Parameters__ keyword. For example, a parameter named __VendorSelect__ appears as __Parameters.VendorSelect.Value__ in the expression editor. For more information, see [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%}).

To specify that a report parameter would accept multiple values, set the `MultiValue` property of the parameter to True. You can set any parameter type to multivalue except Boolean. The primary use of multivalue parameters is to allow for query restriction clauses based on a set of values.

## Writing Queries for Multivalue Report Parameters

If you want to pass multiple parameter values back to a data source by using a query, the following requirements must be satisfied:

* The data source must be supported. For a list see [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})
* The data source cannot be a stored procedure. __Telerik Reporting__ does not support passing a multivalue parameter array to a
 stored procedure.
* Use an IN clause in the query to specify the parameter.

The [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) are based on __ADO.NET__ and __ADO.NET__ does not allow a collection of values to be passed. The [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) however supports parametrized SQL queries by associating the report parameters with placeholders in the `SelectCommand` query. Parameter values can be evaluated with any expression which conforms to the common expression syntax supported by the reporting engine. This grants a great deal of flexibility to how the SQL queries are supplied with parameters.

The example below shows the use of the IN keyword in the WHERE clause of a T-SQL statement. For more information about the IN keyword or the results returned by this query, see [IN (Transact-SQL)](https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2005/ms177682(v=sql.90)).

````SQL
SELECT ProductID, Name, Color
FROM Production.Product
WHERE ProductID IN (@ProductID)
````

To test the approach in a report, add [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) using this query. Create a new report parameter and set it as the value for the _@ProductID__ data source parameter. Set its `MultiValue` and `Visible` properties to True, and its `Type` property to Integer. Using the `AvailableValues` properties, configure the DataSource for the parameter to a new [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) with the following query:

````SQL
SELECT ProductID, Name
FROM Production.Product
````

Set the `ValueMember` property to `= Fields.ProductID` and the `DisplayMember` property to `= Fields.Name`. Run the report and select different values for the report parameter in order to show a particular selection of data rows based on the selected report parameter values.

>note The report engine rewrites queries for data sources that cannot process parameters as an array. The rewrite logic is triggered when a parameter is defined as multivalue and the database query uses an IN statement to specify the parameter.

## Specifying Default Values for a MultiValue Parameter

It is possible to specify default values for a multivalue parameter using the parameter's `Value` property. The default values can be set to one of the following options:

* `Blank` - when the parameter's `Value` property is left blank none of the available parameter values will be selected at run-time.
* `Single value` - the specified value will be selected at run-time. The data type must match the data type of the parameter. The specified value should match the value from the `AvailableValues.ValueMember` expression for one of the records in the `AvailableValues.DataSource`. Otherwise none of the available parameter values will be selected at run-time.
* `Multiple values` - in order to have multiple values selected, you should set the `Value` property of the parameter to an [IEnumerable](https://learn.microsoft.com/en-us/dotnet/api/system.collections.ienumerable?view=net-7.0) instance containing the desired values. This can be achieved with the help of the __[Array(args)]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/utility-functions%})__ built-in function which returns an [Array](https://learn.microsoft.com/en-us/dotnet/api/system.array?view=net-7.0) of the passed object instances.

Note that the parameter `Value` expression is evaluated against the data retrieved from the `AvailableValues.DataSource` . This allows you to use the result of an aggregate function as the parameter's default value e.g., =First(Fields.ProductID). This approach can also be used to specify all of the available values as default values e.g., `=AllValues(Fields.ProductID)`.

## See Also

* [User Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
