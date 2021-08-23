---
title: Report Designer Preview is not working when using ObjectDataSource
description: Preview the report in the Visual Studio Designer is not working when using ObjectDataSource.
type: troubleshooting
page_title: Reports using ObjectDataSource cannot be opened with the Visual Studio Designer
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

Generally, the Visual Studio Report Designer operates *inside* the Visual Studio application. Thus, when previewing a report the report constructor is executed in the context of the Visual Studio application and all the configuration settings are obtained from the Visual Studio's **devenv.exe.config** file. If not taken upon consideration, this might lead to two major issues - *ConnectionStrings* and *AssemblyReferences* mismatch.   

## Solution

Make the following are correctly set up:

- Connection Strings

    As described in MSDN, the [ConfigurationManager.ConnectionStrings property](https://docs.microsoft.com/en-us/dotnet/api/system.configuration.configurationmanager.connectionstrings?redirectedfrom=MSDN&view=net-5.0#System_Configuration_ConfigurationManager_ConnectionStrings) gets the *ConnectionStringsSection* data for the current application's default configuration. Generally in case of Visual Studio this is devenv.exe.config. The [SqlDataSource component](../sqldatasource) is particularly designed to use the current's project configuration file. However, if your custom data access layer (DAL) is reading the **ConfigurationManager**.ConnectionStrings from the report that is previewed you get all connection strings defined in the devenv.exe.config file. In order to avoid the error you have several options:  

    1. Hard code the ConnectionString in you DAL;
    2. Use an actual application to view your reports in runtime instead of the Previews;
    3. Add the required ConnectionString in devenv.exe.config;
    4. Use the SqlDataSource instead that will resolve the ConnectionStrings in the reports projects.

- Assembly References

    The [AssemblyReferences](../configuring-telerik-reporting#-telerik-reporting-configuration-section) section contains assembly descriptions that are used to resolve the necessary assemblies during design and/or processing stage. When designing a report that uses ObjectDataSource in Visual Studio Designer, the engine will add the necessary AssemblyReferences entries in the configuration file of the current project. However, when you preview the report in a standalone application, you need to add these entries in the application configuration file so the processing engine would be able to resolve the necessary types.

## Notes

To debug the data access layer while using the Visual Studio Report Designer, you have to open another Visual Studio instance, select **Debug-&gt;Attach** **to process** to debug another instance of *devenv.exe* and select **Debug-&gt;Exception...** to enable  the** First Chance Exceptions**.  
 
## See Also

[Visual Studio Problems](../troubleshooting-visual-studio-problems)

[ObjectDataSource Component Problems](../troubleshooting-data-source-components-configurations#objectdatasource-component)
