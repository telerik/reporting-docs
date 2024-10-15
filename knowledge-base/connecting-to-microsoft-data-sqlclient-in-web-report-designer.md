---
title: How to Use Microsoft.Data.SqlClient Data Provider in Web Report Designer
description: The article explains how to setup the Microsoft.Data.SqlClient data provider in Web Report Designer
type: how-to
page_title: Connecting to Microsoft.Data.SqlClient in Web Report Designer
slug: connecting-to-microsoft-data-sqlclient-in-web-report-designer
position: 
tags: 
ticketid: 1573159
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
			<td>Report Designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>

## Description

> Visit the updated [Integrating the Microsoft SQL Client Data Provider]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-microsfost-data-sqlclient-data-provider%}) article for a how-to on connecting to MS SQL Databases.

The Telerik Reporting engine is extensible and it provides options to register virtually any DbProvider to be used in your application.
For .NET Framework this is done in the application configuration file,
as explained in this article: 
[Registering SqlDataSource data providers without installing driver]({%slug how-to-register-sqldatasource-data-providers-without-driver-installation%}).

## Solution
For .NET Core applications, the approach is a bit different. 
Our assemblies are targeting .NET Standard 2.0 where DbProviderFactories class does not exist. 
Internally we have our own implementation of that class and this article explains how to register a new DbProvider in one line:
[How to register a DbProviderFactory in a .NET Core project]({%slug how-to-register-db-provider-factory-in-net-core-project%}).

However, the application configuration file needs to be modified too. The connection string should contain information which provider to use. 
If no provider is mentioned, the default one: **System.Data.SqlClient** will be used. 

For that reason, the connection string entry should contain information about the DbProvider name, as shown below:

````JSON
"ConnectionStrings": {
	"DefaultConnection": {
		"connectionString": "Data Source=tcp:fhwa-tmas-sql-svr-pool-dev.database.windows.net,1433;Initial Catalog=fhwa-tmas-sql-pool-dev;Persist Security Info=False;Authentication=Active Directory Integrated;Connection Timeout=30;",
		"providerName": "Microsoft.Data.SqlClient"
}
````


## See Also

[Download a video that shows the whole process](resources/connecting-microsoft-data-sqlclient.zip)
