---
title: Does Telerik Reporting support XML as a datasource?
description: Does Telerik Reporting support XML as a datasource?
type: troubleshooting
page_title: Does Telerik Reporting support XML as a datasource?
slug: xml-support
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>

## Solution
You have a couple of options:

1. (Recommended) Create a typed DataSet from your XML. Once you have the DataSet ready, use the [ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) and it will appear in the list of the available data sources; select it and follow the instructions of the wizard. For more information check [typed DataSets](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/dataset-datatable-dataview/typed-datasets) MSDN article. For more information on binding to DataSet, see [How to: Bind to a DataSet]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataset%}).

2. Load the XML into a DataSet programmatically. Use the [DataSet.ReadXml](https://docs.microsoft.com/en-us/dotnet/api/system.data.dataset.readxml?view=netframework-4.7.2) method to load the XML data into a DataSet and then pass it to the Report.DataSource property. The disadvantage of this approach is that the schema of the report's data source won't be available at the design time. This means that the Report Wizard won't be of any help. Anyway you still can create a report without it. You can use the Visual Studio Toolbox to select from the available items. For more information please see [Designing Reports]({%slug telerikreporting/designing-reports/overview%}).
