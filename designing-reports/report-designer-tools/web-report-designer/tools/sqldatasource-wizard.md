---
title: SqlDataSource Wizard
page_title: SqlDataSource Wizard Tutorial
description: "Learn how to connect Telerik Reports to SQL databases through the dedicated Web Report Designer's SqlDataSource Wizard."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/sqldatasource-wizard
tags: sqldatasource,wizard
published: True
position: 0
previous_url: /web-report-designer-tools-sqldatasource-wizard
---

# SqlDataSource Wizard Overview

The SQL Data Source Wizard allows you to create a new or edit an existing [`SqlDataSource`]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component in the Telerik Web Report Designer. This article describes the SQL Data Source Wizard that you can invoke from the Report Designer toolbox. 

1. __Choose data connection__ Select an existing connection from the list of connections or specify a new connection. The __Select from existing data connections__ option has a drop-down list with the available predefined connection strings, for example: 

   + Local connection strings from the application configuration file and the [ISettingsStorage](/api/Telerik.WebReportDesigner.Services.ISettingsStorage). 

   + All report server data connections that the current user has permissions to read (listed only if you use Telerik Report Server) The default implementation of the  [ISettingsStorage](/api/Telerik.WebReportDesigner.Services.ISettingsStorage) interface - [FileSettingsStorage](/api/Telerik.WebReportDesigner.Services.FileSettingsStorage) enables the designer users to save and use connection strings from the local Web Report Designer settings file. The location of the designer settings file is specified with the required constructor argument [FileSettingsStorage#ctor](/api/Telerik.WebReportDesigner.Services#Telerik_WebReportDesigner_Services_FileSettingsStorage#ctor_System_String_). If using the designer from a Report Server, this drop-down lists the server data connections. Server reports support only saved server data connections. For Report Server reports, user create/read permissions for data connections are required. 

1. __Data connection options__ For server reports, this page is skipped when an existing report server connection is used. Select *Use as shared connection* to store the connection string under a specific name or use the connection from the shared store. The specific action depends on the wizard context and is described in the radio button description. The second option, *Embedded in the report definition* will save the connection string in the report definition. Thus it will be available only for this report and will be available no matter the report definition location. If you use Telerik Report Server, the Embedded connection string in the report's functionality is forbidden. Otherwise, you can control the embedded connection string by overriding the [GetConnectionsPermissions](/api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase#Telerik_WebReportDesigner_Services_Controllers_ReportDesignerControllerBase_GetConnectionsPermissions) that returns serialized [ConnectionsPermissions](/api/Telerik.WebReportDesigner.Services.ConnectionsPermissions) in `camelCase` JSON. For new Report Server reports, the embedded connections option is not allowed. 

   >Saving connection strings simplifies the process of maintaining your application if the database connection changes. In the event of a change in the database connection, edit the connection string in the application store (configuration) as opposed to editing all the report definitions. However, to render the report definition in the context of another project or application, make sure that a connection string with the same name is available in the application and has access to the database. 

1. __Configure Data Source Command__ Choose whether to base the __SqlDataSource__ on a __SQL__ Select Statement or a Stored Procedure: 

   + Selecting the `"Select Statement"` option will enable entering a __SQL__ query statement directly in the text box below. 

   + Choosing the `"Stored Procedure"` option allows you to select the name of an existing database Stored Procedure from the drop-down list below, which is responsible for the data retrieval. 

   >The `SqlDataSource` is designed to read data from the database but internally it uses the [_DbCommand.ExecuteReader_ method](https://learn.microsoft.com/en-us/dotnet/api/system.data.common.dbcommand.executereader?view=net-8.0) which does not limit the commands that can executed against the database connection. Therefore, the command typed in the `SelectCommand` property will be executed as-is, even if it contains statements such as DELETE, UPDATE, DROP, etc. To prevent potentially unwanted modifications to your database, we strongly recommend using connections with read-only permissions to fetch the data.

1. __Configure Data Source Parameters__ Specify the parameters for the __SQL__ Query or Stored Procedure. Click *"New"* to add a new parameter to the __SqlDataSource__ component or *"Delete"* to remove an existing parameter. Use the arrow buttons to change the order of the parameters when necessary. 

   + Specify a valid name for each data source parameter in the `"Name"` column. You can also choose that name from the list of existing parameter names, which are derived directly from the __SQL__ Query Statement or Stored Procedure. 

   + Choose the appropriate database type for the parameter in the `"DbType"` column. This type must match exactly the type of the expression in the __SQL__ query statement or the type of the parameter from the stored procedure. 

   + Specify a default value for the parameter in the `"Value"` column or bind it via an expression. 

   >Bind a data source parameter directly to a report parameter to use the standard Report Parameter user interface to provide values for data source parameters. The drop-down list of the *"Value"* column displays all existing report parameters. Alternatively, invoke the  __Edit Expression__ dialog by choosing *```<Expression>```* from the list, to specify an arbitrary expression to evaluate for the parameter value. 

1. __Configure Design Time Parameters__ This step allows you to specify a value for each data source parameter that can be used at design time to retrieve the schema and preview the __SqlDataSource__ component data. 

   >Specifying design-time values for the parameters is necessary because the designer might need to execute the __SQL__ query or stored procedure of the data source to populate the schema displayed in the  __Explorer__ tool window and the  __Edit Expression__ dialog. These values do not affect the execution of the  __SQL__ query at runtime. 

1. __Preview Data Source Results__ Preview the result set returned by the __SqlDataSource__ before completing the wizard. Click *Execute Query* to execute the __SQL__ query or stored procedure and display the retrieved data. If the data source has parameters, the preview uses the Design Time Parameters values. This is the last step of the wizard. After pressing *"Finish"* the wizard will configure the __SqlDataSource__ component with the specified settings and close. 
