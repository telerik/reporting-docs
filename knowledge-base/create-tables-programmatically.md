---
title: How to Create Tables Programmatically in Telerik Reporting
description: Learn how to create tables at runtime using a dynamic SQL query in Telerik Reporting.
type: how-to
page_title: How to Create Tables Programmatically in Telerik Reporting
meta_title: How to Create Tables Programmatically in Telerik Reporting
slug: generating-runtime-tables-telerik-reporting
tags: telerik reporting, runtime report creation, sql query, programmatic report, report generation
res_type: kb
ticketid: 1692210
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td>
Progress® Telerik® Reporting
</td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.521 </td>
</tr>
</tbody>
</table>

## Description

I want to generate tables programmatically using static (or dynamically retrieved) data.

## Solution

To generate reports dynamically at runtime based on a SQL query, use the Telerik Reporting API to define the report structure programmatically. Below is a code example demonstrating how to create such reports and save them as `.trdp` files for further use in report viewers.

### Steps

1. Define the SQL query and connection string to your database.
2. Create the report structure programmatically, including headers, footers, and a detail section.
3. Use `SqlDataSource` to retrieve data from the database and bind it to a dynamically generated table.
4. Populate the table with columns and rows based on the retrieved data.
5. Package the report into a `.trdp` file for use in Telerik Reporting viewers.

### Code Example

```csharp
namespace RuntimeReportExample
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string selectCommand = "SELECT * FROM production.productphoto;";
            string connectionString = "server=localhost\\sqlexpress;database=AdventureWorks2022;trusted_connection=true;";

            // Initialize the report
            Telerik.Reporting.Report report = new Telerik.Reporting.Report();

            // Define header, footer, and detail sections
            var pageHeaderSection = new Telerik.Reporting.PageHeaderSection { Height = Telerik.Reporting.Drawing.Unit.Cm(2.5D), Name = "pageHeaderSection1" };
            var pageFooterSection = new Telerik.Reporting.PageFooterSection { Height = Telerik.Reporting.Drawing.Unit.Cm(2.5D), Name = "pageFooterSection1" };
            var detailSection = new Telerik.Reporting.DetailSection { Height = Telerik.Reporting.Drawing.Unit.Cm(5D), Name = "detail" };

            // Define the table and its data source
            var sqlDataSource = new Telerik.Reporting.SqlDataSource(connectionString, selectCommand)
            {
                Name = "sqlDataSource1",
                ProviderName = "System.Data.SqlClient"
            };
            var table = new Telerik.Reporting.Table { DataSource = sqlDataSource, Name = "table1" };

            // Create rows and columns dynamically based on retrieved data
            var dataTable = new DataTable();
            using (var connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand(selectCommand, connection);
                connection.Open();
                var reader = command.ExecuteReader();
                dataTable.Load(reader);

                table.Body.Rows.Add(new TableBodyRow(Telerik.Reporting.Drawing.Unit.Cm(0.609D)));

                int colIndex = 0;
                foreach (DataColumn column in dataTable.Columns)
                {
                    table.Body.Columns.Add(new TableBodyColumn(Telerik.Reporting.Drawing.Unit.Cm(2.99D)));
                    var columnGroup = new TableGroup();

                    var headerTextBox = new TextBox
                    {
                        Value = column.ColumnName,
                        Name = column.ColumnName + "TextBoxHeader",
                        Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Cm(2.99D), Telerik.Reporting.Drawing.Unit.Cm(0.609D)),
                    };
                    columnGroup.Name = column.ColumnName;
                    columnGroup.ReportItem = headerTextBox;
                    table.ColumnGroups.Add(columnGroup);

                    var bodyTextBox = new TextBox
                    {
                        Value = "= Fields." + column.ColumnName,
                        Name = column.ColumnName + "TextBoxBody",
                        Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Cm(2.99D), Telerik.Reporting.Drawing.Unit.Cm(0.609D))
                    };

                    table.Body.SetCellContent(0, colIndex, bodyTextBox);
                    table.Items.AddRange(new ReportItemBase[] { bodyTextBox, headerTextBox });
                    colIndex++;
                }
            }

            detailSection.Items.AddRange(new ReportItemBase[] { table });

            // Finalize the report structure
            report.Name = "Report1";
            report.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Mm(20D), Telerik.Reporting.Drawing.Unit.Mm(20D), Telerik.Reporting.Drawing.Unit.Mm(20D), Telerik.Reporting.Drawing.Unit.Mm(20D));
            report.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
            report.Width = Telerik.Reporting.Drawing.Unit.Cm(17D);
            report.Items.AddRange(new ReportItemBase[] { pageHeaderSection, detailSection, pageFooterSection });

            // Package the report as a TRDP file
            var reportPackager = new ReportPackager();
            using (var targetStream = System.IO.File.Create("DynamicReport.trdp"))
            {
                reportPackager.Package(report, targetStream);
            }
        }
    }
}
```

### Notes

- Use the [Telerik Reporting API](https://docs.telerik.com/reporting/embedding-reports/program-the-report-definition/create-report-programmatically) to modify existing `.trdp` files, which reduces boilerplate code.
- To modify an existing report, unpack the `.trdp` file, make changes, and repackage it. Refer to [Packaging and Unpacking Reports](https://docs.telerik.com/reporting/embedding-reports/program-the-report-definition/package-report-definition#packaging-clr-report-definition).

## See Also

- [Creating Reports Programmatically](https://docs.telerik.com/reporting/embedding-reports/program-the-report-definition/create-report-programmatically)
- [ObjectDataSource Component](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source)
- [Packaging and Unpacking Reports](https://docs.telerik.com/reporting/embedding-reports/program-the-report-definition/package-report-definition#packaging-clr-report-definition)
---