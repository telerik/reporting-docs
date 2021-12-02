---
title: Connecting to an Entity Data Model with the EntityDataSource component
page_title: Connecting to an Entity Data Model with the EntityDataSource component | for Telerik Reporting Documentation
description: Connecting to an Entity Data Model with the EntityDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/connecting-to-an-entity-data-model-with-the-entitydatasource-component
tags: connecting,to,an,entity,data,model,with,the,entitydatasource,component
published: True
position: 1
---

# Connecting to an Entity Data Model with the EntityDataSource component



This section discusses how to connect the __EntityDataSource__  component to an      	__Entity Data Model__  in the case of __Database First__  or __Model First__           or directly to the __DbContext__  inheritor  in the case of __Code First__  approach.          The provided examples and code snippets assume an existing         __Entity Data Model__  of the __Adventure Works__  sample database with the following structure:

  

  ![](images/DataSources/EntityDataSourceAdventureWorksEntityModel.png)

## 

The simplest way to configure __EntityDataSource__  in __Report Designer__  is to use        	the [EntityDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard%}). That wizard is started automatically when you create a new __EntityDataSource__ , but you can invoke        	it manually at any time from the context menu associated with the data source by choosing __"Configure"__ :

  

  ![](images/DataSources/EntityDataSourceConfigure.png)

To configure the __EntityDataSource__  component programmatically you need to specify at least an __ObjectContext/DbContext__        	and a property or a method from that __ObjectContext/DbContext__  which is responsible for data retrieval. Assign the type of        	the __ObjectContext/DbContext__  to the __Context__  property of __EntityDataSource__  and the name of the desired member to the        	__ContextMember__  property, as shown in the following example:       	

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



The above code snippet connects the __EntityDataSource__  component to the __AdventureWorksEntities__         	context and retrieves the information for all products from the __Products__  auto-generated property. Instead of specifying a type you can assign a live instance of the __ObjectContext/DbContext__ . In this case however it is        	your responsibility to destroy that __ObjectContext/DbContext__  instance when done with the report:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=InstanceBindingSnippet}}
````C#
	
	            var entityDataSource = new Telerik.Reporting.EntityDataSource();
	            var context = new AdventureWorksEntities();
	
	            entityDataSource.Context = context;
	            entityDataSource.ContextMember = "Products";
	
	            var report = new Report1();
	
	            report.DataSource = entityDataSource;
	
	            // You have to dispose the Context explicitly when done with the report.
	            context.Dispose();
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=InstanceBindingSnippet}}
````VB
	
	        Dim entityDataSource As New Telerik.Reporting.EntityDataSource()
	        Dim context As New AdventureWorksEntities()
	
	        entityDataSource.Context = context
	        entityDataSource.ContextMember = "Products"
	
	        Dim report As New Report1()
	
	        report.DataSource = entityDataSource
	
	        ' You have to dispose the context explicitly when done with the report.
	        context.Dispose()
	
````



Binding to a method is more flexible than binding to a property, because it is possible to execute some        	custom business logic when retrieving data for the report. If the specified method has arguments, the        	__EntityDataSource__  component allows you to pass parameters to those arguments via the __Parameters__  collection.        	For example, let us extend the __AdventureWorksEntities__  context using a partial class that defines the following       	method:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=SampleMethodSnippet}}
````C#
	
	        partial class AdventureWorksEntities
	        {
	            public System.Collections.Generic.List<Product> GetProducts(string color, decimal price)
	            {
	                return this.Products.Where(product => product.Color == color && product.ListPrice <= price).ToList();
	            }
	        }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=SampleMethodSnippet}}
````VB
	
	    Partial Class AdventureWorksEntities
	        Public Function GetProducts(ByVal color As String, ByVal price As Decimal) As System.Collections.Generic.List(Of Product)
	            Return Me.Products.Where(Function(product) product.Color = color And product.ListPrice <= price).ToList()
	        End Function
	    End Class
	
````



You can bind the EntityDataSource component to that method with the following code snippet:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=MethodBindingSnippet}}
````C#
	
	            var entityDataSource = new Telerik.Reporting.EntityDataSource();
	
	            entityDataSource.Context = typeof(AdventureWorksEntities);
	            entityDataSource.ContextMember = "GetProducts";
	            entityDataSource.Parameters.Add("color", typeof(string), "Black");
	            entityDataSource.Parameters.Add("price", typeof(decimal), 100);
	
	            var report = new Report1();
	
	            report.DataSource = entityDataSource;
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=MethodBindingSnippet}}
````VB
	
	        Dim entityDataSource As New Telerik.Reporting.EntityDataSource()
	
	        entityDataSource.Context = GetType(AdventureWorksEntities)
	        entityDataSource.ContextMember = "GetProducts"
	        entityDataSource.Parameters.Add("color", GetType(String), "Black")
	        entityDataSource.Parameters.Add("price", GetType(Decimal), 100)
	
	        Dim report As New Report1()
	
	        report.DataSource = entityDataSource
	
````



>note The names and types of the parameters in the  __Parameters__  collection should match exactly the names and  	types of the method arguments. In case this requirement is not fulfilled the  __EntityDataSource__  component will  	not be able to resolve or call correctly the method and will raise an exception at runtime.


# See Also

