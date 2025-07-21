---
title: Tables
page_title: Tables
description: Web Report Designer offers different Table Components that can be used to visualize the data records in the reports.
slug: web-report-designer-user-guide-components-tables
tags: web, report, design, report, components, table, list, crosstab
published: True
position: 2
---
List
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# Tables
 
The **Web Report Designer** offers a **Tables** section inside the **Components** tray allowing the end-user to visualize the data records from different [Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) storages: 

<div style="display: flex; align-items: flex-start; gap: 24px;">
  <img alt="><" title="Components tray" src="images/wrd-components-tray-tables.png" style="max-width:240px; height:auto; border:1px solid lightgrey;" />
  <table style="width:100%; height:100%;"> 
      <tr>
      <th style="width:30%">Table Type</th><th>Description</th>
    </tr
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/tables#list">List</a></td>
      <td>Displays data from a set of Business Objects creating a free-form data layout. You are not limited to a grid layout, you can freely place fields inside the List.</td>
    </tr>
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/tables#table">Table</a></td>
      <td>Displays report data in cells that are organized into rows and columns.</td>
    </tr>
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/tables#crosstab">Crosstab</a></td>
      <td>Displays aggregated data summaries that are grouped in rows and columns. The number of rows and columns for groups is determined by the number of unique values for each row and column groups.</td>
    </tr>
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/tables#table-wizard">Table Wizard</a></td>
      <td>The Table wizard guides you through the process of adding a Table item to a report.</td>
    </tr>
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/tables#crosstab-wizard">Crosstab Wizard</a></td>
      <td>The Crosstab wizard guides you through the process of adding a Crosstab item to a report.</td>
    </tr>
        <tr><td colspan=2 align=center><img alt="><" title="Components tray" src="images/wrd-components-tray-tables-small.png" /></td>
    </tr> 
  </table>
</div>

Before adding a Table report item, first, you need to select the Details section of the report. Then, you can select the desired table item type from the Components tray and configure it with the desired data source.

## List

By dragging the `List` item from the **Components** tray and dropping it onto the **Details** section of the report, you are ready to build the desired layout with report items like TextBoxes and use the already defined [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}).
The following short video illustrates how to add a List, bind it to an already existing [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) item and adding a TextBox report item for displaying the FirstName of the data records:     

<iframe width="560" height="315" src="https://www.youtube.com/embed/2P50WiOqq7M?si=QhoQr_gPoX2oR_PF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Table 

By dragging the `Table` item from the **Components** tray and dropping it onto the **Details** section of the report, you are ready to build the desired layout with report items like TextBoxes and use the already defined [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}).

When added from a report designer, the Table contains three columns with a table header row and a details row for the data:

1\. Drag a Table report item 

2\. Drop it onto the Details section

![Empty Table ><](images/wrd-components-tray-tables-table-empty.png)      

The following short video illustrates how to add an empty Table report item, bind it to an already existing [CSV Data Source]({%slug web-report-designer-user-guide-components-data-sources%}), add the necessary TextBox report items for the column headers and for the data records displaying the First/Last Names:

<iframe width="560" height="315" src="https://www.youtube.com/embed/fBmSktuKgHA?si=-PjTxgYIAQVbphyf" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Crosstab  

By dragging the `Crosstab` item from the **Components** tray and dropping it onto the **Details** section of the report, you are ready to build the desired layout with the generated empty column/row groups and body parts. 

When added from a report designer, the [Crosstab]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%}) contains a column group, a row group and a body for crosstab data:

1\. Drag a Crosstab report item 

2\. Drop it onto the Details section

![Empty Crosstab ><](images/wrd-components-tray-tables-crosstab-empty.png)     

The following short video illustrates how to add an empty Crosstab report item, bind it to an already existing [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}), bind the generated empty Column/Row groups and map the necessary TextBox report items for the column/row group and for the data records displaying the total sum of Freight for the respective OrderID:

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ntf3DDlczmg?si=shL9Z4HNJSevq_Gx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Table Wizard

By clicking the [Table Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-crosstab-wizard%}) item from the **Components** tray, a new tab will appear on the right-hand side of the **Web Report Designer**:

1\. Click the Table Wizard from the Components tray

2\. Show the **Configure Table** pane on the right side

![Launching Data in a Table ><](images/wrd-components-tray-tables-table-wizard.png)      

The following short video illustrates how to add a Table report item with the wizard, bind it to an already existing [Web Service Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) item and arrange the desired fields for displaying the name and localized name of the data records:

<iframe width="560" height="315" src="https://www.youtube.com/embed/YYdyeCW2XSg?si=Dksa5GK_ZkfszicP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Crosstab Wizard
 
By clicking the [Crosstab Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-crosstab-wizard%}) item from the **Components** tray, a new tab will appear on the right-hand side of the **Web Report Designer**:

1\. Click the Crosstab Wizard from the Components tray

2\. Show the **Configure Crosstab** pane on the right side

![Launching Data in a Crosstab ><](images/wrd-components-tray-tables-crosstab-wizard.png)  

The following short video illustrates how to add a [Crosstab]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%}) report item with the wizard, bind it to an already existing [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) item populated with Northwind.Orders table and arrange the desired fields for displaying the OrderID as rows and total sum of Freight of the data records:

<iframe width="560" height="315" src="https://www.youtube.com/embed/E6O9eiyBJcQ?si=uC4PyMfkC3E5V3Uh" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Getting Started with the Crosstab]({%slug crosstab_item_get_started%})
* [DataSources]({%slug web-report-designer-user-guide-components-data-sources%})
* [Template Variations of the Table Report Item]({%slug table_template_items%})


