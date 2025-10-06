---
title: Using the MySQL Data Provider
page_title: Integrating the MySQL Data Provider
description: "Learn more about how the MySQL data provider can be used by the SqlDataSource component to connect to MySQL databases in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-mysql-data-provider
tags: MySQL,data,provider
published: True
position: 2
---

# Using MySQL Connector in Reporting

The `MySQL Connector/NET` is a fully managed ADO.NET data provider written in pure C#, which can be used to connect to [MySQL](https://www.mysql.com/), [MariaDB](https://mariadb.org/), etc. databases.

## Setting up the MySQL Connector/NET Data Provider in the .NET Standalone Report Designer

1. Create a new [.NET 8 Console Application](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/console-teleprompter) project.
1. Install the [MySql.Data](https://www.nuget.org/packages/MySql.Data) NuGet package to it and `build` the project.
1. Navigate to the `bin/Debug/net8.0` subdirectory of the project, and copy all assemblies there except for the assembly with the name of the project.
1. Paste the assemblies in the .NET Standalone Report Designer installation directory, e.g., `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. Start the .NET Standalone Report Designer from the same directory and add a new [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}), which should trigger the [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}). The `MySQL` data provider should now be listed among the rest of the data providers when building a new connection.

## Setting up the MySQL Connector/NET Data Provider in the .NET Framework Standalone Report Designer

### Using MSI Installer

MySQL provides an `x86 32-bit` MSI installer that will install the MySQL data provider and register it in the `machine.config` - [MySQL Community Downloads](https://dev.mysql.com/downloads/connector/net/).

### Using the Source Code

The [MySQL Community Downloads](https://dev.mysql.com/downloads/connector/net/) page also offers the option of downloading the source code.

1. Download the source code `.zip` - [MySQL Community Downloads](https://dev.mysql.com/downloads/connector/net/).
1. Extract it and navigate to the `v4.6.2` subdirectory.
1. Copy all of the content in the `v4.6.2` directory to the directory with the .NET Framework Standalone Report Designer - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\`.
1. Open the `Telerik.ReportDesigner.exe.config` file in a text editor and add the following XML to register the MySQL data provider without installing

   ```XML
   <system.data>
   	<DbProviderFactories>
   		<add name="MySQL Data Provider" invariant="MySql.Data.MySqlClient" description=".Net Framework Data Provider for MySQL" 			type="MySql.Data.MySqlClient.MySqlClientFactory, MySql.Data, Version=9.0.0, Culture=neutral, PublicKeyToken=c5687fc88969c44d"/>
   	</DbProviderFactories>
   </system.data>
   ```

   > The example was made with version `9.0.0` of the MySQL data provider; correct the version number in the above snippet if a newer/older version was downloaded instead.

## Setting up the MySQL Connector/NET Data Provider in .NET Applications

The [MySQL Connector/NET](https://dev.mysql.com/doc/connector-net/en/) data provider is automatically registered in the `Telerik.Reporting.Processing.Data.DbProviderFactories`. To use this data provider, it should be enough to install the [MySql.Data](https://www.nuget.org/packages/MySql.Data) NuGet package to the project.

If the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) uses a `shared` connection where it is retrieved from the configuration file of the project(e.g., `appsettings.json`), the provider name must be specified in the connection. For example:

```JSON
{
	"ConnectionStrings":{
		"mysql":{
			"connectionString":"Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;",
			"providerName":"MySql.Data.MySqlClient"
		}
	}
}
```

## Web Report Designer

In the [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/sqldatasource-wizard%}) of the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}), on the first page, the `Data Provider` must be `MySql.Data.MySqlClient`, but the option is limited only to MySql.Data.

Since the engine cannot determine the type of the data provider by that name, it falls back to `System.Data.SqlClient` and claims that `"Port" is not a supported keyword`.

The workaround is to avoid using the SQL DataSource wizard and edit the data source properties directly in the `Properties` grid.

## See Also

- [Connection unsuccessful when Trying to Connect to MySQL Database in the Web Report Desginer]({%slug how-to-connect-to-mysql-database-through-the-sql-datasource-wizard-in-the-web-reportdesginer%})
- [MySQL connection strings](https://www.connectionstrings.com/mysql/)
- [Installing Connector/NET on Windows](https://dev.mysql.com/doc/connector-net/en/connector-net-installation-windows.html)
- [Installing Connector/NET Using the Standalone Installer](https://dev.mysql.com/doc/connector-net/en/connector-net-installation-binary-windows-installer.html)
- [Installing Connector/NET from Source](https://dev.mysql.com/doc/connector-net/en/connector-net-installation-source.html)
