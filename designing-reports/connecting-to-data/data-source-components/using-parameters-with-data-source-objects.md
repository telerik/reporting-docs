---
title: Using Parameters with Data Source objects
page_title: Using Parameters with Data Source objects | for Telerik Reporting Documentation
description: Using Parameters with Data Source objects
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects
tags: using,parameters,with,data,source,objects
published: True
position: 12
---

# Using Parameters with Data Source objects



You can use parameterized data retrieval methods to supply search criteria and values for sorting and filtering.       

## 

SqlDataSource, ObjectDataSource, EntityDataSource, OpenAccessDataSource, CubeDataSource and WebServiceDataSource components have           __Parameters__  collections allowing you to map the data retrieval methods parameters to report parameters, fields or other expressions.           Each of the listed data source components has a Wizard including the configuration of the component's Parameters collection.         

>tip [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) can be used for passing values of String, Integer, Float, Datetime, Boolean type, and Array of objects in case of a             [multivalue report parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%}).             Custom types are not supported by report parameters, but you can use other expression based on fields             and custom functions to pass values to data-retrieval methods.           Updating values of report parameters from the calling application can be achieved using Parameters collection of the ReportSource class:              [Report Source Parameters]({%slug telerikreporting/designing-reports/report-sources/overview%}).           


# See Also


 * [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%})

 * [Using Parameters with the SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%})

 * [Using Parameters with the ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/using-parameters-with-the-objectdatasource-component%})

 * [Using parameters with the EntityDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/using-parameters-with-the-entitydatasource-component%})

 * [Using parameters with the OpenAccessDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/using-parameters-with-the-openaccessdatasource-component%})

 * [Specifying query parameters with the CubeDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/specifying-query-parameters-with-the-cubedatasource-component%})

 * [Configuring WebServiceDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
