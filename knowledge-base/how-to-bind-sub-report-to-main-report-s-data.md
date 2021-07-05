---
title: How to bind Sub Report to Main Report's Data
description: How to bind Sub Report to Main Report's Data.
type: how-to
page_title: How to bind Sub Report to Main Report's Data
slug: how-to-bind-sub-report-to-main-report-s-data
res_type: kb
---

## How-to  
How to bind Sub Report to Main Report's Data.  
  
## Solution  

Telerik Reporting Expression engine allows you to reuse the data of a parent scope. This includes binding a sub report to the main report's data.  
  
For the purpose, open the sub report designer and use the following [binding to the report's DataSource property](../expressions-bindings):  

```
Property path: DataSource
Expression: =ReportItem.DataObject
```
  
 When the sub report is loaded by a SubReport item in the main report, the sub report will get the data associated with the SubReport item.   
  
 You can change the scope to a greater parent by using the [Parent keyword](../p-telerik-reporting-reportitembase-parent). For example:  

```
Property path: DataSource
Expression: =ReportItem.Parent.Parent.DataObject
```  
## See also  
More details can be found in [How to use the ReportItem.DataObject property in expressions](http://docs.telerik.com/reporting/data-items-how-to-use-data-object). 

In case you need to display data in a tabular format, another approach for organizing the main report's layout can be found in [How to Databind to Collection Properties](./how-to-databind-to-collection-properties).  


