---
title: JsonDataSource Component
page_title: JsonDataSource Component 
description: JsonDataSource Component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component
tags: jsondatasource,component
published: True
position: 2
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>
# JsonDataSource Component

The [JsonDataSource](/reporting/api/Telerik.Reporting.JsonDataSource)  component enables data items to display JSON data located in a local file, or saved directly into the report while using no code. At design time the component can be configured using the [JsonDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/jsondatasource-wizard%}). At run time the JsonDataSource automatically parses the JSON data. 

The provided JSON data may omit properties with empty values. The result is that not all of the objects have the same list of properties. Due to this no errors will be shown in the report if an undefined data field name is used inside an expression. 

The data field names for this data source are __case-sensitive__. It is required to use the correct data field names in expressions, otherwise no data will be shown. 

> The JSON data source relies and reuses some of the Web Service data source functionalities. In order to preview JSON data source reports in your application it is required to reference the  __Telerik.Reporting.WebServiceDataSource__ DLL or the corresponding NuGet package in the application. 

## Configuring the Component

__External Data File Configuration:__ 

| Setting | Description |
| ------ | ------ |
|Source|The external data file containing the data. The URI to the file might be relative or absolute. Required if inline data string is not set.|
|Data Selector|The  [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) string which will be used to query the JSON data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%})|

__Inline Data String Configuration:__ 

| Setting | Description |
| ------ | ------ |
|Source|The inline data string containing the data. Required if external data file is not set.|
|Data Selector|The  [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) string which will be used to query the JSON data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%})|

## Supported developer platforms

* .NET Framework 4.0 and above             

* .NET Core 2.0 and above             

* .NET Standard 2.0 and above
