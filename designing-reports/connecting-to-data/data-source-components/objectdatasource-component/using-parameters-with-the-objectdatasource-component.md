---
title: Using Parameters
page_title: Using Parameters with the ObjectDataSource Component explained
description: "Learn how to pass values to the Data Source Parameters with the ObjectDataSource Component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/using-parameters-with-the-objectdatasource-component
tags: using,parameters,with,the,objectdatasource,component
published: True
position: 2
previous_url: /object-data-source-using-expressions
reportingArea: General
---

# Using Parameters with the ObjectDataSource Component

The `ObjectDataSource` component can call a business object method based on the name of the method specified in the `DataMember` property, and based additionally on the argument names that make up the business object method's signature. When you create methods in a business object, you must ensure that the parameter names and types accepted by the business object method match the parameter names and types that the `ObjectDataSource` component passes.

The `ObjectDataSource` component accepts input parameters at run time and manages them in a parameter collection. You can use the `Parameters` property to specify the parameters. For each parameter you can set a name and a default value or an expression. During the report processing the `ObjectDataSource` parameters’ values are used as argument values for the data method or the constructor of the business object. Because of this the order of the parameters is important and should exactly match the order of the arguments along with their types and names. Any discrepancy will result in a run-time exception.

> The [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%}) can detect parameters of the data-retrieval method, and it will ask you to provide values for them at __Configure Data Source Parameters__ step.

Here is an example of programmatically setting the ObjectDataSource’s parameters:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToObjectDataSourceParameters}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToObjectDataSourceParameters}}

## See Also

* [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})
