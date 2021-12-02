---
title: EntityDataSource Component Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview
tags: overview
published: True
position: 0
---

# EntityDataSource Component Overview



The __EntityDataSource__  component enables data items to connect to an  [ADO.NET Entity Data Model](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/entity-data-model) .      	This allows seamless integration of __Telerik Reporting__  with applications or web sites that utilize      	the  [ADO.NET Entity Framework](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/ef/overview) . There are several main benefits when using the __EntityDataSource__       	component for connecting to an __Entity Data Model__ :

*  __Dedicated design-time support:__  the __EntityDataSource__  component has its own set of design-time editors,
	tool windows, and a configuration wizard. In addition to this, __EntityDataSource__  adds support for entity schema
	in __Data Explorer__  and live data preview of the report in __Report Designer__  .

*  __Configuring database connectivity:__  the __EntityDataSource__  component offers an additional level of 
	control over the database connectivity of the Entity Data Model. You can specify a connection string or a named 
	connection from the configuration file of the main application or web site. That ensures __EntityDataSource__  can 
	establish a valid database connection both at design-time and when running the report in production.

*  __Maintaining ObjectContext/DbContext lifecycle:__  the __EntityDataSource__  component allows 
	the option to maintain the entire lifecycle of the __ObjectContext__  or __DbContext__  automatically. It can create its own
    instance of one of the two contexts internally, keep it alive for the duration of the report generation process,
    and then destroy it automatically when it is no longer needed by the reporting engine.

   >note     When using  __DbContext__  by default the context class generated (Database First or Model First) provides only a default (parameterless) constructor.      However for design time purposes a constructor with connection string (string argument) is needed so that while processing the report the correct      connection string can be passed.      If Code First is used there is no need for a constructor with string parameter.      That is because this approach uses connection strings without metadata (which is  needed for the mapping). This means that the connection string of the context can be directly set to this connection string, without the need to be resolved first.      Adding the needed constructor is as simple as it is adding the snippet below:    

	
      ````C#

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




>note In order to use the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) and [Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%})           the Entity Data Model should be located in a separate class library. The connectionString to the database should be copied to the config file of the report class           library for the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}) and Preview to work.         


## Supported developer platforms

* .NET Framework 4.0 and above             

# See Also

