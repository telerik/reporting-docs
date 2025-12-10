---
title: Connect to SQL Database
page_title: Connecting to a SQL Database at a Glance
description: "Learn how to Connect the SqlDataSource Component to a SQL Database in Telerik Reporting in this step-by-step tutorial."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/how-to-connect-to-a-sql-database
tags: how,to,connect,to,a,sql,database
published: True
position: 4
previous_url: /how-to-sqldatasource-connect-sql-database
reportingArea: General
---

# Connecting the SqlDataSource Component to a SQL Database

You can connect to a SQL database using the Telerik `SqlDataSource` component. To do this, you need a valid .NET data provider, connection string and access rights to the SQL database. Then, you can use the SqlDataSource component to provide data to [data items (Report, Table, Graph, Map)]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}).

## To connect to a SQL database using the SqlDataSource component

1. Open a Telerik Reporting in a [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/overview%})

	+ __In Microsoft Visual Studio__ : From the Telerik Reporting {{site.suiteversion}} group in the Toolbox, select the SqlDataSource component and click on the design surface to add it to the Report.
	+ __In the Standalone Report Designer__ : Select *SQL Data Source* from the *Data tab*.

	The __SqlDataSource Wizard__ should be started automatically. For already existing SqlDataSource components in the report, select `'Configure...'` from the component's Context Menu.

1. __Choose Data Connection__ dialog box appears.
1. Click __Build New Data Connection__ to add the connection string to the SQL database:

	>The __Data provider__ drop-down lists the installed and registered on the machine.NET data providers. The.NET data provider determines the syntax of connection string, the syntax of SQL query, and what ADO.NET classes will be used by the SqlDataSource component to create a connection and to execute the SQL command. The.NET data provider must be considered with the type of the SQL database you intend to use.

	1. Open the __Data provider__ drop-down and select the.NET data provider suitable for the target SQL database.
	1. In the __Connection string__ text-box, type the prepared and tested connection string or click the `Build...` button.

		If you click the `Build...` button, you should see the __Connection Properties__ dialog:

		+ __Data source:__ shows the type of data source that will be used, based on the selected.NET data provider. The value should be filled automatically, if a valid.NET provider is set through the __Data provider__ drop-down.
		+ __Data source box:__ Shows the type of data source that will be used, based on the selected.NET data provider.
		+ __Server name box:__ Enter the address or name for your SQL Server instance.
		+ __Logon to the server/database__ : Enter the logon credentials, or if it is supported by the.NET data provider, select to 'Use Windows Authentication'. Select the option that is appropriate for accessing and running the SQL Server database. The settings are turned into standard connection strings attributes. For more details, check [The Connection Strings Reference](https://www.connectionstrings.com/).
		+ __Select or enter a database name:__ The option depends on the selected.NET data provider and the required attributes for building the connection string. If the option is visible, enter a valid database on the server e.g. __AdventureWorks__ (MSSQL database used by Telerik Reporting local examples).

	At the end, click `Test connection` to verify that your connection works. Click `OK`. You should see the connection string's attributes written in the __Connection string__ text-box.

	>Not all connection strings can be built with the __Connection Properties__ dialog, and in such cases the `Build...` button remains disabled. The connection string will have to be typed manually.

	For our tutorial we will connect to AdventureWorks database installed on MSSQL server instance:

	1. Select __Build new data connection__.
	1. Open the __Data provider__ drop-down and select __SqlClient Data Provider__.
	1. Click the `Build...` button.

		+ __Data source__ should state *Microsoft SQL Server (SqlClient)*. Do not change it.
		+ In the __Server name box__ select the named MSSQL server instance having the AdventureWorks database e.g. __(local)\sqlexpress__.
		+ Select __Use Windows Authentication__ for the __Logon to the server__ setting. In case of using specififc user to log on the MSSQL server instance, select *Use SQL Server Authentication* and enter your credentials (username/password).
		+ Type *AdventureWorks* in the __Select or enter a database name__ box.

		Finally, click `Test Connection` to verify you can connect to the database.

	1. Click the `OK` button, and in the __Connection string__ text-box you should see a string like `Data Source=(local)\sqlexpress;Initial Catalog=AdventureWorks;Integrated Security=True* or *Data Source=(local)\sqlexpress;Initial Catalog=AdventureWorks;User ID=admin;Password=admin123`

1. Click `Next` to continue to the __Data Connection Options__ dialog. Where you can:

	+ Select __Use a shared connection__, which option saves the connection string by the name typed in the __Alias__ box, in the current project's CONFIG file, under the `connectionStrings` element.

		This will let you reuse the connection string for other SqlDataSource components. The Reporting Engine uses a [ConfigurationManager(msdn)](https://learn.microsoft.com/en-us/dotnet/api/system.configuration.configurationmanager?view=dotnet-plat-ext-7.0) to search connection strings by name in the current project's configuration file.

	+ Select __Embed in the report definition__, which option saves the connection string the way it is written in the __Connection string__ text-box as `SqlDataSource.ConnectionString` property.

	For the purpose of this tutorial, we will use the __Use a shared connection__ option. Type `AdventureWorksConnection` as *Alias*.

	Click `Next`.

1. Follows the __Configure data source command__ dialog.

	+ __Select Statement:__ Use this option to type a standard SQL query. You can use the `Query Builder` button to design the SQL query through the available UI.

		The Visual Studio Report Designer uses the IDE's Query Builder, where the Standalone Report Designer uses its own implementation of a [Query Builder]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/query-designer-in-the-standalone-designer%}).

	+ __Stored Procedure:__ Use this option to select a stored procedure existing in the connected SQL database. If the stored procedure is not discovered, you can type its name manually e.g. `dbo.GetNotes`.

	In this tutorial we will use the __Select Statement__ option. Type the following SQL query:

	````SQL
SELECT * FROM [HumanResources].[Department] WHERE [HumanResources].[Department].[DepartmentID]=@ID
````

	> If the SQL query returns more than one set of data, only the first result will be used. Test running the SQL query on the SQL server database to verify the syntax.

1. If the entered SQL query contains SQL parameters, recognizable by the.NET data provider, clicking the Next button will navigate you to the __Configure data source parameters__ step. You should see listed the recognized SQL parameters and their DbType in a grid. In the Value column you can specify static value, report parameter, field, or other expression which once evaluated will be passed to the SQL query.

	In this tutorial we use a parameterized SQL query and you should see the __Configure data source parameters__ window of the wizard. There must be one row in the grid:

	+ `Name` showing the SQL parameter's name, written in TSQL: `@ID`;
	+ `DbType` showing the SQL parameter's discovered type: `String` (if no other specified). Change it to Int64 that can be mapped by an Integer report parameter.
	+ Click the cell under the `Value` column and select the *New Report Parameter* option. In the [Report Parameter Editor]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/reportparameter-collection-editor%}) will be loaded default information about the newly created report parameter, where you can set `Type=Integer` and `Visible=True`. Click `OK` to confirm the changes and to create the report parameter.

		Click `Next` to navigate to the __Configure design time parameters__ step. Enter design-time (constant) value to evaluate the SQL query and get the data fields in the Report Designer e.g. type `1`.

	Click `Next`.

1. To test your query, click `Next`, and then click `Execute Query` in the __Preview data source results__ step of the wizard.
1. Click `Finish`. The SqlDataSource Wizard would close and the SqlDataSource component would be ready for use by the data items.

## See Also

* [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%})
* [Using Parameters with the SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%})
* [The Connection Strings Reference](https://www.connectionstrings.com/)
* [Data provider is missing in the SqlDataSource wizard]({%slug data-provider-is-missing-in-the-sqldatasource-wizard%})
* [How to use MultiValue Report Parameter in a SQL query]({%slug how-to-use-multivalue-report-parameter-in-a-sql-query%})
* [How to configure Stored Procedure with Temporary Tables for use with SqlDataSource component]({%slug use-temporary-tables-in-stored-procedure%})
