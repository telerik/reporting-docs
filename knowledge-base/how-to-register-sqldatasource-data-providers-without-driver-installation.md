---
title: Registering SqlDataSource Data Providers Without Installing Driver
description: "No need to install a driver when you register SQLDataSource. See how to register a .NET Framework data provider without installing its driver."
type: how-to
page_title: Registering .NET Framework data provider without installing its driver
slug: how-to-register-sqldatasource-data-providers-without-driver-installation
res_type: kb
category: knowledge-base
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Item</td>
			<td>SqlDataSource Component</td>
		</tr>
	</tbody>
</table>

## Description

How can I register a .NET Framework data provider for Telerik Reporting without installing its driver?

Telerik Reporting allows fetching data from a variety of data sources (details in [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%})). The [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) would list and work with any ADO.NET provider that is correctly registered on the device. The usual way of registering .NET Framework data providers is through installing the corresponding driver. Installation would typically add the required information about the data provider in the *machine.config* file, and store the necessary assemblies in the *Global Assembly Cache (GAC)*. More information on registering .NET Framework data providers could be found in [Obtaining a DbProviderFactory](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory) Microsoft article.

## Solution

In order to feed data to the reports, without installing and registering the ADO.NET providers, you can follow the steps below. As an example, we will configure **Npgsql** - a **.NET Framework Data Provider for Postgresql Server** (version 3.2.1.0), to be used in the Standalone designer.

1. Store the required assemblies in the Standalone designer application hosting folder, the **"appFolder"** in the example, or in a subfolder there. We have used the **bin** subfolder, and therefore configured accordingly the section \<*probing privatePath=”bin”*\>. Alternatively, the assemblies could be stored side by side with the designer (.*exe* file). In this case the \<*probing*\> section could be omitted, and the corresponding paths (in the *href* attribure of the \<*codeBase*\> element) in the configuration file should be updated.
1. Register the following assemblies, which include the Data provider and its external dependencies, in the Standalone designer's *.config* (i.e. **Telerik.ReportDesigner.exe.config**) section \<*runtime*\> \<*assemblyBinding*\>.

	+ Npgsql;
	+ Microsoft.Extensions.DependencyInjection.Abstractions;
	+ Microsoft.Extensions.Logging.Abstractions;
	+ Microsoft.Extensions.Logging;
	+ System.Runtime.InteropServices.RuntimeInformation;
	+ System.Threading.Tasks.Extensions.

	The metadata should be provided in the \<*assemblyIdentity*\> and \<*codeBase*\> tags of the \<*dependentAssembly*\> section as shown in the example:

	````XML
<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			..................
			<probing privatePath="bin"/>
			
			<dependentAssembly>
				<assemblyIdentity name="Npgsql" culture="neutral"publicKeyToken="5d8b90d52f46fda7"/>
				<codeBase version="3.2.1.0" href="FILE://(appFolder)/bin/Npgsql.dll"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Microsoft.Extensions.DependencyInjection.Abstractions"culture="neutral" publicKeyToken="adb9793829ddae60" />
				<codeBase version="1.1.0.0"href="FILE://(appFolder)/bin/Microsoft.Extensions.DependencyInjection.Abstractions.dll"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Microsoft.Extensions.Logging.Abstractions"culture="neutral" publicKeyToken="adb9793829ddae60" />
				<codeBase version="1.1.0.0"href="FILE://(appFolder)/bin/Microsoft.Extensions.Logging.Abstractions.dll"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Microsoft.Extensions.Logging" culture="neutral"publicKeyToken="adb9793829ddae60"/>
				<codeBase version="1.1.0.0"href="FILE://(appFolder)/bin/Microsoft.Extensions.Logging.dll"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Runtime.InteropServices.RuntimeInformation"culture="neutral" publicKeyToken="b03f5f7f11d50a3a"/>
				<codeBase version="4.0.1.0"href="FILE://(appFolder)/bin/System.Runtime.InteropServices.RuntimeInformation.dll"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="System.Threading.Tasks.Extensions" culture="neutral"publicKeyToken="cc7b13ffcd2ddd51" />
				<codeBase version="4.1.0.0"href="FILE://(appFolder)/bin/System.Threading.Tasks.Extensions.dll"/>
			</dependentAssembly>
			..................
		</assemblyBinding>
	</runtime>
````


	> **Note**
	> <br>
	> The list of dependencies might be different if you use a different version of **Npgsql** data provider.

1. Register the data provider (**Npgsql**) in the Standalone designer's *.config* (i.e. **Telerik.ReportDesigner.exe.config**) section \<*system.data*\> \<*DbProviderFactories*\>.

	````XML
<system.data>
		.................. 
		<DbProviderFactories>
			<add name="Npgsql Data Provider"
				invariant="Npgsql"
				description=".NET Framework Data Provider for Postgresql Server"
				type="Npgsql.NpgsqlFactory, Npgsql, Version=3.2.1.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7" />
			..................
		</DbProviderFactories>
	</system.data>
````


With this set up, the Standalone designer should successfully find the data provider and grant access to the information stored in the corresponding databases.

## Notes
Registering new data providers in the [Visual Studio Telerik Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) would require the same configuration code to be added to the Visual Studio *.config* file (i.e. **devenv.exe.config**). It can be found in *(VS\_installation\_folder)/Common7/IDE*, which would become also the **"appFolder"**.

## See Also

* [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%})
* [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})
* [Obtaining a DbProviderFactory](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory)
* [Visual Studio Telerik Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})
