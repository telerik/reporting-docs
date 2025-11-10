---
title: Using Parameters
page_title: Using parameters with the EntityDataSource component explained
description: "Learn how to provide values to the data source parameters with the EntityDataSource component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/using-parameters-with-the-entitydatasource-component
tags: using,parameters,with,the,entitydatasource,component
published: True
position: 2
previous_url: /entitydatasource-using-parameters
reportingArea: General
---

# Using Parameters with the EntityDataSource Component

This section discusses more in-depth how to pass parameters to a method of the __ObjectContext/DbContext__ with the `EntityDataSource` component. The provided examples and code snippets assume an existing __Entity Data Model__ of the __Adventure Works__ sample database with the following structure:

![The structure of the Entity Data Model of the Adventure Works sample database we are going to use in the examples](images/DataSources/EntityDataSourceAdventureWorksEntityModel.png)

> The [EntityDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard%}) can detect parameters of the data-retrieval method, and it will ask you to provide values for them at __Configure Data Source Parameters__ step.

The `EntityDataSource` component can call a method of the __ObjectContext/DbContext__ based on the name of the method, and additionally based on the arguments which make the signature of that method. For example, let us extend the `AdventureWorksEntities` context using a partial class that defines the following method:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=SampleMethodSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=SampleMethodSnippet}}

To call the above method specify its name to the `ContextMember` property and define a data source parameter in the `Parameters` collection for each method argument. The names and types of the data source parameters must match exactly the names and types of the corresponding method arguments otherwise the `EntityDataSource` component will raise an exception at runtime. The following code snippet illustrates how to pass parameters to the previous method programmatically:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=MethodBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=MethodBindingSnippet}}

When declaring a data source parameter you can specify a default value for that parameter and the value will be passed automatically to the corresponding method argument. Instead of supplying the parameter value directly, you can specify an expression to be evaluated at runtime. For example, this way it is possible to link the data source parameter to an existing report parameter, as shown in the following code snippet:

{{source=CodeSnippets\CS\API\Telerik\Reporting\EntityDataSourceSnippets.cs region=ParameterBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\EntityDataSourceSnippets.vb region=ParameterBindingSnippet}}

