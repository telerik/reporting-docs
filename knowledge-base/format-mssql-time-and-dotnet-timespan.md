---
title: How to Format MS SQL Time Data Type and .NET TimeSpan Object
description: How to apply proper string formatting to MS SQL Time fields and .NET TimeSpan objects
type: how-to
page_title: MS SQL Time and .NET TimeSpan Formatting
slug: format-mssql-time-and-dotnet-timespan
position: 
tags: 
ticketid: 1463853
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
If you try to format an MS SQL [Time](https://docs.microsoft.com/en-us/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver15)
data type with the [standard](https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings)
or [custom](https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings) 
_DateTime_ format strings, the layout may be incorrect, or there may be an error like:
```
An error has occurred while processing TextBox 'textBox13':
An error has occurred while executing function FormatWithCulture(). Check the InnerException for more information.
------------- InnerException -------------
Exception has been thrown by the target of an invocation.
------------- InnerException -------------
Input string was not in a correct format.
```

## Solution
The _Time_ MS SQL data type is converted to 
[TimeSpan](https://docs.microsoft.com/en-us/dotnet/api/system.timespan?view=netframework-4.8) .NET type 
by the corresponding ADO.NET providers. For that reason, you need to use the 
[TimeSpan formatting](https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-timespan-format-strings). 
For example, for a _short time_ consider __{0:hh\\:mm}__ and for a _long time_ you may use __{0:g}__. 
It is not possible to use formatting with 'AM' and 'PM', as the _TimeSpan_ structure represents a time difference.
