---
title: How to configure SQLite ADO.NET Provider for Stand-alone Report Designer
description: Follow these steps to properly configure the SQLite Datasource provider in the Telerik Reporting Stand-alone Report Designer.
type: how-to
page_title: Configure the Stand-Alone Report Designer SQLite Data Provider
slug: configure-the-stand-alone-report-designer-sqlite-data-provider
position: 
tags: 
ticketid: 1455156
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>12.2.18.1017</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Configuring the SQLite ADO.NET Provider for the Stand-alone Report Designer requires a few steps. If one is missed, the DataSource provider will not work in the Report Designer. Follow the below steps as to get this working.

## Solution
**Step 1** Download the SQLite installer per your desired version of the .NET Framework from the [System.Data.Sqlite](http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki) Downloads page.

**Step 2** Copy the **System.Data.Sqlite.dll** file from the System.Data.Sqlite installation directory  to the Report Designer installation directory.

- SQLite Installation: ```C:\Program Files\System.Data.SQLite\2015\bin```
- Telerik Reporting Installation: ```C:\Program Files (x86)\Progress\Telerik Reporting R2 2019\Report Designer```

The Telerik Reporting directory will look like the following:

![sqlite instal](resources/sqlite_install.png)

**Step 3** Add the DbProvider Factory declaration to the **Telerik.ReportDesigner.exe.config** and **Telerik.ReportDesigner.x86.exe.config** configuration files.

``` xml
<system.data>
		<DbProviderFactories>
				<remove invariant="System.Data.SQLite" />
				<add name="SQLite Data Provider" invariant="System.Data.SQLite" description=".NET Framework Data Provider for SQLite"
							type="System.Data.SQLite.SQLiteFactory, System.Data.SQLite, Version=1.0.110.0, Culture=neutral, PublicKeyToken=db937bc2d44ff139" />
		</DbProviderFactories>
</system.data>
```
**Step 4** Install the [SQLite/SQLServer Compact Toolbox](https://marketplace.visualstudio.com/items?itemName=ErikEJ.SQLServerCompactSQLiteToolbox) extension in visual studio. This will give you a similar experience to using Access.

## See Also
*   [System.Data.Sqlite](http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki)
*   [SQLite/SQLServer Compact Toolbox](https://marketplace.visualstudio.com/items?itemName=ErikEJ.SQLServerCompactSQLiteToolbox)
*   [How-To use SQLite with Telerik Reporting Standalone Report Designer](https://telerikhelper.net/2016/12/29/how-to-use-sqlite-with-telerik-reporting-standalone-report-designer/)