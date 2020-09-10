---
title: How to Create a Report that Displays Hierarchical Flat Data
description: How to represent hierarchical flat data in a 'directory tree'-like report
type: how-to
page_title: How to represent hierarchical flat data in report recursively
slug: hierarchical-report-from-flat-data
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
The requirement is to represent hierarchical data with an unknown number of hierarchical levels in a report recursively. The data is flat as if coming from a SQL Query.

## Solution
The general idea is the main report to reference itself in a [SubReport item](../report-items-sub-report). The data of each subreport gets filtered based on the value of a 
[Report Parameter](../designing-reports-parameters). This way, the report structure will be reproduced hierarchically based on the data, and the bottom of the recursion 
will be hit when all the data is filtered out.  

The solution is demonstrted in the [HierarchyFromFlatData.trdp](https://github.com/telerik/reporting-samples/blob/master/HierarchyFromFlatData.trdp) demo report. 
Here are the main points when designing the report:  

The report has a [JsonDataSource](../jsondatasource-component) assigned and displays the field _ChildItem_, and a _SubReport_ item that references the same report document, i.e 
_HierarchyFromFlatData.trdp_. The Report has a Parameter with default value set to _Null_. The _SubReport_ item passes as _ReportSource->Parameters_ value the field _ChildItem_ 
of the parent report. This value will filter the subreport data based on the parameter, hence will display only those items from the data source that have as _ParentItem_ 
the current _ChildItem_ in order to structure the correct hierarchy. Here is the [Report Filter](https://docs.telerik.com/reporting/data-items-how-to-add-filtering-to-report-item):
```
  = IsNull(Fields.ParentItem, '1')	  	=		  	= IsNull(Parameters.Parent.Value, '1')
```
The purpose of the _IsNull_ [conditional function](../expressions-evaluation-flow-functions) above is to allow the comparison when the current _ParentItem_ doesn't have 
a parent (it is _Null_), like in the case of the first data item - see the JSON data. The constant '1' may be any valid constand value and should be the same in both 
[Expressions](../report-expressions).

## See also
reference the KB with nested collections
