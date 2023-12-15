---
title: Cannot Write DateTime with Kind=Unspecified to PostgreSQL
description: "Using DateTime Report Parameters in expressions leads to errors when using the Npgsql data provider with version 6.0 or higher"
type: troubleshooting
page_title: DateTime Parameters throw errors when using Npgsql data provider
slug: cannot-write-datetime-with-kind-unspecified-postgresql
tags: npgsql, postgresql
ticketid: 1603919
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Data Source Component</td>
			<td>SqlDataSource</td>
		</tr>
		<tr>
			<td>Data Provider</td>
			<td>Npgsql 6+</td>
		</tr>
	</tbody>
</table>


## Description

I have a PostgreSQL database and I am using the [Npgsql](https://www.npgsql.org/) data provider to connect to said database. I filter the query by *date* and also have a [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) of type `DateTime` that I pass to the [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component. On previewing the report, there are red error messages in place of my data items.

## Steps to Reproduce

1. Install or add without installation, the [Npgsql data provider with version 6.0](https://www.npgsql.org/doc/release-notes/6.0.html) or newer.
1. Create a SqlDataSource with a query that has a parameter with `DbType=DateTime` and map it to the value of a Report Parameter of `Type=DateTime`
1. Set the SqlDataSource as the data source of the report or a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) inside the report, and preview it.

## Error Message

`Cannot write DateTime with Kind=Unspecified to PostgreSQL type 'timestamp with time zone', only UTC is supported. Note that it's not possible to mix DateTimes with different Kinds in an array/range. See the Npgsql.EnableLegacyTimestampBehavior AppContext switch to enable legacy behavior.`

## Cause\Possible Cause(s)

Starting with version 6.0 of the Npgsql data provider, UTC timestamps have been cleanly separated from non-UTC timestamps, aligning with the PostgreSQL types. The former is represented by `timestamp with time zone` and DateTime with _Kind_ `UTC`, the latter by `timestamp without time zone` and DateTime with _Kind_ `Local` or `Unspecified`.

## Suggested Workarounds

Since the Npgsql data provider now expects a UTC value, we can work around the problem by calling the [DateTime.ToUniversalTime](https://learn.microsoft.com/en-us/dotnet/api/system.datetime.touniversaltime) method on the `Value` property of the DateTime Report Parameter.

For example:

`= Parameters.Parameter1.Value.ToUniversalTime()`

## See Also

* [How to Configure Postgres with Npgsql?]({%slug configuring-postgres-with-npgsql%})
* [Npgsql 6.0 Release Notes](https://www.npgsql.org/doc/release-notes/6.0.html)
* [Github Issue - "Cannot write DateTime with Kind=Unspecified" is confusing](https://github.com/npgsql/npgsql/issues/4279)
