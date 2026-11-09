---
title: Connection unsuccessful when Trying to Connect to MySQL Database in the Web Report Designer
description: Resolve the MySQL connection error in the Web Report Designer SQL DataSource Wizard caused by the incorrect provider name and port keyword.
type: troubleshooting
page_title: How to Connect to MySQL Database through the SQL DataSource Wizard in the Web Report Designer?
slug: how-to-connect-to-mysql-database-through-the-sql-datasource-wizard-in-the-web-reportdesginer
position: 
tags: 
ticketid: 1535638
res_type: kb
---

## Environment
<table>
	<thead>
		<tr>
			<th>Property</th>
			<th>Value</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
    	<tr>
			<td>Report designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description

>note For connection setup instructions, see [the MySQL data provider integration article]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-mysql-data-provider%}).

The Web Report Designer SQL DataSource Wizard shows the following error when you connect to a MySQL database:

## Error Message
`Connection unsuccessful. Check the connection string and try again. Keyword not supported: 'port'.`

## Cause
The SQL DataSource Wizard does not provide the correct data provider name.

On the first page of the wizard, the **Data Provider** must be `MySql.Data.MySqlClient`, but the available option is limited to `MySql.Data`.

The engine cannot determine the provider type from that name. It falls back to `System.Data.SqlClient` and reports that `port` is not a supported keyword.

## Solution
Avoid the SQL DataSource Wizard and configure the data source in the **Properties** grid:

1. Open the data source properties.
2. Set **Data Provider** to `MySql.Data.MySqlClient`.
3. Configure the MySQL connection properties.

The issue is logged in the [Telerik Reporting feedback portal](https://feedback.telerik.com/reporting/1535638-connecting-to-mysql-from-the-sql-datasource-wizard-does-not-work-in-webreportdesginer). Vote for the issue to receive a notification when it is fixed.
