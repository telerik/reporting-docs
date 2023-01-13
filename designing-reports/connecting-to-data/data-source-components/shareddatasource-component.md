---
title: SharedDataSource Component
page_title: SharedDataSource Component 
description: SharedDataSource Component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component
tags: shareddatasource,component,shared,data,source
published: True
position: 1
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>
# SharedDataSource Component

>note The SharedDataSource component as of __R1 2023__ is fully supported in the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}). Currently, the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) can open reports that use __SharedDataSource__ components, however, they cannot be edited from it. 

The [SharedDataSource](/reporting/api/Telerik.Reporting.SharedDataSource) component enables report designers to easily create and reuse a data source component across multiple reports. 

Additionally, end users of the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) will be able to easily design their own reports with predefined `SharedDataSource` components. 

All `SharedDataSource` componenents are accessible, by default, to all end-users via the [`Asset Manager`]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/shared-resources%}#assets-manager)

The `SharedDataSource` component currently support the following [data source components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}):

* [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})

* [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%})

* [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%})

* [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})

* [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})

> Existing data source components can be configured into __SharedDataSource__ components via the __Explorer__ tab in the __Web Report Designer__. Left-clicking the data source component will open the _context menu_ from the option __Save As Shared Data Source__ can be chosen.  

## Configuring the Component

__Configuration inside the SDSX file:__

Inside the `.sdsx` file, the _internal_ data source component can be edited and/or the `Description` of the `SharedDataSource` component can be written:

![SDSX Configuration Page](./images/sdsx_configuration_page.png)

__Configuration inside the Report Definition:__ 

| Setting | Description |
| ------ | ------ |
|Name|Represents the text that will be displayed next to the component's icon.|
|Path|Represent the relative(to the report definition) path to the `.sdsx` file. [`Expressions`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) are supported.|

![SDSX Configuration Inside Report](./images/sdsx_configuration_inside_report.png)

## Resolving SDSX XML

By default, the `.sdsx` files are resolved with path relative to the report definition in which they are utilized. However, Telerik Reporting does not impose any restrictions on how or where these files will be stored. 

The `.sdsx` can be stored in any kind of storage, the only requirement is that if the local file system is not used, a custom `SharedDataSourceResolver` should be implemented via the `<sharedDataSourceResolver>` configuration option - [processing Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%})