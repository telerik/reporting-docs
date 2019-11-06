---
title: How to add multiple tables dynamically based on the data source
description: I want to generate multiple tables based on the data source and the number of tables at the design is not known/defined.
type: how-to
page_title: Create Tables dynamically based on the incoming data. 
slug: how-to-add-multiple-tables-dynamically-based-on-data-source
position: 
tags: 
ticketid: 1439984
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
The requirement is to create Tables dynamically based on the incoming data. Each table may have different columns in terms of count and names.

## Solution
Let's consider the following JSON data attached as DataSource to the Report: 
```JSON
[
	{
		"Name": "It",
		"Data": [
			{
				"ColumnName": "ColItId",
				"Values": [
					45,
					46
				]
			}
		]
	},
	{
		"Name": "Part",
		"Data": [
			{
				"ColumnName": "Sales Order",
				"Values": [
					171165,
					171166
				]
			},
			{
				"ColumnName": "Order No",
				"Values": [
					227654,
					227655
				]
			}
		]
	}
]
```
To generate a separate table for each item of the root array object we can add a separate [Report Group](../data-items-how-to-add-groups-to-report-item) grouped by the __Name__ property of these objects. The title for the particular table is displayed in the corresponding Report Group Header section.

The __Data__ property represents the columns and the values for each individual table. For the purpose it gets set with [Bindings](../expressions-bindings) as a data source for a dedicated Crosstab item. Each column has __ColumnName__ (a String representing the column name) and __Values__ (an Array with the actual row data). The former is used as Column Grouping property for the Crosstab, which results in generating the necessary number of columns with the desired names. 

In the detail section of the Crosstab, there is a List item bound to the __Values__ property of the Crosstab (its parent) data source with _Bindings_. The List contains a single TextBox, which value is set to '=Fields.Item' that will display the content of its data source (the array with the actual row data) in the detail section of the List. 

Check the [reprot definition](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/report1.trdp?sfvrsn=f09b7582_2&download=true) and the [screenshot](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/listincrosstab.png?sfvrsn=dc74f2bf_2) that shed more light on the approach.
