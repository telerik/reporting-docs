---
title: Using the ODP.NET Data Provider
page_title: Integrating the ODP.NET Data Provider
description: "Learn more about how the ODP.NET data provider can be used by the SqlDataSource component to connect to Oracle databases in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-odpnet-data-provider
tags: ODP.NET,data,provider,Oracle
published: True
position: 1
---

# Overview

The [Oracle Data Provider for .NET (ODP.NET)](https://www.oracle.com/database/technologies/appdev/dotnet/odp.html) features optimized ADO.NET data access to Oracle databases.

There are three driver types: ODP.NET Core; ODP.NET, Managed Driver; and ODP.NET, Unmanaged Driver. ODP.NET Core is designed for multi-platform .NET (Core) applications. ODP.NET, Managed Driver is a 100% managed code .NET Framework provider.

## Setting up the ODP.NET Data Provider in the .NET Standalone Report Designer

1. Create a new [.NET 8 Console Application](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/console-teleprompter) project.
1. Install the [Oracle.ManagedDataAccess.Core](https://www.nuget.org/packages/Oracle.ManagedDataAccess.Core) NuGet package to it and `build` the project.
1. Navigate to the `bin/Debug/net8.0` subdirectory of the project, and copy all assemblies there except for the assembly with the name of the project.
1. Paste the assemblies in the .NET Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. Start the .NET Standalone Report Designer from the same directory and add a new [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) which should trigger the [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}). The `ODP.NET Managaed` data provider should now be listed among the rest of the data providers when building a new connection.

## Setting up the ODP.NET Data Provider in the .NET Framework Standalone Report Designer

Visit the official [Download ODP.NET, Oracle Developer Tools for Visual Studio (Code), and ODAC](https://www.oracle.com/database/technologies/net-downloads.html) page and download the MSI installer for the `Oracle Client for Microsoft Tools`.

Choose between the 32-bit and 64-bit Oracle Client for Microsoft Tools installers depending on which .NET Framework Standalone Report Designer will be used. The default one is the 64-bit variant.

## Setting up the ODP.NET Data Provider in .NET Applications

The [Oracle Data Provider for .NET (ODP.NET)](https://www.oracle.com/database/technologies/appdev/dotnet/odp.html) data provider is automatically registered in the `Telerik.Reporting.Processing.Data.DbProviderFactories`. To use this data provider, it should be enough to install the [Oracle.ManagedDataAccess.Core](https://www.nuget.org/packages/Oracle.ManagedDataAccess.Core) NuGet package to the project.

If the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) uses a `shared` connection where it is retrieved from the configuration file of the project(e.g. `appsettings.json`), the provider name must be specified in the connection. For example:

````JSON
{
	"ConnectionStrings":{
		"oracle":{
			"connectionString":"Data Source=TORCL;User Id=myUsername;Password=myPassword;",
			"providerName":"Oracle.ManagedDataAccess.Client"
			}
	}
}
````

## See Also

* [Oracle Data Provider for .NET / ODP.NET connection strings](https://www.connectionstrings.com/oracle-data-provider-for-net-odp-net/)
* [Download ODP.NET, Oracle Developer Tools for Visual Studio (Code), and ODAC](https://www.oracle.com/database/technologies/net-downloads.html)
