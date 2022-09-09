---
title: Maintaining the lifecycle of the Context with the EntityDataSource component
page_title: Maintaining the lifecycle of the Context with the EntityDataSource component 
description: Maintaining the lifecycle of the Context with the EntityDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/maintaining-the-lifecycle-of-the-context-with-the-entitydatasource-component
tags: maintaining,the,lifecycle,of,the,context,with,the,entitydatasource,component
published: True
position: 4
previous_url: /entitydatasource-maintaining-the-lifecycle-of-the-objectContext
---

# Maintaining the lifecycle of the Context with the EntityDataSource component

This section discusses how to maintain the lifecycle of the __ObjectContext/DbContext__ when using the __EntityDataSource__ component. The provided examples and code snippets assume an existing __Entity Data Model__ of the __Adventure Works__ sample database with the following structure:

  ![](images/DataSources/EntityDataSourceAdventureWorksEntityModel.png)

One possible approach to connect to an __Entity Data Model__ without using the __EntityDataSource__ component is to create a custom business object with a method that retrieves the necessary entities for the report. The sample code below defines a method that retrieves information about all products: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=SampleObjectSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=SampleObjectSnippet}}

Then you can use __ObjectDataSource__ to connect to that business object, as shown in the following code snippet:           

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=ObjectBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=ObjectBindingSnippet}}

The problem with this approach is that it is not guaranteed to work in all possible scenarios. Simple expressions accessing primitive properties of the __Product__ entity might work as expected:           

````
=Fields.Name
````

However, let us consider the following expression that is intended to obtain the category of a given product:

````
=Fields.ProductSubcategory.ProductCategory.Name
````

The above expression relies upon the lazy loading mechanism of the [ADO.NET Entity Framework](http://msdn.microsoft.com/en-us/library/aa697427%28VS.80%29.aspx) to obtain the __ProductSubcategory__ entity for the current __Product__ entity via the corresponding relation property, and then the __ProductCategory__ entity for the current __ProductSubcategory__ entity. This is not guaranteed to work because the __ObjectContext/DbContext__ is already destroyed when evaluating the expression, so lazy loading is no longer possible. One of the greatest advantages of the __EntityDataSource__ component is that it can maintain the lifecycle of the __ObjectContext/DbContext__ automatically, so scenarios like the previous one are guaranteed to work as expected. When specifying a __Type__ for the __Context__ property, __EntityDataSource__ creates internally a new instance of the __ObjectContext/DbContext__ with the given type, keeps it alive for the duration of the report generation process, and then destroys it automatically when it is no longer needed by the reporting engine. The following code snippet accomplishes the previous task with the help of the __EntityDataSource__ component:           

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=PropertyBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=PropertyBindingSnippet}}

If you have already implemented your own mechanism for maintaining the lifecycle of the __ObjectContext/DbContext__ you can continue using the __EntityDataSource__ component. In this case however you need to specify a live instance of your __ObjectContext/DbContext__ to the __Context__ property as demonstrated here: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=InstanceBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=InstanceBindingSnippet}}

