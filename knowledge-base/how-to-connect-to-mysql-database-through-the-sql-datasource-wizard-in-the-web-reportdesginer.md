---
title: Connection unsuccessfull when Trying to Connect to MySQL Database in the Web Report Desginer
description: Connecting to MySQL Database through the SQL DataSource Wizard in the Web Report Desginer 
type: troubleshooting
page_title: How to Connect to MySQL Database through the SQL DataSource Wizard in the Web Report Desginer?
slug: how-to-connect-to-mysql-database-through-the-sql-datasource-wizard-in-the-web-reportdesginer
position: 
tags: 
ticketid: 1535638
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
			<td>Report designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description

> Visit the updated [Integrating the MySQL Data Provider]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-mysql-data-provider%}) article for a how-to on connecting to MySQL Databases.

The error below is thrown when tring to connect to MySQL Database through the SQL DataSource Wizard in the Web Report Desginer.

## Error Message
Connection unsuccessfull.Check the connection string and try again. Keyword not supported:'port'.

## Cause\Possible Cause(s)
The problem is caused by an issue in the SQL DataSource Wizard that doesn't provide the correct Data Provider name. 
In the wizard on the first page, the **Data Provider** must be **MySql.Data.MySqlClient**, but the option is limited only to MySql.Data. 
Since the engine cannot determine the type of the data provider by that name, it falls back to **System.Data.SqlClient** and claims that "Port" is not a supported keyword.

## Suggested Workarounds
The workaround is to avoid using the SQL DataSource wizard and edit the data source properties directly in the properties grid. 
The issue is logged in our [Feedback portal](https://feedback.telerik.com/reporting/1535638-connecting-to-mysql-from-the-sql-datasource-wizard-does-not-work-in-webreportdesginer), so you can vote for it and when it is fixed, you will get a notification.
