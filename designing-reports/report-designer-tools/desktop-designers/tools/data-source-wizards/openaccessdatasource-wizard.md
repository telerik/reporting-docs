---
title: OpenAccessDataSource Wizard
page_title: OpenAccessDataSource Wizard at a Glance
description: "Learn more about the OpenAccessDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the OpenAccessDataSource properties with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard
tags: openaccessdatasource,wizard
published: True
position: 70
previous_url: /openaccessdatasource-wizard
reportingArea: General
---

# OpenAccessDataSource Wizard of the Report Designer

After the __OpenAccessDataSource__ wizard appears you have to perform the following steps:

1. __Choose your data connection__ In this step you have to specify a data connection for the __OpenAccessDataSource__ component. Choose an existing connection from the list or click *"New Connection"* to create a new connection to your database. The *"Connection String"* text area displays a read-only information about the selected connection string.

1. __Save the connection string__ This step appears only if you have specified a new connection string in the previous one. Choose *"Yes, save the connection with the following name"* to store the connection string in the application configuration file under a specific name. Type a name for the connection or use the provided default name if applicable.

	> Saving the connection string in the application configuration file simplifies the process of maintaining your application if the database connection changes. In the event of a change in the database connection you can edit the connection string in the application configuration file as opposed to editing the source code and having to recompile your application.

1. __Choose an object context__ In this step you have to specify an existing __OpenAccessContext__ that is responsible for accessing your entity data model. The available __OpenAccessContext__ types are organized in a hierarchical manner grouped by namespace:

	> If the desired __OpenAccessContext__ type does not appear in the list make sure the current project is built and all necessary project references are added.

1. __Choose an object context member__ In this step you have to specify a member of the chosen __OpenAccessContext__ that is responsible for data retrieval. You can choose either a property that returns the desired entities directly or a method that executes some business logic against the __Open Access__ model to obtain the required data for the report.

	> If the chosen member does not have any parameters, this is the last step of the wizard. However, if the specified member is a method with parameters, the next step allows you to configure those parameters.

1. __Configure data source parameters__ Each argument of the selected method corresponds to a data source parameter. This step allows you to specify for each parameter a constant value, an expression, or create a new __ReportParameter__ and the expression will be set automatically to it.

	> The names and types of the defined parameters should match exactly the arguments of the selected method. In case this requirement is not fulfilled the  __OpenAccessDataSource__ component will not be able to resolve or call correctly the method and will raise an exception at runtime.

This is the last step of the wizard. After pressing the __Finish__ button the wizard will configure the __OpenAccessDataSource__ component with the specified settings and close.
