---
title: Using the Npgsql Data Provider
page_title: Integrating the Npgsql Data Provider
description: "Learn more about how the Npgsql data provider can be used by the SqlDataSource component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-npgsql-data-provider
tags: Npgsql,data,provider,PostgreSQL
published: True
position: 0
---

# Overview

[Npgsql](https://www.npgsql.org/) is an open source ADO.NET Data Provider for PostgreSQL, it allows programs written in C#, Visual Basic, F# to access the PostgreSQL database server and execute queries to it.

## Setting up the Npgsql Data Provider in the .NET Standalone Report Designer

1. Create a new [.NET 8 Comsole Application](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/console-teleprompter) project.
1. Install the [Npgsql](https://www.nuget.org/packages/Npgsql/) NuGet package to it and `build` the project.
1. Navigate to the `bin/Debug/net8.0` subdirectory of the project, and copy all assemblies there except for the assembly with the name of the project.
1. Paste the assemblies in the .NET Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. Start the .NET Standalone Report Designer from the same directory and add a new [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) which should trigger the [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}). The `Npgsql` data provider should now be listen among the rest of the data providers when building a new connection.


## Setting up the Npgsql Data Provider in the .NET Framework Standalone Report Designer

### MSI Installation - Npgsql 3.2.7

1. Install [Npgsql version 3.2.7](https://github.com/npgsql/npgsql/releases/tag/v3.2.7) by using the `.MSI` file. Note that the [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component will list and work with any `ADO.NET` provider that is correctly registered on the device;
1. Add **SQL Data Source** -> **Build new data connection** -> select **Npgsql Data Provider**;
1. Add the **Connection string** in the field. For example:

	`Server=127.0.0.1;Port=5432;Database=myDataBase;User Id=myUsername;Password=myPassword;`

1. Click **Next** -> fill in the **Select Statement** or use the **Query Builder** -> **Finish**.

### Manual Configuration

1. Create a new [.NET Framework 4.6.2 Comsole Application](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/console-teleprompter) project.
1. Install the [Npgsql 8.0.4](https://www.nuget.org/packages/Npgsql/8.0.4) NuGet package to it and `build` the project. package;
1. Navigate to the `bin/Debug` subdirectory of the project, and copy all assemblies there except for the assembly with the name of the project.
1. Paste the assemblies in the .NET Framework Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer`.
1. Open the `App.config` file of the application and copy the binding redirects;
1. Open the configuration file of the Standalone designer (`Telerik.ReportDesigner.exe.config`) and add the binding redirects:

	````XML
<?xml version="1.0" encoding="utf-8"?>
	<configuration>
		<configSections>
			<section
					name="Telerik.Reporting"
					type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
					allowLocation="true"
					allowDefinition="Everywhere"/>
		</configSections>

		<runtime>
			<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			<!--
			<probing privatePath="path-to-the-assemblies"/>
			-->
			. . . 
			<dependentAssembly>
				<assemblyIdentity name="Npgsql" culture="neutral" publicKeyToken="5d8b90d52f46fda7"/>
				<bindingRedirect oldVersion="0.0.0.0-8.0.4.0" newVersion="8.0.4.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Microsoft.Bcl.AsyncInterfaces" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-8.0.0.0" newVersion="8.0.0.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Numerics.Vectors" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-4.1.4.0" newVersion="4.1.4.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="6.0.0.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Buffers" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Threading.Tasks.Extensions" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-4.2.0.1" newVersion="4.2.0.1" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.ValueTuple" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" />
			</dependentAssembly>
			</assemblyBinding>
		</runtime>

		<system.data>
			<DbProviderFactories>
				<add name="Npgsql Data Provider"
					invariant="Npgsql"
					description=".NET Framework Data Provider for Postgresql Server"
					type="Npgsql.NpgsqlFactory, Npgsql, Version=8.0.4.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7" />
			</DbProviderFactories>
		</system.data>
	<configuration>
````


## Setting up the Npgsql Data Provider in .NET Applications

The [Npgsql](https://www.npgsql.org/) data provider is automatically registered in the `Telerik.Reporting.Processing.Data.DbProviderFactories`. To use this data provider, it should be enough to install the [Npgsql](https://www.nuget.org/packages/Npgsql/) NuGet package to the project.

If the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) uses a `shared` connection where it is retrieved from the configuration file of the project(e.g. `appsettings.json`), the provider name must be specified in the connection. For example:

````JSON
{
	"ConnectionStrings":{
		"postgres":{
			"connectionString":"Server=127.0.0.1;Port=5432;Database=myDataBase;User Id=myUsername;Password=myPassword;",
			"providerName":"Npgsql"
		}
	}
}
````

## See Also

* [PostgreSQL connection strings](https://www.connectionstrings.com/postgresql/)
* [Connecting to PostgreSQL DB]({%slug configuring-postgres-with-npgsql%})