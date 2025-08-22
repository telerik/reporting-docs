---
title: SubReport
page_title: SubReport
description: Learn how to use SubReports in the Web Report Designer to embed reports within other reports for creating master-detail hierarchies and reusable report components.
slug: web-report-designer-user-guide-components-subreport
tags: web, report, design, components, subreport, hierarchy, master, detail
published: True
position: 3
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# SubReport

A SubReport is a report component that allows you to embed one report inside another report. This lets you create complex report layouts, display hierarchical data relationships, and build reusable report components that can be shared across multiple reports.

SubReports act as containers that automatically adjust their size based on the content of the embedded report. You can use SubReports to create:

* Master-detail relationships&mdash;Display related data in a parent-child format (for example, customers and their orders).
* Reusable components&mdash;Create shared headers, footers, or report sections that can be used across multiple reports.
* Complex layouts&mdash;Combine different data sources and report structures within a single report.
* Hierarchical data&mdash;Show nested data relationships with proper grouping and organization.

The next video demonstrates how to [create master-detail](#creating-master-detail-reports-with-subreports) reports by using SubReports in the Telerik Web Report Designer:

<iframe width="560" height="315" src="https://www.youtube.com/embed/AH2XdSDDiEs?si=ys2b1ROAXh5qs3Aw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Prerequisites

Before working with SubReports, ensure you have:

* Created and configured [data sources]({%slug web-report-designer-user-guide-components-data-sources%}) for both master and child reports.
* Planned your data relationships and report hierarchy.

## Creating Master-Detail Reports with SubReports

The following example demonstrates how to create a master-detail report using SubReports. The master report (*CategoriesProducts.trdp*) contains a table with Northwind **Categories** data. The SubReport (*ProductsReport.trdp*) displays Northwind **Products** records filtered by the respective `CategoryID`.

> To follow along with the steps below, you need access to an instance of the [Northwind](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/northwind-pubs) database for [Microsoft SQL Server](https://learn.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server?view=sql-server-ver17).

### Step 1: Building the Child Report

1. Start with a blank report (*ProductsReport.trdp*) that will serve as the child report. Select the header and footer sections and delete them.

    ![SubReport ><](images/wrd-components-subreport-new-report.png)

1. Add a new [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) populated with the `Northwind.Products` table:

    Here is the SQL query that selects the respective data:

    ```SQL
    SELECT
        [dbo].[Products].[ProductID], 
        [dbo].[Products].[ProductName], 
        [dbo].[Products].[Discontinued], 
        [dbo].[Products].[SupplierID], 
        [dbo].[Products].[CategoryID], 
        [dbo].[Products].[QuantityPerUnit], 
        [dbo].[Products].[UnitPrice], 
        [dbo].[Products].[UnitsInStock], 
        [dbo].[Products].[UnitsOnOrder], 
        [dbo].[Products].[ReorderLevel]
    FROM [dbo].[Products]
    ```

1. Set the **DataSource** of the report using the created SQLDataSource:

    ![Report DataSource ><](images/wrd-components-subreport-report-data-source.png)

1. From the **Components** tab, drag two **TextBox** report items to the Detail section:

    4.1. Select each of the TextBoxes.

    4.2. Bind the the **Value** property of the TextBoxes to the `ProductName` and `UnitPrice` fields respectively.

    4.3. Use the **Expression** dialog to set the desired field.

    ![Bind Product Fields ><](images/wrd-components-subreport-bind-product-fields.png)

1. Preview the report to verify that all Products are listed.

1. Add an integer report parameter called `ProductCategoryID` which you will use to filter by product:

    ![Create Report Parameter ><](images/wrd-components-subreport-create-report-parameter.png)

1. Update the `SELECT` query of the added SQLDataSource and add a `WHERE` clause using an SQL parameter (which is mapped to the previously created report parameter):

    ```SQL
    SELECT
        [dbo].[Products].[ProductID], 
        [dbo].[Products].[ProductName], 
        [dbo].[Products].[Discontinued], 
        [dbo].[Products].[SupplierID], 
        [dbo].[Products].[CategoryID], 
        [dbo].[Products].[QuantityPerUnit], 
        [dbo].[Products].[UnitPrice], 
        [dbo].[Products].[UnitsInStock], 
        [dbo].[Products].[UnitsOnOrder], 
        [dbo].[Products].[ReorderLevel]
    FROM [dbo].[Products]
    WHERE [dbo].[Products].[CategoryID]=@sqlParamCategoryId
    ```

    ![Update SQL Select ><](images/wrd-components-subreport-update-sql-select.png)

1. Save the report (*ProductsReport.trdp*). You will use it as a child report.

### Step 2: Building the Master Report

1. Create a new blank report (*CategoriesProducts.trdp*).

1. Add a new [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) filled with the `Northwind.Categories` table:

    ```SQL
    SELECT
        [dbo].[Categories].[CategoryID], 
        [dbo].[Categories].[CategoryName], 
        [dbo].[Categories].[Description], 
        [dbo].[Categories].[Picture]
    FROM [dbo].[Categories]
    ```

1. Select the report's Detail section and use the [Table Wizard]({%slug web-report-designer-user-guide-components-tables%}) to add a table bound to the just added SQLDataSource:

    ![Create Categories Table ><](images/wrd-components-subreport-create-categories-table.png)

1. Select the **Picture** header and change its text to **Products**.

1. Select the data cell bound to the `Picture` field (`[=Fields.Picture]`) and add a **SubReport** item by selecting it from the **Components** tab:

    ![Adding SubReport ><](images/wrd-components-subreport-adding-subreport.png)

1. Specify the **Inner Report** for the **SubReport** item and select the Uri option that refers to the previously created `ProductsReport.trdp`:

    ![Setup UriReportSource ><](images/wrd-components-subreport-urireportsource.png)

1. Set up the relation between the parent and child reports:

    7.1. Adjust the parameters.

    7.2. Link the SubReport parameter (`ProductCategoryID`) with the master report's `CategoryID` field.

    ![Setup ProductCategoryID Report Parameter ><](images/wrd-components-subreport-setup-productcategoryid-report-parameter.png)

1. Save the changes and preview the master report. You will see all categories listed with the respective products for each category:

    ![Master-Detail hierarchy ><](images/wrd-components-subreport-master-detail-hierarchy.png)

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%})
