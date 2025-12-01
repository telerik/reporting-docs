---
title: Overview
page_title: Data Source Components at a Glance
description: "Learn what Data Source Components are supported by Telerik Reporting and the basic principles of using them in your reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/overview
tags: overview
published: True
position: 0
previous_url: /connecting-to-data-data-source-components, /designing-reports/connecting-to-data/data-source-components/
reportingArea: General
---

# Data Source Components Overview

The Telerik Reporting Data Source Components allow you to connect report items (e.g. [Report]({%slug telerikreporting/designing-reports/report-structure/overview%}), [Table/Crosstab/List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) and [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})) to different types of data sources such as database or middle-tier business objects, without additional code. Note that they should not be confused with the .NET Data Sources available in the Visual Studio.

Telerik Reporting Data Source Components are intended to specify declaratively how to retrieve data for [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) but do not contain any data themselves. Their purpose is only to specify the means how to obtain it (e.g. in the case of SqlDataSource - by executing a SQL query against a database, in the case of ObjectDataSource - by invoking a method/property of a custom business object, etc.). You can view the Data Source Components as wrappers for your data that can only read it and cannot modify it.

The Telerik Reporting engine includes the following data source objects:

* [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})
* [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
* [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})– Enables you to work with business objects or other classes and allows you to create reports that display data from the middle-tier. For backwards compatibility Telerik Reporting supports binding directly to `IEnumerable` / `IListSource` objects (incl. `arrays`, `collections`, `DataSet`, `DataTable`, `DataView`, `DbDataAdapter`). Our recommendation is to avoid them and use the ObjectDataSource component that can handle these types of data sources.
* [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%})
* [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%})
* [EntityDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%})– Enables you to connect to the [ADO.NET Entity Framework](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/ef/?redirectedfrom=MSDN)
* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%})
* [OpenClientDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/overview%})
* [OpenAccessDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/overview%})- Enables you to connect to [Telerik Data Access (DISCONTINUED)](https://www.telerik.com/data-access-sunsetting)
