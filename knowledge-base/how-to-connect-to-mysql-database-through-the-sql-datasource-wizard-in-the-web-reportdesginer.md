---
title: Connection unsuccessful when Trying to Connect to MySQL Database in the Web Report Designer
description: Resolve the MySQL connection error in the Web Report Designer SQL Data Source Wizard by editing the data source properties directly.
type: troubleshooting
page_title: How to Connect to MySQL Database through the SQL DataSource Wizard in the Web Report Designer?
slug: how-to-connect-to-mysql-database-through-the-sql-datasource-wizard-in-the-web-reportdesginer
position: 
tags: 
ticketid: 1535638
res_type: kb
---

## Environment
| Product | Report designer |
|---|---|
| Progress® Telerik® Reporting |  Web Report Designer |

## Description

For general MySQL connection instructions, see [the MySQL data provider article]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-mysql-data-provider%}).

The Web Report Designer SQL Data Source Wizard returns the following error when you try to connect to a MySQL database.

## Error Message
`Connection unsuccessful. Check the connection string and try again. Keyword not supported: 'port'.`

## Cause
The SQL Data Source Wizard does not provide the correct data provider name. On the first wizard page, the required provider is `MySql.Data.MySqlClient`, but the wizard offers only `MySql.Data`.

Because the engine cannot identify the provider, it falls back to `System.Data.SqlClient` and reports that `Port` is not a supported keyword.

## Workaround
Avoid the SQL Data Source Wizard for this connection and edit the data source properties directly in the properties grid:

1. Open the SQL data source properties in the Web Report Designer properties grid.
2. Set **Data Provider** to `MySql.Data.MySqlClient` instead of `MySql.Data`.
3. Enter or verify the MySQL connection settings directly in the data source properties.

The issue is tracked in the [Feedback Portal item for this MySQL connection problem](https://feedback.telerik.com/reporting/1535638-connecting-to-mysql-from-the-sql-datasource-wizard-does-not-work-in-webreportdesginer).
