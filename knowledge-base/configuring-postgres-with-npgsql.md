---
title: How to Configure Postgres with Npgsql?
description: This KB article lists the required steps for configuring Postgres with Npgsql
type: how-to
page_title: How to Configure Postgres with Npgsql?
slug: configuring-postgres-with-npgsql
position: 
tags: 
ticketid: 1453133
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
This KB article lists the required steps for configuring [PostgreSQL](https://www.postgresql.org/) with Npgsql data provider.

## Solution
1. Install [Npgsql version 3.2.7](https://github.com/npgsql/npgsql/releases/tag/v3.2.7).
Note that the [SqlDataSource](../sqldatasource) component will list and work with any ADO.NET provider that is correctly registered on the device;

2. Add **SQL Data Source** -> **Build new data connection** -> select **Npgsql Data Provider**;

3. Add the **Connection string** in the field. For example:
```
Host=reporting7x64.telerik.com;Username=postgres;Password=telerik;Database=postgres
```

4. Click **Next** -> fill in the **Select Statement** or use the **Query Builder** -> **Finish**.

