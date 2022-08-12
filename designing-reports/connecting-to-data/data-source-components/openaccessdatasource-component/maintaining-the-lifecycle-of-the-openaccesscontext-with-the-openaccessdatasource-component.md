---
title: Maintaining the lifecycle of the OpenAccessContext with the OpenAccessDataSource component
page_title: Maintaining the lifecycle of the OpenAccessContext with the OpenAccessDataSource component 
description: Maintaining the lifecycle of the OpenAccessContext with the OpenAccessDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/maintaining-the-lifecycle-of-the-openaccesscontext-with-the-openaccessdatasource-component
tags: maintaining,the,lifecycle,of,the,openaccesscontext,with,the,openaccessdatasource,component
published: True
position: 4
previous_url: /openaccessdatasource-maintaining-the-lifecycle-of-the-openaccesscontext
---

# Maintaining the lifecycle of the OpenAccessContext with the OpenAccessDataSource component

This section discusses how to maintain the lifecycle of the __OpenAccessContext__ when using the __OpenAccessDataSource__ component. The provided examples and code snippets assume an existing __Telerik Data Access Model__ of the __Adventure Works__ sample database with the following structure:

  ![](images/DataSources/OpenAccessDataSourceAdventureWorksEntityModel.png)

One possible approach to connect to a __Telerik Data Access Model__ without using the __OpenAccessDataSource__ component is to create a custom business object with a method that retrieves the necessary entities for the report. The sample code below defines a method that retrieves information about all products: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=SampleObjectSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=SampleObjectSnippet}}

Then you can use __ObjectDataSource__ to connect to that business object, as shown in the following code snippet:           

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=ObjectBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=ObjectBindingSnippet}}

The problem with this approach is that it is not guaranteed to work in all possible scenarios. Simple expressions accessing primitive properties of the __Product__ entity might work as expected: 

````
=Fields.Name
````

However, let us consider the following expression that is intended to obtain the category of a given product:

````
=Fields.ProductSubcategory.ProductCategory.Name
````

The above expression relies upon the lazy loading mechanism of __Telerik Data Access__ to obtain the __ProductSubcategory__ entity for the current __Product__ entity via the corresponding relation property, and then the __ProductCategory__ entity for the current __ProductSubcategory__ entity. This is not guaranteed to work because the __OpenAccessContext__ is already destroyed when evaluating the expression, so lazy loading is no longer possible. One of the greatest advantages of the __OpenAccessDataSource__ component is that it can maintain the lifecycle of the __OpenAccessContext__ automatically, so scenarios like the previous one are guaranteed to work as expected. When specifying a __Type__ for the __OpenAccessContext__ property, __OpenAccessDataSource__ creates internally a new instance of the __OpenAccessContext__ with the given type, keeps it alive for the duration of the report generation process, and then destroys it automatically when it is no longer needed by the reporting engine. The following code snippet accomplishes the previous task with the help of the __OpenAccessDataSource__ component: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=PropertyBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=PropertyBindingSnippet}}

If you have already implemented your own mechanism for maintaining the lifecycle of the __OpenAccessContext__ you can continue using the __OpenAccessDataSource__ component. In this case however you need to specify a live instance of your __OpenAccessContext__ to the __ObjectContext__ property as demonstrated here: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=InstanceBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=InstanceBindingSnippet}}

