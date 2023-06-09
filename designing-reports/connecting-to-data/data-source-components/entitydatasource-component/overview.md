---
title: Overview
page_title: EntityDataSource Component at a Glance
description: "Learn more about the EntityDataSource Component in Telerik Reporting and how to use it in your reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview
tags: overview
published: True
position: 0
previous_url: /EntityDataSource
---

# EntityDataSource Component Overview

The `EntityDataSource` component enables data items to connect to an [ADO.NET Entity Data Model](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/entity-data-model). This allows seamless integration of __Telerik Reporting__ with applications or web sites that utilize the [ADO.NET Entity Framework](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/ef/overview). There are several main benefits when using the `EntityDataSource` component for connecting to an __Entity Data Model__:

* __Dedicated design-time support:__ the `EntityDataSource` component has its own set of design-time editors, tool windows, and a configuration wizard. In addition to this, `EntityDataSource` adds support for entity schema in __Data Explorer__ and live data preview of the report in __Report Designer__.
* __Configuring database connectivity:__ the `EntityDataSource` component offers an additional level of control over the database connectivity of the Entity Data Model. You can specify a connection string or a named connection from the configuration file of the main application or web site. That ensures `EntityDataSource` can establish a valid database connection both at design-time and when running the report in production.
* __Maintaining ObjectContext/DbContext lifecycle:__ the `EntityDataSource` component allows the option to maintain the entire lifecycle of the `ObjectContext` or `DbContext` automatically. It can create its own instance of one of the two contexts internally, keep it alive for the duration of the report generation process, and then destroy it automatically when it is no longer needed by the reporting engine.

	> When using `DbContext` by default the context class generated (Database First or Model First) provides only a default (parameterless) constructor. However for design time purposes a constructor with connection string (string argument) is needed so that while processing the report the correct connection string can be passed. If Code First is used there is no need for a constructor with string parameter. That is because this approach uses connection strings without metadata (which is needed for the mapping). This means that the connection string of the context can be directly set to this connection string, without the need to be resolved first. Adding the needed constructor is as simple as it is adding the snippet below:

	````CSharp
partial class AdventureWorksContext
	{
		public AdventureWorksContext(string connectionString) : base(connectionString) {}
	}
````
	````VB
Partial Class AdventureWorksContext
		Public Sub New(connectionString As String)
			MyBase.New(connectionString)
		End Sub
	End Class
````


> In order to use the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) and [Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}) the Entity Data Model should be located in a separate class library. The connectionString to the database should be copied to the config file of the report class library for the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}) and Preview to work.

## Supported developer platforms

* .NET Framework 4.0 and above
