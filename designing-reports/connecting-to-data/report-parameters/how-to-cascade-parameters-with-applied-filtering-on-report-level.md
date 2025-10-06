---
title: Cascade Parameters with Filtering Set on Report
page_title: Cascade Parameters with filtering set on Report level explained
description: "Learn how to implement Cascading Parameters with applied filtering on Report level in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-report-level
tags: how,to,cascade,parameters,with,applied,filtering,on,report,level
published: True
position: 5
previous_url: /designing-reports-parameters-cascading-report-parameters
---

# Cascade Parameters with Applied Filtering on Report Level

To create cascading report parameters with applied filtering on report level follow the steps below:

1. Using the [DataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}), bind the report to SqlDataSource with query:

   ```SQL
   SELECT
   	Production.Product.ProductNumber,
   	Production.Product.Name AS ProductName,
   	Production.Product.ProductSubcategoryID,
   	Production.ProductSubcategory.Name AS SubcategoryName
   FROM
   	Production.Product
   	INNER JOIN Production.ProductSubcategory
   		ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
   ```

1. Click the ellipses on the **Report.ReportParameters** property. This invokes the **ReportParameter Collection editor**.
1. Add new Report Parameter.
1. **Name** it **ProductCategoryID**.
1. Set the **Type** of the parameter to **Integer**.
1. Expand the **AvailableValues**.
1. Set the **DataSource** using the **Data Source Wizard** to SqlDataSource with query:

   ```SQL
   SELECT
   	ProductCategoryID,
   	Name AS CategoryName
   FROM
   	Production.ProductCategory
   ```

1. It is not compulsory to set the **DataMember** property when the data source contains only one table.
1. Set the **DisplayMember** to **= Fields.CategoryName** column.
1. Set the **ValueMember** to **= Fields.ProductCategoryID**.
1. Set the **Text** to **Product Category**.
1. Set the **Visible** property to **True** if needed.
1. Add new Report Parameter.
1. **Name** it **ProductSubcategoryID**.
1. Set the **Type** of the parameter to **Integer**.
1. Expand the **AvailableValues**.
1. Set the **DataSource** using the **Data Source Wizard** to SqlDataSource with query:

   ```SQL
   SELECT
   	ProductCategoryID,
   	ProductSubcategoryID,
   	Name AS SubcategoryName
   FROM
   	Production.ProductSubcategory
   ```

1. It is not compulsory to set the **DataMember** property when the data source contains only one table.
1. Set the **DisplayMember** to **= Fields.SubcategoryName** column.
1. Set the **ValueMember** to **= Fields.ProductSubcategoryID**.
1. Click on the ellipsis on the **Filters** property.
1. Add new filter.
1. As **Expression** choose **=Fields.ProductCategoryID**.
1. As **Operator** choose **equals(=)**.
1. As Value choose **=Parameters.ProductCategoryID.Value**.
1. Click **OK**.
1. Set the **Multivalue** to **false** (or to **true** if you want to be able to select more than one subcategory at a time).
1. Set the **Text** to **Product Subcategory**.
1. Set the **Visible** property to **True** if needed.
1. Close the **ReportParameter Collection Editor**.
1. Click on the ellipsis on the **Filters** property of the report to open the **Edit Filters** dialog.
1. Add new filter.
1. As **Expression** choose **=Fields.ProductSubcategoryID**.
1. As **Operator** choose **equals(=)** (or to **IN** operator if you have set **ProductSubcategoryID** parameter as multivalue parameter).
1. As Value choose **=Parameters.ProductSubcategoryID.Value**.
1. Click **OK**.
1. Preview the report. Use the Product Category and Product Subcategory parameters to filter the list of products shown in the report.
