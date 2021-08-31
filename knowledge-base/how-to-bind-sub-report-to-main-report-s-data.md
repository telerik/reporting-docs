---
title: How to bind Sub Report to Main Report's Data
description: How to make the Sub Report use the Main Report's Data.
type: how-to
page_title: How to send data to the Sub Report from Main Report's Data Object 
slug: how-to-bind-sub-report-to-main-report-s-data
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
   <tr>
		<td>Report Item</td>
		<td>SubReport</td>
	</tr>
</table>

## Description

Telerik Reporting Expression engine allows you to reuse the data of a parent scope. This includes binding a subreport to the main report's data.  

This article provides the required steps for binding the SubReport to the Main Report's Data.  
  
## Solution  
  
- Open the report that will be used as a subreport in the designer and use the following [binding to the report's DataSource property](../expressions-bindings):  

```
Property path: DataSource
Expression: =ReportItem.DataObject
```
  
 When the subreport is loaded by a SubReport item in the main report, the sub report will get the data associated with the SubReport item.   
  
- You can change the scope to a greater parent by using the [Parent keyword](../p-telerik-reporting-reportitembase-parent). For example:  

```
Property path: DataSource
Expression: =ReportItem.Parent.Parent.DataObject
```  

## Notes

In case you need to display data in a tabular format, another approach for organizing the main report's layout can be found in [How to Databind to Collection Properties](../how-to-databind-to-collection-properties). 

## See also  

[How to use the ReportItem.DataObject property in expressions](../data-items-how-to-use-data-object). 
 
