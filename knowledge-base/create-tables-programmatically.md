---
title: How to Create Tables Programmatically in Telerik Reporting
description: Learn how to create tables from scratch at runtime using Telerik Reporting.
type: how-to
page_title: How to Create Tables Programmatically in Telerik Reporting
meta_title: How to Create Tables Programmatically in Telerik Reporting
slug: generating-runtime-tables-telerik-reporting
tags: telerik reporting, runtime report creation, programmatic report, report generation, dynamic table
res_type: kb
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Progress® Telerik® Reporting </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.1.25.521 </td>
        </tr>
    </tbody>
</table>

## Description

This article demonstrates how to create tables programmatically in Telerik Reporting. While this approach offers full control over table structure and data binding, it is generally recommended to start with a designer-generated table and modify it programmatically if needed. The Telerik Report Designer handles complex layout and grouping logic, making it easier to maintain and extend reports.

## Prerequisites

Before creating a table programmatically, ensure you have a valid `Telerik.Reporting.Report` object with a predefined structure and a data source ready be set to the table. If not, follow the steps below to create them programmatically.

### 1. Initializing the Report

Create a new report object and configure its basic settings:

````csharp
Telerik.Reporting.Report report = new Telerik.Reporting.Report();
report.Name = "Report1";
report.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Mm(20D), Telerik.Reporting.Drawing.Unit.Mm(20D), Telerik.Reporting.Drawing.Unit.Mm(20D), Telerik.Reporting.Drawing.Unit.Mm(20D));
report.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
report.Width = Telerik.Reporting.Drawing.Unit.Cm(17D);
````

### 2. Adding Report Sections

Most reports include three main sections:

- **PageHeaderSection**: Appears at the top of each page.
- **DetailSection**: Contains the main content, such as tables or charts.
- **PageFooterSection**: Appears at the bottom of each page.

````csharp
var pageHeaderSection = new Telerik.Reporting.PageHeaderSection();
pageHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Cm(2.5D);
pageHeaderSection.Name = "pageHeaderSection";

var detailSection = new Telerik.Reporting.DetailSection();
detailSection.Height = Telerik.Reporting.Drawing.Unit.Cm(5D);
detailSection.Name = "detail";

var pageFooterSection = new Telerik.Reporting.PageFooterSection();
pageFooterSection.Height = Telerik.Reporting.Drawing.Unit.Cm(2.5D);
pageFooterSection.Name = "pageFooterSection";

report.Items.AddRange(new Telerik.Reporting.ReportItemBase[] { pageHeaderSection, detailSection, pageFooterSection });
````

### 3. Preparing the Data Source

Telerik Reporting supports various data sources including JSON, CSV, SQL, business objects, and others. For more information, check the article [Data Source Components at a Glance]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) This example uses an [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}):

````csharp
string selectCommand = "SELECT * FROM production.productphoto;";
string connectionString = "server=localhost\\sqlexpress;database=AdventureWorks2022;trusted_connection=true;";
var sqlDataSource = new Telerik.Reporting.SqlDataSource(connectionString, selectCommand);
sqlDataSource.Name = "sqlDataSource";
sqlDataSource.ProviderName = "System.Data.SqlClient";
````

## Solution

Once the report structure and data source are ready, you can proceed with creating the table.

### 1. Create the Table

Instantiate a `Telerik.Reporting.Table` object, assign the pre-created data source, and add the table to the detail section:

````csharp
var table = new Telerik.Reporting.Table();
table.Name = "table";
table.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Cm(1.5D), Telerik.Reporting.Drawing.Unit.Cm(1.5D));
table.DataSource = sqlDataSource;
detailSection.Items.Add(table);
````

### 2. Add a Detail Row Group

Add a detail row group and a body row.

````csharp
var rowGroup = new Telerik.Reporting.TableGroup();
rowGroup.Name = "detailTableGroup";
rowGroup.Groupings.Add(new Telerik.Reporting.Grouping(null));
table.RowGroups.Add(rowGroup);
table.Body.Rows.Add(new Telerik.Reporting.TableBodyRow(Telerik.Reporting.Drawing.Unit.Cm(0.609D)));
````

>note Adding a detail row group is mandatory for the table to display data. When using a report designer, this group is created automatically. To mark the group as a detail group programmatically, use a null grouping as shown above.

### 3. Add Columns Dynamically Based on Data

The method for obtaining field names for your table columns depends on the type of data source you are using. In this example, since an `SqlDataSource` is utilized, the code demonstrates how to extract column names directly from an SQL database. If your data source is a CSV, JSON, or another format, you will need to adjust the logic to extract field names appropriately and create the string collection named `columnNames`. Once you have the field names, the process for dynamically generating table columns remains consistent with the below code snippet.

````csharp
using (var connection = new System.Data.SqlClient.SqlConnection(connectionString))
{
    // retrieve the column names from the data source
    var command = new System.Data.SqlClient.SqlCommand(selectCommand, connection);
    connection.Open();
    var reader = command.ExecuteReader();
    var dataTable = new System.Data.DataTable();
    dataTable.Load(reader);
    var columnNames = dataTable.Columns.Cast<System.Data.DataColumn>().Select(c => c.ColumnName);

    // for each column name
    int colIndex = 0;
    foreach (string columnName in columnNames)
    {
        // add column
        var column = new Telerik.Reporting.TableBodyColumn(Telerik.Reporting.Drawing.Unit.Cm(2.99D));
        table.Body.Columns.Add(column);

        // add column header
        var headerTextBox = new Telerik.Reporting.TextBox();
        headerTextBox.Name = columnName + "TextBoxHeader";
        headerTextBox.Value = columnName;
        headerTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Cm(2.99D), Telerik.Reporting.Drawing.Unit.Cm(0.609D));

        var columnGroup = new Telerik.Reporting.TableGroup();
        columnGroup.Name = columnName;
        columnGroup.ReportItem = headerTextBox;
        table.ColumnGroups.Add(columnGroup);

        // add column body
        var bodyTextBox = new Telerik.Reporting.TextBox();
        bodyTextBox.Name = columnName + "TextBoxBody";
        bodyTextBox.Value = "= Fields." + columnName;
        bodyTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Cm(2.99D), Telerik.Reporting.Drawing.Unit.Cm(0.609D));
        table.Body.SetCellContent(0, colIndex, bodyTextBox);

        colIndex++;
    }
}
````

## Demo

You can find a sample console application that demonstrates the above approach at [reporting-samples/ProgrammaticTableGeneration](https://github.com/telerik/reporting-samples/tree/master/ProgrammaticTableGeneration).