---
title: Maintaining the Lifecycle of the OpenAccessContext
page_title: Maintaining the OpenAccessContext lifecycle with OpenAccessDataSource
description: "Learn how to maintain the lifecycle of the OpenAccessContext with the OpenAccessDataSource component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/maintaining-the-lifecycle-of-the-openaccesscontext-with-the-openaccessdatasource-component
tags: maintaining,the,lifecycle,of,the,openaccesscontext,with,the,openaccessdatasource,component
published: True
position: 4
previous_url: /openaccessdatasource-maintaining-the-lifecycle-of-the-openaccesscontext
reportingArea: General
---

# Maintaining the Lifecycle of the OpenAccessContext with the OpenAccessDataSource Component

This section discusses how to maintain the lifecycle of the `OpenAccessContext` when using the `OpenAccessDataSource` component. The provided examples and code snippets assume an existing __Telerik Data Access Model__ of the __Adventure Works__ sample database with the following structure:

![The structure of the Telerik Data Access Model of the Adventure Works sample database we are going to use in the examples](images/DataSources/OpenAccessDataSourceAdventureWorksEntityModel.png)

One possible approach to connect to a __Telerik Data Access Model__ without using the `OpenAccessDataSource` component is to create a custom business object with a method that retrieves the necessary entities for the report. The sample code below defines a method that retrieves information about all products:

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=SampleObjectSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=SampleObjectSnippet}}

Then you can use `ObjectDataSource` to connect to that business object, as shown in the following code snippet:

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=ObjectBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=ObjectBindingSnippet}}

The problem with this approach is that it is not guaranteed to work in all possible scenarios. Simple expressions accessing primitive properties of the `Product` entity might work as expected:

`=Fields.Name`

However, let us consider the following expression that is intended to obtain the category of a given product:

`=Fields.ProductSubcategory.ProductCategory.Name`

The above expression relies upon the lazy loading mechanism of __Telerik Data Access__ to obtain the `ProductSubcategory` entity for the current `Product` entity via the corresponding relation property, and then the `ProductCategory` entity for the current `ProductSubcategory` entity. This is not guaranteed to work because the `OpenAccessContext` is already destroyed when evaluating the expression, so lazy loading is no longer possible. One of the greatest advantages of the `OpenAccessDataSource` component is that it can maintain the lifecycle of the `OpenAccessContext` automatically, so scenarios like the previous one are guaranteed to work as expected. When specifying a `Type` for the `OpenAccessContext` property, `OpenAccessDataSource` creates internally a new instance of the `OpenAccessContext` with the given type, keeps it alive for the duration of the report generation process, and then destroys it automatically when it is no longer needed by the reporting engine. The following code snippet accomplishes the previous task with the help of the `OpenAccessDataSource` component:

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=PropertyBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=PropertyBindingSnippet}}

If you have already implemented your own mechanism for maintaining the lifecycle of the `OpenAccessContext` you can continue using the `OpenAccessDataSource` component. In this case however you need to specify a live instance of your `OpenAccessContext` to the `ObjectContext` property as demonstrated here:

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=InstanceBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=InstanceBindingSnippet}}

