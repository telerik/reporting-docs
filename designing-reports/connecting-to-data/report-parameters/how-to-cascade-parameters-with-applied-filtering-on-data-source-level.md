---
title: Cascade Parameters with Data Source Filtering
page_title: Cascade Parameters with filtering on the data source explained
description: "Learn how to implement Cascading Parameters with applied filtering on data source level in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-data-source-level
tags: how,to,cascade,parameters,with,applied,filtering,on,data,source,level
published: True
position: 6
previous_url: /designing-reports-parameters-cascading-paramerets-filtering-database-level
---

# Cascade Parameters with Applied Filtering on Data Source Level

To create cascading report parameters with applied filtering on data source level follow the steps below:

## Cascading Parameters with applied filtering on Datasource level

1. Using the [Data Source Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}), bind the report to **SqlDataSource** with query:

   ```SQL
   SELECT
   	Production.Product.ProductNumber, Production.Product.Name AS ProductName,
   	Production.ProductSubcategory.Name AS SubcategoryName
   FROM
   	Production.Product
   	INNER JOIN Production.ProductSubcategory
   		ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
   WHERE
   	(Production.Product.ProductSubcategoryID = @ProductSubcategoryID)
   ```

   Note that there is a **WHERE** clause that filters the datasource based on the _ProductSubcategoryID_ parameter.

1. Click the **Next** button and the **"Configure Data Source Parameters"** step of the **SqlDataSource** appears. Set the **DbType** of the ProductSubcategoryID
   parameter to **Int32** and select "New Report Parameter" for the Value.
1. This invokes the **Report Parameter Editor**.
1. Name the new parameter **ProductSubcategoryID**.
1. Set the **Text** to Product SubCategory.
1. Set the **Type** of the parameter to Integer.
1. Set the **Visible** property to True.
1. Expand the **AvailableValues**.
1. Start the Data Source Wizard and set the DataSource for the parameter to the following query:

   ```SQL
   SELECT
   	ProductSubcategoryID,
   	Name AS SubcategoryName
   FROM
   	Production.ProductSubcategory
   WHERE
   	(ProductCategoryID = @ProductCategoryID)
   ```

   Note that there is a **WHERE** clause that filters the datasource based on the _ProductSubcategoryID_ parameter.

1. Click the **Next** button and the **"Configure Data Source Parameters"** step of the **SqlDataSource** appears. Set the **DbType** of the **ProductCategoryID** parameter to **Int32** and select "**New Report Parameter**" for the **Value**.
1. This invokes the **Report Parameter Editor**.
1. Name the new parameter **ProductCategoryID**.
1. Set the Text to **Product Category**.
1. Set the Type of the parameter to **Integer**.
1. Set the **Visible** property to True.
1. Expand the AvailableValues.
1. Start the **Data Source Wizard** and set the DataSource for the parameter to the following query:

   ```SQL
   SELECT
   	ProductCategoryID,
   	Name AS CategoryName
   FROM
   	Production.ProductCategory
   ```

1. Click **Next** and **Finish** the Data Source Wizard.
1. Set the DisplayMember to **= Fields.CategoryName** column.
1. Set the ValueMember to **= Fields.ProductCategoryID**.
1. It is not compulsory to set the DataMember property when the data source contains only one table.
1. Click **OK** to close the Report Parameter Editor.
1. Click **Next** and **Finish** the Data Source Wizard for the ProductCategoryID parameter.
1. Select the **Report Parameter Editor** for the **ProductSubcategoryID** parameter.
1. Set the **DisplayMember** to **= Fields.SubcategoryName** column.
1. Set the **ValueMember** to **= Fields.ProductSubcategoryID**.
1. It is not compulsory to set the DataMember property when the data source contains only one table.
1. Click **OK** to close the **Report Parameter Editor**.
1. Click **Next** and **Finish** the **Data Source Wizard** for the **ProductSubcategoryID** parameter.
1. Preview the report. Use the Product Category and Product Subcategory parameters to filter the list of products shown in the report.
