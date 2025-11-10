---
title: CubeDataSource Wizard
page_title: CubeDataSource Wizard at a Glance
description: "Learn more about the CubeDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the CubeDataSource properties with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/cubedatasource-wizard
tags: cubedatasource,wizard
published: True
position: 90
previous_url: /cubedatasource-wizard
reportingArea: General
---

# CubeDataSource Wizard of the Report Designer

After the __CubeDataSource__ wizard appears you have to perform the following steps:

1. __Choose your data connection__ In this step you have to specify a data connection for the __CubeDataSource__ component. There are two possible options for specifying the data connection:

	+ __Choose an existing data connection__ - selecting this option allows you to specify an existing data connection stored in the configuration file of the current project from the drop-down list.

		>The connection string stored in the configuration file of the report class library is used only during design time. When running the report in production it is necessary to copy that connection string to the corresponding configuration file of your application or web site as well.

	+ __Specify a new connection string__ – selecting this option allows you to enter a new connection string directly in the text area below. Instead of typing the connection string manually you can click *"Build"* to open the __Connection Properties__ dialog and configure a new database connection there. Enter the name of the database server in the *"Server name"* field and choose your cube database from the *"Database name"* list. Click *"Test connection"* to verify that the connection is valid and the chosen database is available. When done with the dialog click *"OK"* to close it and accept the new connection.

1. __Save the connection string__ This step appears only if you have specified a new connection string in the previous one. Choose *"Yes, save the connection with the following name"* to store the connection string in the application configuration file under a specific name. Type a name for the connection or use the provided default name if applicable.

	>Saving the connection string in the application configuration file simplifies the process of maintaining your application if the database connection changes. In the event of a change in the database connection you can edit the connection string in the application configuration file as opposed to editing the source code and having to recompile your application.

1. __Configure data source command__ In this step you have to specify an __MDX__ select statement to retrieve data for the data source.

	> The __CubeDataSource__ component does not impose any restrictions over the format of the __MDX__ query. However, to ensure that the retrieved data is in a proper format for visualization you should follow the next rule: specify the measures you want to aggregate in the column axis and the dimensions to group by in the row axis of the query; also avoid using more than two axes in a single query.

1. __Configure data source parameters__ In this step you have to specify the parameters for the __MDX__ query. Click *"New"* to add a new parameter to the __CubeDataSource__ or *"Delete"* to remove an existing parameter. Use the arrow buttons to change the order of the parameters when necessary.

	+ Specify a valid name for each data source parameter in the *"Name"* column. You can also choose that name from the list of existing parameter names which are derived directly from the __MDX__ select statement.
	+ Specify a default value for the parameter in the __"Value"__ column or bind it via an expression. You can bind a data source parameter directly to a report parameter. This way you can use the standard report parameter user interface to provide values for your data source parameters. The drop-down list of the *"Value"* column displays all existing report parameters. You can create a new report parameter by choosing `<New Report Parameter>` from the list. Alternatively you can invoke the __Edit Expression__ dialog by choosing `<Expression>` from the list. This allows you to specify an arbitrary expression to evaluate for the parameter.

1. __Configure design time parameters__ This step allows you to specify a value for each data source parameter that can be used at design time to retrieve the schema of the __CubeDataSource__ component. At design time there is no expression context, so expressions are not supported and the values must be constant.

	> Specifying design time values for the parameters is necessary because the designer might need to execute the __MDX__ query of the data source to refresh the schema displayed in the __Data Explorer__ tool window and the __Edit Expression__ dialog. These values do not affect the execution of the __MDX__ query at runtime however.

1. __Configure data source fields__ This step allows you to specify short aliases for the data source fields that can be used for data binding in expressions. Enter an appropriate alias for each data source field in the *"Alias"* column of the grid or leave the default suggestion if applicable.

	> The default fields returned by an __MDX__ query often are too long and might need to be escaped when used in expressions. To overcome this it is advised to always specify shorter and more descriptive aliases for them.

1. __Preview data source results__ You can preview the result set returned by the __CubeDataSource__ before completing the wizard. Click *"Execute Query"* to execute the __MDX__ query and display the retrieved data. If the data source has parameters the wizard displays a pop-up dialog before each preview which allows you to enter the parameter values. This is the last step of the wizard. After pressing *"Finish"* the wizard will configure the __CubeDataSource__ component with the specified settings and close.
