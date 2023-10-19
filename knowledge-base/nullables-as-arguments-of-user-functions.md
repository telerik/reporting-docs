---
title: Nullables as ObjectDataSource Parameters or User Function Arguments
description: "Learn how to use nullable values as arguments of user functions or ObjectDataSource parameters in Telerik Reporting."
type: how-to
page_title: Pass nullable values as Custom User Function arguments of ObjectDataSource parameters
slug: nullables-as-arguments-of-user-functions
tags: nullable,parameter,argument,user,function,objectdatasource,telerik,reporting
ticketid: 1627744
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

I need to pass nullable values from Telerik Report to my custom code invoked in runtime.

## Solution

[Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) support nullables through the property [AllowNull](/api/telerik.reporting.reportparameter#Telerik_Reporting_ReportParameter_AllowNull). You need to mark it as `True` (the default is `False`).

Importantly, the __Integer__ Report Parameters are actually of type `long` ([System.Int64](https://learn.microsoft.com/en-us/dotnet/api/system.int64?view=net-7.0)) - [Enum ReportParameterType](/api/telerik.reporting.reportparametertype). Hence, if you pass a nullable Integer Report Parameter value to a method, it should accept argument of type `long?`. If the methods accepts an `int` there will be an error.

The same is valid for the `Float` Report Parameters that are actually cast to `double`.

You may also call a method that accepts an object rather than nullable and performs cast inside. Here is a sample code illustrating the approach:

````CSharp
public ReturnType ReportMethod(string StrParam, object NullableIntParam)
{
	int? castNullableIntParam = (int?)NullableIntParam;

	return OriginalMethod(StrParam, castNullableIntParam);
}

private ReturnType OriginalMethod(string StrParam, int? NullableIntParam)
{
	//The original implementation
}
````



## See Also

* [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})
* [Enum ReportParameterType](/api/telerik.reporting.reportparametertype)
