---
title: Data Binding Context
page_title: Data Binding Context - Web Report Designer User Guide
description: "Learn how data context works in Telerik Reporting, how it is inherited,and how parent–child data item relationships affect it."
slug: data-binding-context
tags: report, bind, context, data
published: True
tag: new
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 9
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Data Binding Context

Data Context refers to the underlying data object that a report item is bound to while the report is being processed. A DataObject is essentially the data context for that particular report item at runtime.

When Telerik Reporting processes a report:

1. It retrieves data from the configured DataSource (SQL, JSON, ObjectDataSource, etc.).
2. For each row or record, the engine creates a processing item.
3. That item receives a DataObject, which holds the fields (Fields.Name, Fields.Price, etc.) for that record.
4. In expressions, this DataObject acts as the current data context.

## How Data Context Is Inherited Between Report Items

Child items automatically inherit the data context of their parent. It means:

|ItemData| Context Comes From|
|----|----|
|A detail section|The current row from the report’s DataSource|
|A table row|The table's parent data item or group|
|A text box inside a table|The current row in that table|
|A nested data item (e.g., sub-table)|The parent item’s DataObject|

>note Data context does not flow “sideways”&mdash;Items next to each other (e.g., two sibling panels) do not share context unless they share the same parent data item.</br>
>SubReports do not inherit parent context unless passed explicitly.

## Using Parent Data Context to Feed a Child DataSource

ReportItem.DataObject.MyField retrieves the MyField data from the parent data item data source. This is heavily used in [Master–Detail reports]({%slug web-report-designer-user-guide-creating-master-detail-report%}). For example passing parent row value to a child item's Child Table DataSource parameter:

````SQL
@ParentID = ReportItem.DataObject.ParentID
````

This is how you bind a nested data source to the row being processed.

## Context Inheritance in Nested Data Items

You can use a DataObject as a data source for nested data items. Meaning the child item’s entire data source can derive from the parent. The most common scenario is when a parent data row contains a JSON column with child items. A similar approach is demonstrated in [Creating Nested Hierarchy with SubReports]({%slug wrd-user-guide-create-nested-hierarchy-with-subreport%})


## See Also

* [Using ReportItem.DataObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%}) 
