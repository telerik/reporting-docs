---
title: SubReport
page_title: SubReport
description: Web Report Designer offers different Table Components that can be used to visualize the data records in the reports.
slug: web-report-designer-user-guide-components-tables
tags: web, report, design, report, components, subreport, hierarchy, master, detail
published: True
position: 3
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# SubReport

The **Web Report Designer** offers a **Report** section inside the **Components** tray allowing the end-user to add a **SubReport** item which enables you to display reports within reports and serves as a container, similar to the report sections, growing in size depending on its children.

![SubReport ><](images/wrd-components-subreport.png)   

## Creating Master-Detail Reports with SubReports

The following example shows how to achieve a master-detail report using a SubReport Item. The master report (e.g. *CategoriesProductsSubreport.trdp*) contains a table filled with the Northwind.**Categories** table. The **SubReport** item (*ProductsReport.trdp*) shows the Northwind.**Products** records filtered by the respective **CategoryID**.

The report is achieved by using the following steps:

### Building the Child Report

1. Start with a blank report (*ProductsReport.trdp*) that will be used for the child report, select its header/footer section and delete them.

![SubReport ><](images/wrd-components-subreport-new-report.png)   

2. Add a new [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) populated with the Northwind.Products table:

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

3. Set the **DataSource** of the Report using the created SQLDataSource with the Products:

![Report DataSource ><](images/wrd-components-subreport-report-data-source.png)    

4. From the **Components tray** drag two **TextBox** report items to the Details section and set the **Value** property to be bound to the **ProductName** and **UnitPrice** fields respectively:

![Bind Product Fields ><](images/wrd-components-subreport-bind-product-fields.png)     

5. Preview the report to see that all Products are listed.

6. Add an integer report parameter **ProductCategoryID** which will be used for filtering the products:

![Create Report Parameter ><](images/wrd-components-subreport-create-report-parameter.png)   

7. Update the SELECT query of the added SQLDataSource and add a WHERE clause using a SQL parameter (which is mapped to the previously created report parameter):

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

8. Save the report (*ProductsReport.trdp*). This would be used as our sub-report.

### Building the Master Report

1. Create a new blank report (*CategoriesProducts.trdp*).

2. Add a new [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) filled with the Northwind.Categories table:

```SQL
SELECT
	[dbo].[Categories].[CategoryID], 
	[dbo].[Categories].[CategoryName], 
	[dbo].[Categories].[Description], 
	[dbo].[Categories].[Picture]
FROM [dbo].[Categories]
```

3. Select the report's Detail section and use the [Table Wizard]({%slug web-report-designer-user-guide-components-tables%}) to add a table bound to the just added SQLDataSource:

![Create Categories Table ><](images/wrd-components-subreport-create-categories-table.png)   

4. Select the "Picture" header and change its text to "Products".

5. Select the "Picture" data row >> the cell bound to the Picture field and add a **SubReport** item by selecting the respective report item from the Components tray:

![Adding SubReport ><](images/wrd-components-subreport-adding-subreport.png)   

6. Specify the **Inner Report** for the **SubReport** item and select the Uri option that refers to the previously created ProductsReport.trdp:

![Setup UriReportSource ><](images/wrd-components-subreport-urireportsource.png)   

7. Adjust the Parameters and link the SubReport parameter (ProductCategoryID) with the master report's **CategoryID** field:

![Setup ProductCategoryID Report Parameter ><](images/wrd-components-subreport-setup-productcategoryid-report-parameter.png)   

8. Save the changes and preview the master report. You will see all categories listed with the respective products for each category: 

![Master-Detail hierarchy ><](images/wrd-components-subreport-master-detail-hierarchy.png)    

A detailed video is available covering the complete process:

<iframe width="560" height="315" src="https://www.youtube.com/embed/TDRZETEWtSk?si=Lgm3HkxytrWh0zTB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) 
* [DataSources]({%slug web-report-designer-user-guide-components-data-sources%}) 


