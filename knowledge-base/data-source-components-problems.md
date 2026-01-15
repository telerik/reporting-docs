---
title: Data Source Components Problems
type: troubleshooting
page_title: Problems with the Data Source Components
description: "Learn how to identify and fix some particular problems related to different Data Source Components in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/troubleshooting/data-source-components-problems
tags: data,source,components,problems
published: True
previous_url: /troubleshooting-data-source-components-configurations,/designing-reports/connecting-to-data/troubleshooting/data-source-components-problems
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

This article lists common issues in configuring Telerik Reporting DataSource components. Before proceeding with the troubleshooting, test if the problem is reproducible with the latest available Telerik Reporting version.

## SqlDataSource Component

The SqlDataSource component uses the installed on the machine .NET data providers, the corresponding ADO.NET classes, and the information from the provided connection string to establish a connection and retrieve data. Errors can occur due to a connection string misconfiguration or invalid SQL queries.

- **Data provider is missing in the SqlDataSource wizard**

  Verify the.NET data provider is installed and registered on the machine.

  Also, check if you are using the proper .NET data provider based on the project settings (.NET framework version and target Platform).

  More troubleshooting information is available in the [Configuring Stored Procedure with Temporary Tables]({%slug use-temporary-tables-in-stored-procedure%}) KB article.

- **"An error has occurred while processing Report 'ReportName': Procedure or function 'StoredProcedureName' expects parameter '@ParameterName', which was not supplied." error on preview**

  Report parameters' values may not be passed to the SQL Stored Procedure if the SqlDataSource component is not configured to link SQL parameters to report parameters.

  Repeat the configuration steps in the [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}).

  Another reason for the error is the usage of **Glimpse** which prevents the proper execution of StoredProcedure commands. Glimpse can be removed or bypassed by using the 'Select Statement' option of the SqlDataSource Wizard as follows: _"exec 'StoredProcedureName' @param1,@param2,.."_.

- **Missing fields after configuring the SqlDataSource component**

  The [SqlDataSource wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}) uses the values set at the 'Configure design time parameters' step to executed the SQL query at the 'Preview data source results' step and to obtain the data schema (available fields).

  Double-check the SQL query by running it in an SQL management tool. Test reconfiguring the SqlDataSource component and executing the SQL query at the 'Preview data source results' step of the SqlDataSource wizard.

  In case of SQL queries relying on **temporary tables**, apply the settings from the [Configuring Stored Procedure with Temporary Tables]({%slug use-temporary-tables-in-stored-procedure%}) KB article.

- **"Format of the initialization string does not conform to specification starting at index 0" error on preview**

  Missing or invalid connection string can cause the problem. Double-check if the connection string, used by the report's SqlDataSource component, is copied in the application's configuration file.

  Also, test the connection string in an SQL management tool.

- **"Timeout expired. The timeout period elapsed prior to completion of the operation or the server is not responding." error on preview**

  The expired timeout can be caused by data retrieval operation taking too much time on the server.

  Test extending the connection timeout through the connection string.

  If the SQL command requires more time to be executed, increase the value of the [CommandTimeout](/api/Telerik.Reporting.SqlDataSource#Telerik_Reporting_SqlDataSource_CommandTimeout) property.

- **SQL parameters are not listed at the 'Configure data source parameters' step of the SqlDataSource Wizard**

  The [SqlDataSource wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}) relies on the selected.NET data provider to evaluate the SQL query and to provide information about any detected SQL parameters.

  The syntax of the SQL query must be considered with the selected.NET data provider in order for SQL parameters to be listed at the 'Configure data source parameters' step of the SqlDataSource Wizard.

  In case the.NET data provider does not return information about SQL parameters, you can configure manually the SqlDataSource component's Parameters collection.

## ObjectDataSource Component

The ObjectDataSource component can wrap any business object, where most issues are due to the custom logic of the used data retrieval method.

- **Missing fields after configuring the ObjectDataSource component**

  The ObjectDataSource component loads all accessible members of the wrapped business object.

  If fields are not listed in the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}) check their [Access Modifiers](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers), and verify they have getter methods.

- **The assembly "_AssemblyNameHere_" is not permitted to be used by an ObjectDataSource component. Please include it in an AssemblyReferences element in the Telerik.Reporting configuration section of your application configuration file.**

  When the above message appears, this means that the type used by the ObjectDataSource component is declared in another assembly, different from the assembly that contains the report.

  In this case, the application configuration file (_app.config/web.config_ ) have to be modified and the name of the assembly containing the ObjectDataSource type have to be added in [AssemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) element, as explained in **Configuration** section of [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) article.

  Additional information can be found in [Telerik Reporting R3 2016 - Upgrade Issues with ObjectDataSource Component]({%slug telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component%}).

- **Report Designer Preview is not working when using ObjectDataSource.**

  Such issues can occur due to errors in retrieving data through the wrapped data access method, or missing configuration required by the wrapped data access method.

  For more details and solutions, check [Report Designer Preview is not working when using ObjectDataSource]({%slug visual-studio-preview-is-not-working-when-using-objectdatasource%})

## EntityDataSource Component

The EntityDataSource component wraps **EF data models**, where in design-time the Report Designer needs to create a data context to load the data schema. Most common issues are caused by improperly configured EF data model or by locked assemblies.

- **"No connection string named 'ConnectionStringName' could be found in the application config file." error on preview**

  Missing or invalid connection string can cause the problem.

  Double-check if the connection string, used by the EF data model wrapped by the report's EntityDataSource component, is copied in the application's configuration file. Also, test the connection string in an SQL management tool.

- **A connection string has been provided but a constructor with a connection string argument could not be found. Either remove the connection string from the data source or provide a constructor that will use that connection string. For design time purposes a constructor that has a connection string argument and passes it to the base constructor is required.**

  The error indicates the wrapped EF data model does not have a constructor that can accept a string argument (the connection string provided on configuring the EntityDataSource component).

  Adding the constructor as in the [EntityDataSource Component overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%}) resolves the issue.

  Further instructions for configuring the EntityDataSource component are available in the [EntityDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard%}) article.

- **"Error Message: GenericArguments[0], 'Context' on '[TContext]' violates the constraint of type 'TContext'." on design preview of report**

  The error can be seen in Visual Studio only.

  Changes in the way Visual Studio works cause the same EF data model to be loaded multiple times on the build and on configuring the EntityDatasource component, where the assembly gets locked. Thus, types exist more than once in the VS Report Designer and cause the error.

  The common solutions for the problem are to restart Visual Studio to unlock the assemblies or use a project with a Viewer control to preview the changes in the report.

  The recommended approach is to use the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) tool for designing reports.

  To load the assembly with the EF data model in the Standalone Report Designer, you need to extend its configuration - [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}). For example:

  ```XML
  <Telerik.Reporting>
  	<AssemblyReferences>
  		<add name="MyEFModelCustomAssembly" version="1.0.0.0" culture="neutral" publicKeyToken="null" />
  		<add name="EntityFramework" version="6.0.0.0" culture="neutral" publicKeyToken="..." />
  		<add name="EntityFramework.SqlServer" version="6.0.0.0" culture="neutral" publicKeyToken="..." />
  	</AssemblyReferences>
  </Telerik.Reporting>
  ```

## OpenAccessDataSource Component

The OpenAccessDataSource component wraps data models created by the means of Telerik Data Access, where in design-time the Report Designer needs to create a data context to load the data schema. Most common issues are caused by improperly configured data model or by locked assemblies.

- **"Format of the initialization string does not conform to specification starting at index 0" error on preview**

  Missing or invalid connection string can cause the problem.

  Double-check if the connection string, used by the data model wrapped by the report's OpenAccessDataSource component, is copied in the application's configuration file.

  Also, test the connection string in an SQL management tool.

- **"Constructor on type 'xxx.FluentModel' not found" error on preview**

  The error indicates the wrapped data model does not have a constructor which can accept a string argument (the connection string provided on configuring the OpenAccessDataSource component).

  Adding a constructor accepting a string argument (the connection string passed by the OpenAccessDataSource) resolves the issue.

  Further instructions for configuring the EntityDataSource component are available in the [OpenAccessDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard%}) article.

- **"Could not load file or assembly 'Telerik.OpenAccess(.xxx), Version=x.x.x.x, Culture=neutral, PublicKeyToken=xxx' or one of its dependencies. The system cannot find the file specified." on preview of report**

  The error can be seen if projects use different version of Telerik Data Access or a project does not have references to Telerik Data Access.

  Adding references to the same Telerik Data Access version in all projects resolves the problem.

  In case a project uses an older version of Telerik Data Access, test adding [binding redirects](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/redirect-assembly-versions) to the new version.
