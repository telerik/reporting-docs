---
title: Using parameters with the OpenAccessDataSource component
page_title: Using parameters with the OpenAccessDataSource component 
description: Using parameters with the OpenAccessDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/using-parameters-with-the-openaccessdatasource-component
tags: using,parameters,with,the,openaccessdatasource,component
published: True
position: 2
previous_url: /openaccessdatasource-using-parameters
---

# Using parameters with the OpenAccessDataSource component



This section discusses more in-depth how to pass parameters to a method of the __OpenAccessContext__ with         the __OpenAccessDataSource__ component. The provided examples and code snippets assume an existing         __Telerik Data Access Model__ of the __Adventure Works__ sample database with the following structure:         

  ![](images/DataSources/OpenAccessDataSourceAdventureWorksEntityModel.png)

> The [OpenAccessDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard%}) can detect parameters           of the data-retrieval method, and it will ask you to provide values for them at  __Configure Data Source Parameters__ step.         

The __OpenAccessDataSource__ component can call a method of the __OpenAccessContext__ based on the name of the           method, and additionally based on the arguments which make the signature of that method. For example,           let us extend the __AdventureWorksEntities__ context using a partial class that defines the following method:           

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=SampleMethodSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=SampleMethodSnippet}}

To call the above method specify its name to the __ObjectContextMember__ property and define a data source parameter           in the __Parameters__ collection for each method argument. The names and types of the data source parameters           must match exactly the names and types of the corresponding method arguments otherwise the __OpenAccessDataSource__         component will raise an exception at runtime. The following code snippet illustrates how to pass parameters           to the previous method programmatically:           

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=MethodBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=MethodBindingSnippet}}

When declaring a data source parameter you can specify a default value for that parameter and the           value will be passed automatically to the corresponding method argument. Instead of supplying the           parameter value directly, you can specify an expression to be evaluated at runtime. For example, this           way it is possible to link the data source parameter to an existing report parameter, as shown in the           following code snippet:           

{{source=CodeSnippets\CS\API\Telerik\Reporting\OpenAccessDataSourceSnippets.cs region=ParameterBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\OpenAccessDataSourceSnippets.vb region=ParameterBindingSnippet}}


