---
title: SharedDataSource
page_title: SharedDataSource Component at a Glance
description: "Learn more about the SharedDataSource Component in Telerik Reporting, where and how you may configure and use it in your Reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component
tags: shareddatasource,component,shared,data,source,designer,report
published: True
position: 3
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

> The SharedDataSource component as of __R1 2023__ is fully supported in the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}). The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) can open reports with `SharedDataSource` components, but cannot edited them.

The [SharedDataSource](/api/Telerik.Reporting.SharedDataSource) component enables report designers to easily create and reuse a data source component across multiple reports.

Additionally, end users of the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) will be able to easily design their own reports with predefined `SharedDataSource` components.

All `SharedDataSource` componenents are accessible, by default, to all end-users via the [`Asset Manager`]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/shared-resources%}#assets-manager).

The `SharedDataSource` component currently supports the following [data source components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}):

* [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})
* [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
* [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})
* [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%})
* [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%})

To add an existing shared data source to your report, follow these steps:

1. Open the __Explorer__ tab in the __Web Report Designer__.
1. Locate the __[Shared Data Sources]__ item in the tree, then hover on it.
1. Click the __...__ icon right next to the item.
1. Select __Add Existing Shared Data Source__.
1. Choose the desired shared data source, then click __Save__.

![A context menu with the "Add Existing Shared Data Source" option.](./images/add-existing-shared-data-source-context-menu.png)

>tip Existing data source components can be configured into `SharedDataSource` components via the __Explorer__ tab in the __Web Report Designer__. Left-clicking the data source component will open the _context menu_ from which the option __Save As Shared Data Source__ can be chosen.

## Configuring the Component

__Configuration inside the SDSX file:__

Inside the `.sdsx` file, the _internal_ data source component can be edited and/or the `Description` of the `SharedDataSource` component can be written:

![SDSX Configuration Page in the Web Report Designer with JsonDataSource component selected for sharing](images/sdsx_configuration_page.png)

__Configuration inside the Report Definition:__

| Setting | Description |
| ------ | ------ |
|Name|Represents the text that will be displayed next to the component's icon.|
|Path|Represent the relative(to the report definition) path to the `.sdsx` file. [`Expressions`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) are supported.|

![Preview of a pre-configured SharedDataSource in Report opened in the Web Report Designer](images/sdsx_configuration_inside_report.png)

## Resolving SDSX XML

By default, the `.sdsx` files are resolved with path relative to the report definition in which they are utilized. However, Telerik Reporting does not impose any restrictions on how or where these files will be stored.

The `.sdsx` can be stored in any kind of storage, the only requirement is that if the local file system is not used, a custom `SharedDataSourceResolver` should be implemented via the `<sharedDataSourceResolver>` configuration option - [processing Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%})
