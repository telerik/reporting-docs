---
title: How to Create a Report that Displays Hierarchical Nested Data
description: How to represent hierarchical nested data in a 'directory tree'-like report
type: how-to
page_title: How to represent hierarchical nested data in report recursively
slug: hierarchical-report-from-nested-data
position: 
tags: 
ticketid: 1483175
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
The requirement is to represent hierarchical data with an unknown number of hierarchical levels in a report recursively. The data consists of nested collections. 
For example here is a sample JSON data:

````JSON
[{
"Name":"Grand Parent 1",
"List":[{
	"Name":"Parent 1-1",
	"List":[{
		"Name":"Child 1-1-1"},{
		"Name":"Child 1-1-2"},...]
	},...]
},{
"Name":"Grand Parent 2",
"List":[{
	"Name":"Parent 2-1",
	"List":[{
		"Name":"Child 2-1-1"},...]
	},
	{
	"Name":"Parent 2-2",
	"List":[{
		"Name":"Child 2-2-1"},{
		"Name":"Child 2-2-2",
		"List":[{
			"Name":"Grand Child 2-2-2-1"},...]
		},...]
	},...]
},...]
````

## Solution 1

We use one report that references itself through a [SubReport item]({%slug telerikreporting/designing-reports/report-structure/subreport%}). The _DataSource_ of each subreport is set to the collection field (the field "List" in the above JSON) from the parent Report _DataSource_. This way, the report structure will be reproduced hierarchically based on the data, and the bottom of the recursion will be hit when the collection fields are no longer available.
The solution is demonstrted in the [HierarchyFromNestedCollections.trdp](https://github.com/telerik/reporting-samples/blob/master/HierarchyFromNestedCollections.trdp) demo report. Next I have outlined the main points when designing the report. The report has a _DataSource_ assigned as a property - the [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) with hierarchical nested data collection, and a _DataSource_ assigned with [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) through the following [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}):

````
Property path	|	Expression
DataSource	|	= ReportItem.Parent is Null ? ReportItem.DataSource : ReportItem.Parent.DataObject.List
````

This way, if the Report doesn't have a parent, like the root report of the hierarchy representation, the default _DataSource_ will be the _JsonDataSource_ assigned as a property, otherwise, the _List_ field of the parent report will become the corresponding data source for each child report in the hierarchy representation. 
The _SubReport_ item has a [ReportSource]({%slug telerikreporting/designing-reports/report-structure/subreport%}#setting-the-report-source) set both directly as a property, and with the following _Binding_:

````
Property path		|	Expression
ReportSource.Uri	|	= Fields("List") is Null ? Null : "HierarchyFromNestedCollections.trdp"
````

The above expression modifies the _ReportSource_ so that when there is no more field "List" in the parent report _DataSource_ a next level subreport is not generated, which will be the bottom of the recursion. The direct setting of the _ReportSource_ property is needed in order to create the _ReportSource_ object before modifying its _Uri_ property with the _Binding_. Otherwise, the _ReportSource_ object will be _Null_, which will result in an exception in the above _Binding_.

## Solution 2
Another approach is suggested in the [How do I displaying recursive data?](https://www.telerik.com/forums/how-do-i-displaying-recursive-data) Forum thread. The updated example 
can be downloaded from our GitHub repository: [HierarchicalDataRepresentation.zip](https://github.com/telerik/reporting-samples/blob/master/HierarchicalDataRepresentation.zip).

## See Also

* [How to Create a Report that Displays Hierarchical Flat Data]({%slug hierarchical-report-from-flat-data%})
