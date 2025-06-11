---
title: Tables
page_title: Web Report Designer offers different Table Components that can be used to visualize the data records in the reports.
description: Explore the available Table report components offered by the Web Report Designer.
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
      <th style="width:30%">Data Source</th><th>Description</th>
    </tr>
    <tr>
      <td><a href="">List</a></td>
      <td>Displays data from a set of Business Objects creating a free-form data layout. You are not limited to a grid layout, you can freely place fields inside the List.</td>
    </tr>
    <tr>
      <td><a href="">Table</a></td>
      <td>Displays report data in cells that are organized into rows and columns..</td>
    </tr>
    <tr>
      <td><a href="">Crosstab</a></td>
      <td>Displays aggregated data summaries that are grouped in rows and columns. The number of rows and columns for groups is determined by the number of unique values for each row and column groups.</td>
    </tr>
    <tr>
      <td><a href="">Table Wizard</a></td>
      <td>The Table wizard guides you through the process of adding a Table item to a report.</td>
    </tr>
    <tr>
      <td><a href="">Crosstab Wizard</a></td>
      <td>The Crosstab wizard guides you through the process of adding a Crosstab item to a report.</td>
    </tr>
  </table>
</div>


## List

By dragging the `List` item from the **Components** tray and dropping it onto the **Details** section of the report, you are ready to build the desired layout with report items like TextBoxes and use the already defined [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}).
The following short video illustrates how to add a List, bind it to an already existing [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) item and adding a TextBox report item for displaying the FirstName of the data records:

>caption Displaying Data in a List 

![Displaying Data in a List ><](images/wrd-components-tray-tables-list.gif)     

## Table 

By dragging the `Table` item from the **Components** tray and dropping it onto the **Details** section of the report, you are ready to build the desired layout with report items like TextBoxes and use the already defined [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}).

When added from a report designer, the Table contains three columns with a table header row and a details row for the data:

![Empty Table ><](images/wrd-components-tray-tables-table-empty.png)     

The following short video illustrates how to add an empty Table report item, bind it to an already existing [CSV Data Source]({%slug web-report-designer-user-guide-components-data-sources%}), add the necessary TextBox report items for the column headers and for the data records displaying the First/Last Names:

![Displaying CSV Data in a Table ><](images/wrd-components-tray-tables-table-data-popuating-from-scratch.gif)        

## Crosstab 

## Table Wizard

By clicking the [Table Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-crosstab-wizard%}) item from the **Components** tray, a new tab will appear on the right-hand side of the **Web Report Designer**:

>caption Table Wizard

![Launching Data in a Table ><](images/wrd-components-tray-tables-table-wizard.png)      

The following short video illustrates how to add a Table report item with the wizard, bind it to an already existing [Web Service Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) item and arrange the desired fields for displaying the name and localized name of the data records:

![Displaying Data in a Table ><](images/wrd-components-tray-tables-table-wizard-data-popuating.gif)      

## Crosstab Wizard
 
By clicking the [Crosstab Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-crosstab-wizard%}) item from the **Components** tray, a new tab will appear on the right-hand side of the **Web Report Designer**:

>caption Crosstab Wizard

![Launching Data in a Crosstab ><](images/wrd-components-tray-tables-crosstab-wizard.png)      

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Getting Started with the Crosstab]({%slug crosstab_item_get_started%})
* [DataSources]({%slug web-report-designer-user-guide-components-data-sources%})


