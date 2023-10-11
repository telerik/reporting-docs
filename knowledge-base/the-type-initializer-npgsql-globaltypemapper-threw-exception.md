---
title: The type initializer for Npgsql threw an exception
description: "Learn how to resolve the 'The type initializer for GlobalTypeMapper threw an exception' Npgsql error."
type: troubleshooting
page_title: GlobalTypeMapper type initializer error
slug: the-type-initializer-npgsql-globaltypemapper-threw-exception
tags: postgresql, npgsql
ticketid: 1618548
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

The connection to the PostgreSQL database fails despite the connection string being correct. This can happen while configuring the [`SqlDataSource`]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component's connection in the designer or when displaying the report in areport viewer.

## Error Message

````
System.TypeInitializationException: The type initializer for 'Npgsql.TypeMapping.GlobalTypeMapper' threw an exception

Method 'DisposeAsync' in type 'Npgsql.NpgsqlBinaryExporter' from assembly 'Npgsql, Version=4.1.3.1, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7' does not have an implementation.":"Npgsql.NpgsqlBinaryExporter"} | System.Exception {System.TypeLoadException}
````

## Solution

This is an issue introduced with version `4.1.3` of the `Npgsql` data provider. We recommend using version >=`4.1.10` of the `Npgsql` data provider instead - [Configuring the Npgsql data provider]({%slug configuring-postgres-with-npgsql%}).

## See Also

* [Configuring the Npgsql data provider]({%slug configuring-postgres-with-npgsql%})
* [Registering .NET Framework data provider without installing its driver]({%slug how-to-register-sqldatasource-data-providers-without-driver-installation%})
* ["Method 'DisposeAsync' in type 'Npgsql.NpgsqlBinaryImporter' does not have an implementation](https://github.com/npgsql/npgsql/issues/2923)
