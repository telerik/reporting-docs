---
title: Data Scope in Expressions (Tutorial)
page_title: Data Scope in Expressions - Web Report Designer User Guide
description: "Learn how data scope inheritance affects expressions and aggregates in Telerik Reporting by building a sample report with groups and subtotals."
slug: data-scope-in-expressions
tags: report, bind, context, data, scope, expression
published: True
tag: new
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 1
---

# Data Scope in Expressions (Tutorial)

By following the steps below, you can build a sample report that will help you understand how the data scope inheritance works when using expressions.

1. Create a new report in the Web Report Designer.

1. Add a CSV Data Source to the report with the following data:

    ````CSV
    Product,Category,Amount
    Laptop,Electronics,1200
    Phone,Electronics,800
    Tablet,Electronics,400
    Headphones,Accessories,150
    Monitor,Electronics,300
    ````

    If you explicitly set the DataSource property of your report, it defines a report-level data scope, containing all rows. It defines the outermost scope. However, for this example, leave the Report.DataSource empty.

1. Add a Table: from the Components pane, drag a Table onto the design surface and bind it to your data source. A Table is a data item, so it switches scope to its own data source (data item-level scope). Everything inside its detail section is evaluated per row.

1. Add fields to columns: 
    * Column 1: 
        ````
        =Fields.Product
        ````

    * Column 2: 
        ````
        =Fields.Category
        ````

    * Column 3: 
        ````
        =Fields.Amount
        ````

    At this point `Fields.Amount` in a detail row represents the value from the current record and the default scope is the Table row (innermost detail scope).

    <img style="border: 1px solid gray;" src="images/bound-table.png" alt="Bound Table" />  

1. Preview the report.

    <img style="border: 1px solid gray;" src="images/preview-table-without-groups.png" alt="Preview Table Without Groups" /> 

1. Add a Row Group by **Category** using the [Table Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-context-menu%}).

    <img style="border: 1px solid gray;" src="images/table-context-menu.png" alt="Table Context Menu" />  
    <img style="border: 1px solid gray;" src="images/table-add-group.png" alt="Table Add Group" /> 

1. Save the group. This creates a new group-level scope (subset of rows that share the same Category). Here, the default scope is the current group instance, so all fields refer to that group’s first record unless aggregated.

    <img style="border: 1px solid gray;" src="images/table-group-scope.png" alt="Table Group Scope" />  

1. Preview the report and see the products grouped by category:

    <img style="border: 1px solid gray;" src="images/preview-table-groups.png" alt="Preview Table Grops" />   

1. Add a Group Subtotal: In the Group Footer, select the TextBox under the **Amount** column and set the Value to `=Sum(Fields.Amount)`:

    <img style="border: 1px solid gray;" src="images/group-footer-sum.png" alt="Group Footer Sum"  />  

    `Sum()` automatically aggregates over the group scope, not the entire dataset. This is because the nearest ancestor defining a data scope is the group. For **Accessories**, *Subtotal Amount is 150* and for **Electronics**, the *Subtotal Amount is 2700*:

    <img style="border: 1px solid gray;" src="images/preview-group-footer-sum.png" alt="Preview Group Footer Sum" />   

1. Add a Group Grand Total: In the Table Group, select the TextBox above the **Amount** column and set the Value again to `=Sum(Fields.Amount)`. This is the same expression as the one set in the group's footer. However, the result is different due to the larger data scope.

    <img style="border: 1px solid gray;" src="images/add-group-grand-total-sum.png" alt="Add Group Grand Total Sum" />  
    <img style="border: 1px solid gray;" src="images/preview-add-group-grand-total-sum.png" alt="Preview Group Grand Total Sum" />   

## See Also

* [Using ReportItem.DataObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%}) 
* [Data scope related functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%})
* [Data Scope in Filters]({%slug data-scope-in-filters%})
