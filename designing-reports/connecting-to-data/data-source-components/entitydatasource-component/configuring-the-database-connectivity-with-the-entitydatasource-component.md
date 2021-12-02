---
title: Configuring the database connectivity with the EntityDataSource component
page_title: Configuring the database connectivity with the EntityDataSource component | for Telerik Reporting Documentation
description: Configuring the database connectivity with the EntityDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/configuring-the-database-connectivity-with-the-entitydatasource-component
tags: configuring,the,database,connectivity,with,the,entitydatasource,component
published: True
position: 3
---

# Configuring the database connectivity with the EntityDataSource component



This section discusses how to specify a database connection to the __EntityDataSource__  component      	that can be used both at design-time and when running the report in production. The provided examples      	and code snippets assume an existing __Entity Data Model__  of the __Adventure Works__  sample database with the      	following structure:

  

  ![](images/DataSources/EntityDataSourceAdventureWorksEntityModel.png)

## 

Strictly speaking, it is not necessary to specify a database connection when working with the        	__EntityDataSource__  component. Simply specifying an __ObjectContext/DbContext__  and a member is enough to connect to        	the __Entity Data Model__ , because the __ObjectContext/DbContext__  is already configured to access the database. The        	following code snippet shows the minimum code necessary to setup the __EntityDataSource__  component:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=PropertyBindingSnippet}}
````C#
	
	            var entityDataSource = new Telerik.Reporting.EntityDataSource();
	
	            entityDataSource.Context = typeof(AdventureWorksEntities);
	            entityDataSource.ContextMember = "Products";
	
	            var report = new Report1();
	
	            report.DataSource = entityDataSource;
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=PropertyBindingSnippet}}
````VB
	
	        Dim entityDataSource As New Telerik.Reporting.EntityDataSource()
	
	        entityDataSource.Context = GetType(AdventureWorksEntities)
	        entityDataSource.ContextMember = "Products"
	
	        Dim report As New Report1()
	
	        report.DataSource = entityDataSource
	
````



When running the report in production the above code should work just fine. However, this is not        	the case when generating a preview of the same report in the designer, for example. The problem is that        	the __ObjectContext/DbContext__  searches its connection string in the configuration file of the current executing        	application or web site. When it is your application that is currently running, all that is necessary        	is to make sure the connection string is present in the right configuration file. On the other side,        	when running the report in the designer, the current executing application is __Microsoft Visual Studio__ ,        	so the connection string is no longer available. To overcome this, you can specify your connection        	string to the __ConnectionString__  property of the __EntityDataSource__  component, as shown in the following        	example:         

>note            When using  __DbContext__  by default the context class generated (Database First or Model First) provides only a default (parameterless) constructor.           However for design time purposes a constructor with connection string (string argument) is needed so that while processing the report the correct           connection string can be passed.           If Code First is used there is no need for a constructor with string parameter.           That is because this approach uses connection strings without metadata (which is  needed for the mapping). This means that the connection string of the context can be directly set to this connection string, without the need to be resolved first.           Adding the needed constructor is as simple as it is adding the snippet below:         


	
````C#
partial class AdventureWorksContext           {             public AdventureWorksContext(string connectionString) : base(connectionString) {}           }````
````VB
Partial Class AdventureWorksContext             Public Sub New(connectionString As String)               MyBase.New(connectionString)             End Sub           End Class````
{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=ConnectionStringSnippet}}
````C#
	
	            Telerik.Reporting.EntityDataSource entityDataSource = new Telerik.Reporting.EntityDataSource();
	
	            entityDataSource.ConnectionString = "AdventureWorksConnection";
	            entityDataSource.Context = typeof(AdventureWorksEntities);
	            entityDataSource.ContextMember = "Products";
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=ConnectionStringSnippet}}
````VB
	
	        Dim entityDataSource As Telerik.Reporting.EntityDataSource = New Telerik.Reporting.EntityDataSource()
	
	        entityDataSource.ConnectionString = "AdventureWorksConnection"
	        entityDataSource.Context = GetType(AdventureWorksEntities)
	        entityDataSource.ContextMember = "Products"
	
	        Dim report As New Report1()
	
	        report.DataSource = entityDataSource
	
````



The __ConnectionString__  property can accept an inline connection string or the name of an existing        	connection string stored in the configuration file. When running the report __EntityDataSource__  searches        	the configuration file for a connection string with the specified name. If such connection string exists       	__EntityDataSource__  uses that connection string to connect to the database otherwise it is assumed that the       	value of the __ConnectionString__  property represents an inline connection string. 

>note Specifying an inline connection string directly to the  __ConnectionString__  property of the  	 __EntityDataSource__  component is not recommended, because it might be difficult to maintain all your reports  	later, when that connection string changes. The recommended approach is to always specify the name of an  	existing connection string stored in the configuration file. When specifying a connection string form a  	configuration file it is important to understand which configuration file is used at design-time or when  	running the report in production. For example, let us consider the following simplified structure of a  	business application:  

  ![](images/DataSources/BusinessApplicationStructure.png)The above schema assumes that the different parts of the business application are represented as  	separate projects in the solution, each with its own configuration file. Initially, when you create the  	 __Entity Data Model__  in the  __Business Logic__  project, the connection string is stored automatically in the  	configuration file of that project. Later, when creating new reports in the  __Report Library__  project, you need  	to add the connection string to the configuration file of that project, because this is where  __Report Designer__  	searches for existing connection strings. Finally, when deploying your application or web site in production, 	you need to add the connection string to the configuration file of your  __Main Application__ .


# See Also

