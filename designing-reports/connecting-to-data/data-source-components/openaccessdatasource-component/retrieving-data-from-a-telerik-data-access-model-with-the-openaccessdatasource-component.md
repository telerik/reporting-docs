---
title: Retrieving data from a Telerik Data Access Model with the OpenAccessDataSource component
page_title: Retrieving data from a Telerik Data Access Model with the OpenAccessDataSource component | for Telerik Reporting Documentation
description: Retrieving data from a Telerik Data Access Model with the OpenAccessDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/retrieving-data-from-a-telerik-data-access-model-with-the-openaccessdatasource-component
tags: retrieving,data,from,a,telerik,data,access,model,with,the,openaccessdatasource,component
published: True
position: 5
---

# Retrieving data from a Telerik Data Access Model with the OpenAccessDataSource component



This section discusses various techniques for retrieving data from a __Telerik Data Access Model__  with the help      	of the __OpenAccessDataSource__  component. The provided examples and code snippets assume an existing __Telerik Data Access Model__       	of the __Adventure Works__  sample database with the following structure:

  

  ![](images/DataSources/OpenAccessDataSourceAdventureWorksEntityModel.png)

## 

The simplest approach to extract entities from a __Telerik Data Access Model__  is to bind the __OpenAccessDataSource__  component        	directly to an auto-generated property of the model, as shown in the sample code below:       	

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



You can specify expressions to the data item to group, sort or filter the selected entities. The        	expressions are evaluated on the application level by the reporting engine after all entities are downloaded       	from the database. Sometimes it is preferable to offload certain tasks on the database level instead. To do        	this you need to define a custom method in the __OpenAccessContext__  class that performs the required business logic.        	For example, the following method uses the __Where__  extension method to filter the __Product__  entities:       	

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



Using a method instead of a property has the additional benefit that you can pass data source parameters to it,        	as illustrated in the following code snippet:       	

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



Another common problem is related to the lazy loading feature of __Telerik Data Access__ . For example, let us        	consider the following expression that obtains the category of a given product

=Fields.ProductSubcategory.ProductCategory.Name

The above expression relies upon the built-in lazy loading mechanism to obtain the __ProductSubcategory__         	entity for the current __Product__  entity via the corresponding relation property, and then the __ProductCategory__         	entity for the current __ProductSubcategory__  entity. While convenient, lazy loading requires additional round-trips       	to the database for the entities that are not present in memory. If this happens frequently it might significantly        	impact the performance of the report. To overcome this you need to query all entities needed for the report at once. This way lazy         	loading is avoided completely and all data is retrieved in a single round-trip from the database.         The most flexible and efficient method for retrieving data from the __Telerik Data Access Model__  is to execute a custom      	query against the entities. The following sample method uses a __LINQ__  query to obtain only the necessary data         	for the report and then packs it into a collection of __POCOs__ : 



{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=LinqQuerySnippet}}
````C#
	
	        public class ReportData
	        {
	            public string CategoryName { get; set; }
	            public string SubcategoryName { get; set; }
	            public string ProductName { get; set; }
	            public decimal ListPrice { get; set; }
	        }
	
	        partial class AdventureWorksEntities
	        {
	            public System.Collections.Generic.List<ReportData> GetProducts(string category, string subcategory)
	            {
	                var result = from productCategory in this.ProductCategories
	                             where productCategory.Name.StartsWith(category)
	                             from productSubcategory in productCategory.ProductSubcategories
	                             where productSubcategory.Name.StartsWith(subcategory)
	                             from product in productSubcategory.Products
	                             select new ReportData
	                             {
	                                 CategoryName = productCategory.Name,
	                                 SubcategoryName = productSubcategory.Name,
	                                 ProductName = product.Name,
	                                 ListPrice = product.ListPrice
	                             };
	
	                return result.ToList();
	            }
	        }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=LinqQuerySnippet}}
````VB
	
	    Public Class ReportData
	        Public Property CategoryName As String
	        Public Property SubcategoryName As String
	        Public Property ProductName As String
	        Public Property ListPrice As Decimal
	    End Class
	
	    Partial Class AdventureWorksEntities
	        Public Function GetProducts(ByVal category As String, ByVal subcategory As String) As System.Collections.Generic.List(Of ReportData)
	            Dim result = From productCategory In Me.ProductCategories
	                         Where productCategory.Name.StartsWith(category)
	                         From productSubcategory In productCategory.ProductSubcategories
	                         Where productCategory.Name.StartsWith(subcategory)
	                         From product In productSubcategory.Products
	                         Select New ReportData With
	                         {
	                             .CategoryName = productCategory.Name,
	                             .SubcategoryName = productSubcategory.Name,
	                             .ProductName = product.Name,
	                             .ListPrice = product.ListPrice
	                         }
	
	            Return result.ToList()
	        End Function
	    End Class
	
````



The sample code that binds the OpenAccessDataSource component to that method is shown here:       	

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=LinqBindingSnippet}}
````C#
	
	            var openAccessDataSource = new Telerik.Reporting.OpenAccessDataSource();
	
	            openAccessDataSource.ObjectContext = typeof(AdventureWorksEntities);
	            openAccessDataSource.ObjectContextMember = "GetProducts";
	            openAccessDataSource.Parameters.Add("category", typeof(string), "Bike");
	            openAccessDataSource.Parameters.Add("subcategory", typeof(string), "Road");
	
	            var report = new Report1();
	
	            report.DataSource = openAccessDataSource;
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=LinqBindingSnippet}}
````VB
	
	        Dim openAccessDataSource As New Telerik.Reporting.OpenAccessDataSource()
	
	        openAccessDataSource.ObjectContext = GetType(AdventureWorksEntities)
	        openAccessDataSource.ObjectContextMember = "GetProducts"
	        openAccessDataSource.Parameters.Add("category", GetType(String), "Bike")
	        openAccessDataSource.Parameters.Add("subcategory", GetType(String), "Road")
	
	        Dim report As New Report1()
	
	        report.DataSource = openAccessDataSource
	
````



# See Also

