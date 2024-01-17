---
title: How to set the content of JsonDataSource through report parameter
description: Sometimes you want to set or change the content of the JSON DataSource in runtime
type: how-to
page_title: Setting the content of JsonDataSource through report parameter
slug: setting-the-content-of-jsondatasource-through-report-parameter
position: 
tags: 
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.1.19.514 +</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Sometimes you want to change the content of JSON DataSource or to set it in runtime.

## Solution
If you have a table in the report and the datasource is assigned to it, firstly you need to create the report parameter which has
to be from **Type** String. In the table, you need to add a declaration for each field (for instance: =Fields.Name and so on). 

To set the content of the [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) to be the report parameter's value,
use the following [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) in the table:

    Property path: DataSource.Source
    Expression: = Parameters.Parameter1.Value

The same approach can be applied if the datasource is assigned to the report or any other [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}). In this case, the Binding has to be added to the report/ data item.

## Notes
The demo report can be downloaded from [here](https://github.com/telerik/reporting-samples/tree/master/SetJsonThroughReportParameter).
