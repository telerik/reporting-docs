---
title: Retrieving Data from an Entity Data Model
page_title: Retrieving data from an Entity Data Model with the EntityDataSource
description: "Learn how to retrieve data from an Entity Data Model with the EntityDataSource component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/retrieving-data-from-an-entity-data-model-with-the-entitydatasource-component
tags: retrieving,data,from,an,entity,data,model,with,the,entitydatasource,component
published: True
position: 5
previous_url: /entitydatasource-retrieving-data-from-an-entity-data-model
---

# Retrieving Data from an Entity Data Model with the EntityDataSource Component

This section discusses various techniques for retrieving data from an __Entity Data Model__ with the help of the `EntityDataSource` component. The provided examples and code snippets assume an existing __Entity Data Model__ of the __Adventure Works__ sample database with the following structure:

![The structure of the Entity Data Model of the Adventure Works sample database we are going to use in the examples](images/DataSources/EntityDataSourceAdventureWorksEntityModel.png)

The simplest approach to extract entities from an __Entity Data Model__ is to bind the `EntityDataSource` component directly to an auto-generated property of the model, as shown in the sample code below:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=PropertyBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=PropertyBindingSnippet}}

You can specify expressions to the data item to group, sort or filter the selected entities. The expressions are evaluated on the application level by the reporting engine after all entities are downloaded from the database. Sometimes it is preferable to offload certain tasks on the database level instead. To do this you need to define a custom method in the __ObjectContext/DbContext__ class that performs the required business logic. For example, the following method uses the __Where__ extension method to filter the `Product` entities:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=SampleMethodSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=SampleMethodSnippet}}

Using a method instead of a property has the additional benefit that you can pass data source parameters to it, as illustrated in the following code snippet:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=MethodBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=MethodBindingSnippet}}

Another common problem is related to the lazy loading feature of the  [ADO.NET Entity Framework](https://learn.microsoft.com/en-us/previous-versions/aa697427(v=vs.80)?redirectedfrom=MSDN). For example, let us consider the following expression that obtains the category of a given product

`=Fields.ProductSubcategory.ProductCategory.Name`

The above expression relies upon the built-in lazy loading mechanism to obtain the `ProductSubcategory` entity for the current `Product` entity via the corresponding relation property, and then the `ProductCategory` entity for the current `ProductSubcategory` entity. While convenient, lazy loading requires additional round-trips to the database for the entities that are not present in memory. If this happens frequently it might significantly impact the performance of the report. To overcome this you can try performing eager loading of the entities instead. For example, the following statement uses the Include method to preload the `ProductSubcategory` and the `ProductCategory` entities while retrieving the `Product` entities:

````CSharp
this.Products.Include("ProductSubcategory").Include("ProductSubcategory.ProductCategory").ToList();
````
````VB
Me.Products.Include("ProductSubcategory").Include("ProductSubcategory.ProductCategory").ToList()
````

However in certain scenarios eager loading might be costly too. Given the previous example, we materialize all `ProductSubcategory` and `ProductCategory` entities only to show the category name of each product. This means a lot of unnecessary data is downloaded from database just to be discarded later. The most flexible and efficient method for retrieving data from the __Entity Data Model__ is to execute a custom query against the entities. The following sample method uses a __LINQ__ query to obtain only the necessary data for the report and then packs it into a collection of __POCOs:__

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=LinqQuerySnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=LinqQuerySnippet}}

The sample code that binds the EntityDataSource component to that method is shown here:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=LinqBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=LinqBindingSnippet}}

