---
title: SqlDataSource Wizard
page_title: SqlDataSource Wizard Overview
description: "Learn more about the SqlDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the SqlDataSource properties with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview
tags: overview
published: True
position: 1
previous_url: /sqlDataSource-wizard,/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview
---

# SqlDataSource Wizard of the Report Designer

The __SQL Data Source Wizard__ allows you to create a new or edit an existing __SqlDataSource__ component based on a __SQL__ select statement or a database stored procedure. After the wizard appears you have to perform the following steps:

1. __Choose data connection__ Choose an existing connection from the list of connections or specify a new connection. All local, server (if connected to Report Server) and Server Explorer (for Visual Studio) connections are listed. Server Explorer connection will not be listed if it is having the same connection string alias as a local one. If you choose a Server Explorer connection, you can save it as local or use it as embedded in the next step. If you have connected Standalone Report Designer to a Report Server you can see the server connections in this list. A Report Server report can use only server connections and a local report can use only local connections. If you choose a connection from another source it will be used as a base for a new connection that you can save or use as embedded in the next step. For report server report the user need create permission for data connections to see other sources connections and to add a new connection.
1. __Data connection options__ For server reports this page is skipped when an existing report server connection is used. Choose *"Use as shared connection"* to store the connection string in the application configuration file under a specific name or use the connection from the shared store. The exact action is described in the radio button description below. The second option *"Embedded in the report definition"* will save the connection string in the report definition. Thus it will be available only for this report and will be available no matter the report definition location. For new server reports embedded connections option is not allowed.

	> Saving connection strings in the application configuration file (or application store for connections) simplifies the process of maintaining your application if the database connection changes. In the event of a change in the database connection, you can edit the connection string in the application store (configuration) as opposed to editing all the report definitions and having to recompile your application. However, if you want to render the report definition in the context of another project or application you have to make sure that connection string with the same name is available in the application and have access to the database.

1. __Configure Data Source Command__ Choose whether you want to base your __SqlDataSource__ on a __SQL__ select statement or a stored procedure:

	+ Choosing the *"Select Statement"* option allows you to enter a __SQL__ query statement directly in the text box below. Alternatively, you can click *"Query Builder"* to invoke the Visual Studio __Query Builder__ dialog. In the context of the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) the button will invoke the [Query Designer in the Standalone Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/query-designer-in-the-standalone-designer%}). Both are user-friendly interfaces for building __SQL__ queries.
	+ Choosing the *"Stored Procedure"* option allows you to select the name of an existing database stored procedure from the drop-down list below which is responsible for the data retrieval.

	> The `SqlDataSource` is designed to read data from the database but internally it uses the [_DbCommand.ExecuteReader_ method](https://learn.microsoft.com/en-us/dotnet/api/system.data.common.dbcommand.executereader?view=net-8.0) which does not limit the commands that can executed against the database connection. Therefore, the command typed in the `SelectCommand` property will be executed as-is, even if it contains statements such as DELETE, UPDATE, DROP, etc. To prevent potentially unwanted modifications to your database, we strongly recommend using connections with read-only permissions to fetch the data.

1. __Configure Data Source Parameters__ Specify the parameters for the __SQL__ query or stored procedure. Click *"New"* to add a new parameter to the __SqlDataSource__ component or *"Delete"* to remove an existing parameter. Use the arrow buttons to change the order of the parameters when necessary.

	+ Specify a valid name for each data source parameter in the *"Name"* column. You can also choose that name from the list of existing parameter names which are derived directly from the __SQL__ query statement or stored procedure.
	+ Choose the appropriate database type for the parameter in the *"DbType"* column. This type should match exactly the type of the expression in the __SQL__ query statement or the type of the parameter from the stored procedure.
	+ Specify a default value for the parameter in the *"Value"* column or bind it via an expression.

	> You can bind a data source parameter directly to a report parameter. This way you can use the standard report parameter user interface to provide values for your data source parameters. The drop-down list of the *"Value"* column displays all existing report parameters. You can create a new report parameter by choosing *```<New Report Parameter>```* from the list. Alternatively, you can invoke the __Edit Expression__ dialog by choosing `<Expression>` from the list. This allows you to specify an arbitrary expression to evaluate for the parameter value.

1. __Configure Design Time Parameters__ This step allows you to specify a value for each data source parameter that can be used at design time to retrieve the schema of the __SqlDataSource__ component. At design time there is no expression context, so expressions are not supported and the values must be constant.

	> Specifying design time values for the parameters is necessary because the designer might need to execute the __SQL__ query or stored procedure of the data source in order to populate the schema displayed in the __Data Explorer__ tool window and the __Edit Expression__ dialog. These values do not affect the execution of the __SQL__ query at runtime, however.

1. __Preview Data Source Results__ You can preview the result set returned by the __SqlDataSource__ before completing the wizard. Click *Execute Query* to execute the __SQL__ query or stored procedure and display the retrieved data. If the data source has parameters, the wizard displays a popup dialog before each preview, which allows you to enter the parameter values. This is the last step of the wizard. After pressing *"Finish"* the wizard will configure the __SqlDataSource__ component with the specified settings and close.
