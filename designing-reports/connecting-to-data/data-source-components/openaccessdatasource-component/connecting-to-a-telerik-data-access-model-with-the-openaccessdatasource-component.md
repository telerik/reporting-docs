---
title: Connecting to a Telerik Data Access Model with the OpenAccessDataSource component
page_title: Connecting to a Telerik Data Access Model with the OpenAccessDataSource component | for Telerik Reporting Documentation
description: Connecting to a Telerik Data Access Model with the OpenAccessDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/connecting-to-a-telerik-data-access-model-with-the-openaccessdatasource-component
tags: connecting,to,a,telerik,data,access,model,with,the,openaccessdatasource,component
published: True
position: 1
---

# Connecting to a Telerik Data Access Model with the OpenAccessDataSource component



This section discusses how to connect the __OpenAccessDataSource__  component to a __Telerik Data Access Model__ .     	The provided examples and code snippets assume an existing __Telerik Data Access Model__  of the __Adventure Works__       	sample database with the following structure:  

  ![](images/DataSources/OpenAccessDataSourceAdventureWorksEntityModel.png)

## 

The simplest way to configure __OpenAccessDataSource__  in __Report Designer__  is to use        	the [OpenAccessDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard%}). That wizard is started automatically when you create a new __OpenAccessDataSource__ , but you can invoke        	it manually at any time from the context menu associated with the data source by choosing __"Configure"__ :

  

  ![](images/DataSources/OpenAccessDataSourceConfigure.png)

To configure the __OpenAccessDataSource__  component programmatically you need to specify at least an __ObjectContext__        	and a property or a method from that __ObjectContext__  which is responsible for data retrieval. Assign the type of        	the __OpenAccessContext__  to the __ObjectContext__  property of __OpenAccessDataSource__  and the name of the desired member to the        	__ObjectContextMember__  property, as shown in the following example:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=PropertyBindingSnippet}}
````C#
	
	            var openAccessDataSource = new Telerik.Reporting.OpenAccessDataSource();
	
	            openAccessDataSource.ObjectContext = typeof(AdventureWorksEntities);
	            openAccessDataSource.ObjectContextMember = "Products";
	
	            var report = new Report1();
	
	            report.DataSource = openAccessDataSource;
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=PropertyBindingSnippet}}
````VB
	
	        Dim openAccessDataSource As New Telerik.Reporting.OpenAccessDataSource()
	
	        openAccessDataSource.ObjectContext = GetType(AdventureWorksEntities)
	        openAccessDataSource.ObjectContextMember = "Products"
	
	        Dim report As New Report1()
	
	        report.DataSource = openAccessDataSource
	
````



The above code snippet connects the __OpenAccessDataSource__  component to the __AdventureWorksEntities__         	context and retrieves the information for all products from the __Products__  auto-generated property. Instead of specifying a type you can assign a live instance of the __OpenAccessContext__ . In this case however it is        	your responsibility to destroy that __OpenAccessContext__  instance when done with the report:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=InstanceBindingSnippet}}
````C#
	
	            var openAccessDataSource = new Telerik.Reporting.OpenAccessDataSource();
	            var openAccessContext = new AdventureWorksEntities();
	
	            openAccessDataSource.ObjectContext = openAccessContext;
	            openAccessDataSource.ObjectContextMember = "Products";
	
	            var report = new Report1();
	
	            report.DataSource = openAccessDataSource;
	
	            // You have to dispose the OpenAccessContext explicitly when done with the report.
	            openAccessContext.Dispose();
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=InstanceBindingSnippet}}
````VB
	
	        Dim openAccessDataSource As Telerik.Reporting.OpenAccessDataSource = New Telerik.Reporting.OpenAccessDataSource()
	        Dim openAccessContext As AdventureWorksEntities = New AdventureWorksEntities()
	
	        openAccessDataSource.ObjectContext = openAccessContext
	        openAccessDataSource.ObjectContextMember = "Products"
	
	        Dim report As New Report1()
	
	        report.DataSource = openAccessDataSource
	
	        ' You have to dispose the OpenAccessContext explicitly when done with the report.
	        openAccessContext.Dispose()
	
````



Binding to a method is more flexible than binding to a property, because it is possible to execute some        	custom business logic when retrieving data for the report. If the specified method has arguments, the        	__OpenAccessDataSource__  component allows you to pass parameters to those arguments via the __Parameters__  collection.        	For example, let us extend the __AdventureWorksEntities__  context using a partial class that defines the following       	method:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=SampleMethodSnippet}}
````C#
	
	        partial class AdventureWorksEntities
	        {
	            public System.Collections.Generic.List<Product> GetProducts(string color, decimal price)
	            {
	                return this.Products.Where(product => product.Color == color && product.ListPrice <= price).ToList();
	            }
	        }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=SampleMethodSnippet}}
````VB
	
	    Partial Class AdventureWorksEntities
	        Public Function GetProducts(ByVal color As String, ByVal price As Decimal) As System.Collections.Generic.List(Of Product)
	            Return Me.Products.Where(Function(product) product.Color = color And product.ListPrice <= price).ToList()
	        End Function
	    End Class
	
````



You can bind the __OpenAccessDataSource__  component to that method with the following code snippet:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=MethodBindingSnippet}}
````C#
	
	            var openAccessDataSource = new Telerik.Reporting.OpenAccessDataSource();
	
	            openAccessDataSource.ObjectContext = typeof(AdventureWorksEntities);
	            openAccessDataSource.ObjectContextMember = "GetProducts";
	            openAccessDataSource.Parameters.Add("color", typeof(string), "Black");
	            openAccessDataSource.Parameters.Add("price", typeof(decimal), 100);
	
	            var report = new Report1();
	
	            report.DataSource = openAccessDataSource;
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=MethodBindingSnippet}}
````VB
	
	        Dim openAccessDataSource As New Telerik.Reporting.OpenAccessDataSource()
	
	        openAccessDataSource.ObjectContext = GetType(AdventureWorksEntities)
	        openAccessDataSource.ObjectContextMember = "GetProducts"
	        openAccessDataSource.Parameters.Add("color", GetType(String), "Black")
	        openAccessDataSource.Parameters.Add("price", GetType(Decimal), 100)
	
	        Dim report As New Report1()
	
	        report.DataSource = openAccessDataSource
	
````



>note The names and types of the parameters in the  __Parameters__  collection should match exactly the names and  	types of the method arguments. In case this requirement is not fulfilled the  __OpenAccessDataSource__  component will  	not be able to resolve or call correctly the method and will raise an exception at runtime.


# See Also

