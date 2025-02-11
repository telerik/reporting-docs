---
title: EntityDataSource Wizard
page_title: EntityDataSource Wizard at a Glance
description: "Learn more about the EntityDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the EntityDataSource properties with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard
tags: entitydatasource,wizard,designer,data,item
published: True
position: 80
previous_url: /entitydatasource-wizard
---

# EntityDataSource Wizard of the Report Designer

After the EntityDataSource wizard appears you have to perform the following steps:

1. __Choose your data connection__ In this step you have to specify a data connection for the __EntityDataSource__ component. There are two possible options for specifying the data connection:

	+ __Choose an existing data connection__ – selecting this option allows you to specify an existing data connection stored in the configuration file of the current project from the drop-down list.

		> The drop-down list displays only data connections that are stored in the configuration file of the current project. If your entity data model is located in a different project from the report class library, you have to copy the appropriate connection string to the configuration file of the report library to make it appear in the wizard. The connection string stored in the configuration file of the report class library is used only during design time. When running the report in production it is necessary to copy that connection string to the corresponding configuration file of your application or web site as well.

	+ __Specify a new connection string__ – selecting this option allows you to enter a new connection string directly in the text area below.

		> This option is useful for testing purposes only. Embedding the connection string directly in the reports is not recommended, because it might prove difficult to maintain all your reports later, when that connection string changes. The recommended approach is to store your connection string in the configuration file of the report class library and then choose it by name from the drop-down list.

1. __Save the connection string__ This step appears only if you have specified a new connection string in the previous one. Choose *"Yes, save the connection with the following name"* to store the connection string in the application configuration file under a specific name. Type a name for the connection or use the provided default name if applicable.

	> Saving the connection string in the application configuration file simplifies the process of maintaining your application if the database connection changes. In the event of a change in the database connection you can edit the connection string in the application configuration file as opposed to editing the source code and having to recompile your application.

1. __Choose a context__ In this step you have to specify an existing __ObjectContext/DbContext__ that is responsible for accessing your entity data model. The available __ObjectContext/DbContext__ types are organized in a hierarchical manner grouped by namespace.

	> If the desired __ObjectContext/DbContext__ type does not appear in the list make sure the current project is built and all necessary project references are added.

1. __Choose a context member__ In this step you have to specify a member of the chosen __ObjectContext/DbContext__ that is responsible for data retrieval. You can choose either a property that returns the desired entities directly or a method that executes some business logic against the entity data model to obtain the required data for the report.

	> If the chosen member does not have any parameters, this is the last step of the wizard. However, if the specified member is a method with parameters, the next step allows you to configure those parameters.

1. __Configure data source parameters__ Each argument of the selected method corresponds to a data source parameter. This step allows you to specify for each parameter a constant value, an expression, or create a new __ReportParameter__ and the expression will be set automatically to it.

	> The names and types of the defined parameters should match exactly the arguments of the selected method. In case this requirement is not fulfilled the  __EntityDataSource__ component will not be able to resolve or call correctly the method and will raise an exception at runtime.

1. __Configure Design Time Parameters__ This step allows you to specify a value for each data source parameter that can be used at design time to retrieve the schema of the __EntityDataSource__ component. At design time there is no expression context, so expressions are not supported and the values must be constant.

	> Specifying design time values for the parameters is necessary because the designer might need to execute the methods in order to populate the schema displayed in the __Data Explorer__ tool window and the __Edit Expression__ dialog. These values do not affect the execution of the methods at runtime however.

This is the last step of the wizard. After pressing the __Finish__ button the wizard will configure the __EntityDataSource__ component with the specified settings and close.
