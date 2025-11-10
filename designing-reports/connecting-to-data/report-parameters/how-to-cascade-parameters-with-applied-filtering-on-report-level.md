---
title: Cascade Parameters with Filtering Set on Report
page_title: Cascade Parameters with filtering set on Report level explained
description: "Learn how to implement Cascading Parameters with applied filtering on Report level in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-report-level
tags: how,to,cascade,parameters,with,applied,filtering,on,report,level
published: True
position: 5
previous_url: /designing-reports-parameters-cascading-report-parameters
reportingArea: General
---

# Cascade Parameters with Applied Filtering on Report Level

To create cascading report parameters with applied filtering on report level follow the steps below: 

1. Using the [DataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}), bind the report to SqlDataSource with query:

	````SQL
SELECT
		Production.Product.ProductNumber,
		Production.Product.Name AS ProductName,
		Production.Product.ProductSubcategoryID,
		Production.ProductSubcategory.Name AS SubcategoryName
	FROM
		Production.Product
		INNER JOIN Production.ProductSubcategory
			ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
````


1. Click the ellipses on the __Report.ReportParameters__ property. This invokes the __ReportParameter Collection editor__.
1. Add new Report Parameter.
1. __Name__ it __ProductCategoryID__.
1. Set the __Type__ of the parameter to __Integer__.
1. Expand the __AvailableValues__.
1. Set the __DataSource__ using the __Data Source Wizard__ to SqlDataSource with query:

	````SQL
SELECT
		ProductCategoryID,
		Name AS CategoryName
	FROM
		Production.ProductCategory
````


1. It is not compulsory to set the __DataMember__ property when the data source contains only one table.
1. Set the __DisplayMember__ to __= Fields.CategoryName__ column.
1. Set the __ValueMember__ to __= Fields.ProductCategoryID__.
1. Set the __Text__ to __Product Category__.
1. Set the __Visible__ property to __True__ if needed.
1. Add new Report Parameter.
1. __Name__ it __ProductSubcategoryID__.
1. Set the __Type__ of the parameter to __Integer__.
1. Expand the __AvailableValues__.
1. Set the __DataSource__ using the __Data Source Wizard__ to SqlDataSource with query:

	````SQL
SELECT
		ProductCategoryID,
		ProductSubcategoryID,
		Name AS SubcategoryName
	FROM
		Production.ProductSubcategory
````


1. It is not compulsory to set the __DataMember__ property when the data source contains only one table.
1. Set the __DisplayMember__ to __= Fields.SubcategoryName__ column.
1. Set the __ValueMember__ to __= Fields.ProductSubcategoryID__.
1. Click on the ellipsis on the __Filters__ property.
1. Add new filter.
1. As __Expression__ choose __=Fields.ProductCategoryID__.
1. As __Operator__ choose __equals(=)__.
1. As Value choose __=Parameters.ProductCategoryID.Value__.
1. Click __OK__.
1. Set the __Multivalue__ to __false__ (or to __true__ if you want to be able to select more than one subcategory at a time).
1. Set the __Text__ to __Product Subcategory__.
1. Set the __Visible__ property to __True__ if needed.
1. Close the __ReportParameter Collection Editor__.
1. Click on the ellipsis on the __Filters__ property of the report to open the __Edit Filters__ dialog.
1. Add new filter.
1. As __Expression__ choose __=Fields.ProductSubcategoryID__.
1. As __Operator__ choose __equals(=)__ (or to __IN__ operator if you have set __ProductSubcategoryID__ parameter as multivalue parameter).
1. As Value choose __=Parameters.ProductSubcategoryID.Value__.
1. Click __OK__.
1. Preview the report. Use the Product Category and Product Subcategory parameters to filter the list of products shown in the report.
