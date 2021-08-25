---
title: Report Designer Preview is not working when using ObjectDataSource inside Visual Studio.
description: Preview the report in the Visual Studio Designer is not working when using ObjectDataSource.
type: troubleshooting
page_title: Reports using ObjectDataSource cannot be opened with the Visual Studio Designer.
slug: visual-studio-preview-is-not-working-when-using-objectdatasource
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
    <tr>
		<td>Report Designer</td>
		<td>Visual Studio Designer</td>
	</tr>
</table>

## Description

As the Visual Studio Report Designer operates *inside* Visual Studio, when previewing a report there, the report constructor is executed in the context of the Visual Studio application and all the configuration settings are obtained from the Visual Studio's **devenv.exe.config** file.. If not taken upon consideration, this might lead to two major issues - *ConnectionStrings* and *AssemblyReferences* mismatch.   

## Solution

Make sure the following are correctly set up:

- Connection Strings

  As described in MSDN, the [ConfigurationManager.ConnectionStrings property](https://docs.microsoft.com/en-us/dotnet/api/system.configuration.configurationmanager.connectionstrings?redirectedfrom=MSDN&view=net-5.0#System_Configuration_ConfigurationManager_ConnectionStrings) gets the *ConnectionStringsSection* data for the current application's default configuration. 
  
  In case of Visual Studio, this is *devenv.exe.config*. The [SqlDataSource component](../sqldatasource) is particularly designed to use the current's project configuration file. However, if your custom Data Access Layer (DAL) is reading the **ConfigurationManager**.ConnectionStrings from the report that is previewed you get all connection strings defined in the devenv.exe.config file. In order to avoid the error you have several options:  

    1. Hard code the ConnectionString in your Data Access Layer(**DAL**);
    2. Use a desktop application with a report viewer(WinForms/WPF) to view your reports in runtime instead of the VS Previews;
    3. Add the required **ConnectionString** in **devenv.exe.config**;
    4. Use the [SqlDataSource](../sqldatasource) component instead of the [ObjectDataSource](../objectdatasource) component. The SqlDataSource component will resolve the *ConnectionStrings* in the reports projects.

> For VS 2017 and higher, the devenv.exe.config's default location is C:\Program Files (x86)\Microsoft Visual Studio\*year*\Professional|Community\Common7\IDE.

- Assembly References

    The [AssemblyReferences](../configuring-telerik-reporting#-telerik-reporting-configuration-section) section contains assembly descriptions that are used to resolve the necessary assemblies during design and/or processing stage. When designing a report that uses ObjectDataSource in Visual Studio Designer, the engine will add the necessary AssemblyReferences entries in the configuration file of the current project. However, when you preview the report in a standalone application, you need to add these entries in the application configuration file so the processing engine would be able to resolve the necessary types.

## Notes

To debug the data access layer while using the Visual Studio Report Designer, you may do the following:

- Open another Visual Studio instance
- Select **Debug-&gt;Attach** **to process** to debug another instance of *devenv.exe* 
- Select **Debug-&gt;Exception...** to enable  the **First Chance Exceptions**.  
 
## See Also

[The Connection Strings Reference](https://www.connectionstrings.com/)

[Visual Studio Problems](../troubleshooting-visual-studio-problems)

[ObjectDataSource Component Problems](../troubleshooting-data-source-components-configurations#objectdatasource-component)
