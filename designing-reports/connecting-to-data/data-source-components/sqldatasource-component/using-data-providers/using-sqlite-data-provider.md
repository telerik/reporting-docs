---
title: Using the SQLite Data Provider
page_title: Integrating the SQLite Data Provider
description: "Learn more about how the SQLite data provider can be used by the SqlDataSource component to connect to local data storages in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-sqlite-data-provider
tags: System.Data.Sqlite,sqlite,data,provider
published: True
position: 5
---

# Overview

The [System.Data.SQLite](https://system.data.sqlite.org/) is an ADO.NET provider for [SQLite](https://www.sqlite.org/). SQLite is not directly comparable to client/server SQL database engines such as MySQL, Oracle, PostgreSQL, or SQL Server and instead focuses on providing local data storage for individual applications and devices.

## Setting up the System.Data.Sqlite Data Provider in the .NET Standalone Report Designer

1. Download the **SQLite Binaries** built for `.NET Standard 2.0` or `.NET Standard 2.1` from the [System.Data.Sqlite](http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki) Downloads page.
1. Unpackage the zip with the binaries and copy the `System.Data.Sqlite.dll` file to the .NET Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. Download SQLite binaries built for `.NET Framework.4.X` from the [System.Data.Sqlite](http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki) page, for example [sqlite-netFx40-binary-x64-2010-1.0.117.0.zip](https://system.data.sqlite.org/downloads/1.0.117.0/sqlite-netFx40-binary-x64-2010-1.0.117.0.zip).
1. Unpackage the archive and copy the `SQLite.Interop.dll` assembly to the .NET Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. Restart the designer if you have previously opened it.
1. Add a new SqlDataSource and you should see that the `Sqlite` Data Provider is in the dropdown.

## Setting up the System.Data.Sqlite Data Provider in the .NET Framework Standalone Report Designer

1. Download the SQLite installer for `.NET Framework 4.6` from the [System.Data.Sqlite](http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki) Downloads page.
1. Copy the `System.Data.Sqlite.dll` and `SQLite.Interop.dll` assemblies from the System.Data.Sqlite installation directory to the directory with the .NET Framework Standalone Report Designer - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\`.

	 SQLite Installation: `C:\Program Files\System.Data.SQLite\2015\bin`
	 Telerik Reporting Installation: `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer`

1. Add the DbProvider Factory declaration to the appropriate Stand-alone Report Designer configuration file. `Telerik.ReportDesigner.exe.config` is for 64-bit (x64) and `Telerik.ReportDesigner.x86.exe.config` is for 32-bit (x86).

	>note When updating the configuration file, use the version that matches the installed SQLite ADO.NET Provider, i.e., `64-bit (x64)` or `32-bit (x86)`.
	
	````XML
<system.data>
		<DbProviderFactories>
				<remove invariant="System.Data.SQLite" />
				<add name="SQLite Data Provider" invariant="System.Data.SQLite" description=".NET Framework Data Provider for SQLite"
							type="System.Data.SQLite.SQLiteFactory, System.Data.SQLite, Version=1.0.117.0, Culture=neutral, PublicKeyToken=db937bc2d44ff139" />
		</DbProviderFactories>
</system.data>
````


## Setting up the System.Data.Sqlite Data Provider in .NET Applications

The [System.Data.SqlClient)](https://system.data.sqlite.org/) data provider is automatically registered in the `Telerik.Reporting.Processing.Data.DbProviderFactories`. To use this data provider, it should be enough to install the [System.Data.SQLite ](https://www.nuget.org/packages/System.Data.SQLite/) NuGet package to the project.

If the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) uses a `shared` connection where it is retrieved from the configuration file of the project(e.g. `appsettings.json`), the provider name must be specified in the connection. For example:

````JSON
{
	"ConnectionStrings":{
		"mysql":{
			"connectionString":"Data Source=c:\mydb.db;Version=3;",
			"providerName":"System.Data.Sqlite"
		}
	}
}
````


## See Also

* [How to configure SQLite ADO.NET Provider for Standalone Report Designer]({%slug configure-the-stand-alone-report-designer-sqlite-data-provider%})
* [Integrating SQLite Databases with Telerik Web Report Designer]({%slug integrate-sqlite-databases-telerik-web-report-designer%})
* [SQLite connection strings](https://www.connectionstrings.com/sqlite/)