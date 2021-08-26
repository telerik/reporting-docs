---
title: Registering SqlDataSource data providers without installing driver
description: No need to install a driver when you register SQLDataSource. See how to register a .Net Framework data provider without installing its driver. 
type: how-to
page_title: Registering .Net Framework data provider without installing its driver
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
How can I register a .Net Framework data provider for Telerik Reporting without installing its driver?

Telerik Reporting allows fetching data from a variety of data sources (details in <a href="/connecting-to-data-data-source-components" target="_blank">this help article</a>). The <a href="/sqldatasource" target="_blank">SqlDataSource component</a> would list and work with any ADO.NET provider that is correctly registered on the device. The usual way of registering .Net Framework data providers is through installing the corresponding driver. Installation would typically add the required information about the data provider in the *machine.config* file, and store the necessary assemblies in the *Global Assembly Cache (GAC)*. More information on registering .Net Framework data providers could be found in <a href="https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory" target="_blank">this MSDN article</a>.

## Solution
In order to feed data to the reports, without installing and registering the ADO.NET providers, you can follow the steps below. As an example, we will configure **Npgsql** - a **.Net Framework Data Provider for Postgresql Server** (version 3.2.1.0), to be used in the Standalone designer.

1. Store the required assemblies in the Standalone designer application hosting folder, the **"appFolder"** in the example, or in a subfolder there. We have used the **bin** subfolder, and therefore configured accordingly the section \<*probing privatePath=”bin”*\>. Alternatively, the assemblies could be stored side by side with the designer (.*exe* file). In this case the \<*probing*\> section could be omitted, and the corresponding paths (in the *href* attribure of the \<*codeBase*\> element) in the configuration file should be updated.
2. Register the following assemblies, which include the Data provider and its external dependencies, in the Standalone designer's *.config* (i.e. **Telerik.ReportDesigner.exe.config**) section \<*runtime*\> \<*assemblyBinding*\>. 
\- Npgsql;
\- Microsoft.Extensions.DependencyInjection.Abstractions;
\- Microsoft.Extensions.Logging.Abstractions;
\- Microsoft.Extensions.Logging;
\- System.Runtime.InteropServices.RuntimeInformation;
\- System.Threading.Tasks.Extensions.
The metadata should be provided in the \<*assemblyIdentity*\> and \<*codeBase*\> tags of the \<*dependentAssembly*\> section as shown in the example:
    
```
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
```

> **Note**
> <br>
> The list of dependencies might be different if you use a different version of **Npgsql** data provider.

3. Register the data provider (**Npgsql**) in the Standalone designer's *.config* (i.e. **Telerik.ReportDesigner.exe.config**) section \<*system.data*\> \<*DbProviderFactories*\>.

```
<system.data>
.................. 
    <DbProviderFactories>
      <add name="Npgsql Data Provider"
           invariant="Npgsql"
           description=".Net Framework Data Provider for Postgresql Server"
           type="Npgsql.NpgsqlFactory, Npgsql, Version=3.2.1.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7" />
..................
    </DbProviderFactories>
</system.data>
```

With this set up, the Standalone designer should successfully find the data provider and grant access to the information stored in the corresponding databases.

## Notes
Registering new data providers in the <a href="/ui-report-designer" target="_blank">Visual Studio Telerik Report Designer</a> would require the same configuration code to be added to the Visual Studio *.config* file (i.e. **devenv.exe.config**). It can be found in *(VS\_installation\_folder)/Common7/IDE*, which would become also the **"appFolder"**.

## See Also
- <a href="/connecting-to-data-data-source-components" target="_blank">Data Source components.</a>
- <a href="/sqldatasource" target="_blank">SqlDataSource components.</a>
- <a href="https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory" target="_blank">Obtaining a DbProviderFactory according to MSDN.</a>
- <a href="/ui-report-designer" target="_blank">Visual Studio Telerik Report Designer.</a>
