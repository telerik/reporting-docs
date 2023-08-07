---
title: Connecting to PostgreSQL DB
description: "Learn how to configure the SqlDataSource component for PostgreSQL database using the Npgsql data provider."
type: how-to
page_title: Configuring the Npgsql data provider
slug: configuring-postgres-with-npgsql
tags: 
ticketid: 1453133
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

This KB article lists the required steps for configuring the [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component to connect to a [PostgreSQL](https://www.postgresql.org/) database with the `Npgsql` data provider.

## Solution for Npgsql version 3.2.7

1. Install [Npgsql version 3.2.7](https://github.com/npgsql/npgsql/releases/tag/v3.2.7) by using the `.MSI` file. Note that the [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component will list and work with any `ADO.NET` provider that is correctly registered on the device;
1. Add **SQL Data Source** -> **Build new data connection** -> select **Npgsql Data Provider**;
1. Add the **Connection string** in the field. For example:

	`Host=reporting7x64.telerik.com;Username=postgres;Password=password;Database=postgres`

1. Click **Next** -> fill in the **Select Statement** or use the **Query Builder** -> **Finish**.

## Solution for Npgsql version >= 4.1.11

1. Create a sample Console application and add the `Npgsql 4.1.11.0` NuGet package;
1. Build the project, then copy the assemblies which are related to the data provider from the `bin` folder of the application;
1. Paste them to the folder of the Standalone designer executable file;
1. Go to the `App.config` file of the application and copy the binding redirects;
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
				<bindingRedirect oldVersion="0.0.0.0-4.1.11.0" newVersion="4.1.11.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Microsoft.Bcl.AsyncInterfaces" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-1.0.0.0" newVersion="1.0.0.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Numerics.Vectors" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-4.1.4.0" newVersion="4.1.4.0" />
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
				<bindingRedirect oldVersion="0.0.0.0-4.0.5.0" newVersion="4.0.5.0" />
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
					type="Npgsql.NpgsqlFactory, Npgsql, Version=4.1.11.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7" />
			</DbProviderFactories>
		</system.data>
	<configuration>
````


1. Repeat the steps 2-4 from the previous section.
