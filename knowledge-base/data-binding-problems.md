---
title: Data Binding Problems
type: troubleshooting
page_title: Problems related to Data Binding
description: "Learn what may be causing some Data Binding Problems in Telerik Reporting, like repeating data or displaying blank data items."
slug: telerikreporting/designing-reports/connecting-to-data/troubleshooting/data-binding-problems
tags: data,binding,problems
published: True
previous_url: /Troubleshooting-Data-Binding-problems,/designing-reports/connecting-to-data/troubleshooting/data-binding-problems
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

This article lists common issues on binding data to Telerik Reports and nested data items. Before proceeding with the troubleshooting, test if the problem is reproducible with the latest available Telerik Reporting version.

## Overview

Data can be visualized by [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}). Each data item has its own DataSource property and creates a separate [Expression scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope%}).

## Repeating data

If both a report and its nested data item are bound to the same data source, each will develop its designed template per data record in the data source. In such case, you need to check which data item will visualize the data, and to reset the DataSource property of the other item.

## Changing a report's DataSource at run-time leads to no changes or no data on displaying the report.

To change data at run-time, you need to iterate all data items and to modify their DataSource properties e.g. [Changing the connection string dynamically according to runtime data]({%slug changing-the-connection-string-dynamically-according-to-runtime-data%}). You can also use the [ReportItemBase.ItemCollection.Find Method](/api/Telerik.Reporting.ReportItemBase.ItemCollection#Telerik_Reporting_ReportItemBase_ItemCollection_Find_System_String_System_Boolean_) to get the data item visualizing data, and to change its DataSource property's value.

## See Also

- [Do I need to use a Data Source component?]({%slug do-i-need-to-use-a-data-source-component%})
- [Data Explorer does not show all or any data fields]({%slug data-explorer-does-not-show-all-or-any-data-fields%})
- [How to show 'No Data Message' or hide an item in case of No data]({%slug how-to-show-no-data-message-or-hide-an-item-in-case-of-no-data%})
- [Changing the connection string dynamically according to runtime data]({%slug changing-the-connection-string-dynamically-according-to-runtime-data%})
