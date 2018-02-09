---
title: MySql connector v.6.10.4 throws a NullReferenceException
description: When connecting to a MySQL database using MySQL Connector Net 6.10.4, a NullReferenceException is thrown
type: troubleshooting
page_title:  MySql connector v.6.10.4 throws a NullReferenceException
slug: mysql-connector-6-10-4-throws-nullreferenceexception
position: 
tags: mysql,connector,nullreferenceexception
ticketid: 1149427
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>.NET</td>
	</tr>
</table>


## Description
When connecting to a MySQL database using MySQL Connector Net 6.10.4, a NullReferenceException is thrown. The reason is that the MySqlClientFactory class, which is created at runtime by [DbProviderFactories.GetFactory()](https://msdn.microsoft.com/en-us/library/h508h681(v=vs.110).aspx) does not implement the [CreateCommandBuilder()](https://msdn.microsoft.com/en-us/library/system.data.common.dbproviderfactory.createcommandbuilder(v=vs.110).aspx) method.
This method is used internally to derive the DbCommand parameters and it must be implemented in the CommandBuilder instance.

## Solution
Although MySQL Connector Net 6.10.4 does not implement the method, it is implemented in a previous version of the connector (6.4.6). This version can be used to connect to MySql databases until the method is implemented in a future release of MySQL connector.
Another option is to use the [ODBC connector](https://dev.mysql.com/downloads/connector/odbc/) from MySQL website.

## See Also

[MySQL Connectors](https://dev.mysql.com/downloads/connector/)
