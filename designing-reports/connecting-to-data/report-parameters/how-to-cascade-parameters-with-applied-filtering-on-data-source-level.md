---
title: Cascade Parameters with Data Source Filtering
page_title: Cascade Parameters with filtering on the data source explained
description: "Learn how to implement Cascading Parameters with applied filtering on data source level in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-data-source-level
tags: how,to,cascade,parameters,with,applied,filtering,on,data,source,level
published: True
position: 6
previous_url: /designing-reports-parameters-cascading-paramerets-filtering-database-level
reportingArea: General
---

# Cascade Parameters with Applied Filtering on Data Source Level

To create cascading report parameters with applied filtering on data source level follow the steps below:

## Cascading Parameters with applied filtering on Datasource level

1. Using the [Data Source Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}), bind the report to __SqlDataSource__ with query:

	````SQL
SELECT
		Production.Product.ProductNumber, Production.Product.Name AS ProductName, 
		Production.ProductSubcategory.Name AS SubcategoryName
	FROM
		Production.Product 
		INNER JOIN Production.ProductSubcategory 
			ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
	WHERE
		(Production.Product.ProductSubcategoryID = @ProductSubcategoryID)
````

	Note that there is a __WHERE__ clause that filters the datasource based on the _ProductSubcategoryID_ parameter.

1. Click the __Next__ button and the __"Configure Data Source Parameters"__ step of the __SqlDataSource__ appears. Set the __DbType__ of the ProductSubcategoryID
 parameter to __Int32__ and select "New Report Parameter" for the Value.
1. This invokes the __Report Parameter Editor__.
1. Name the new parameter __ProductSubcategoryID__.
1. Set the __Text__ to Product SubCategory.
1. Set the __Type__ of the parameter to Integer.
1. Set the __Visible__ property to True.
1. Expand the __AvailableValues__.
1. Start the Data Source Wizard and set the DataSource for the parameter to the following query:

	````SQL
SELECT
		ProductSubcategoryID,
		Name AS SubcategoryName
	FROM
		Production.ProductSubcategory
	WHERE
		(ProductCategoryID = @ProductCategoryID)
````

	Note that there is a __WHERE__ clause that filters the datasource based on the _ProductSubcategoryID_ parameter.

1. Click the __Next__ button and the __"Configure Data Source Parameters"__ step of the __SqlDataSource__ appears. Set the __DbType__ of the __ProductCategoryID__ parameter to __Int32__ and select "__New Report Parameter__" for the __Value__.
1. This invokes the __Report Parameter Editor__.
1. Name the new parameter __ProductCategoryID__.
1. Set the Text to __Product Category__.
1. Set the Type of the parameter to __Integer__.
1. Set the __Visible__ property to True.
1. Expand the AvailableValues.
1. Start the __Data Source Wizard__ and set the DataSource for the parameter to the following query:

	````SQL
SELECT
		ProductCategoryID,
		Name AS CategoryName
	FROM
		Production.ProductCategory
````


1. Click __Next__ and __Finish__ the Data Source Wizard.
1. Set the DisplayMember to __= Fields.CategoryName__ column.
1. Set the ValueMember to __= Fields.ProductCategoryID__.
1. It is not compulsory to set the DataMember property when the data source contains only one table.
1. Click __OK__ to close the Report Parameter Editor.
1. Click __Next__ and __Finish__ the Data Source Wizard for the ProductCategoryID parameter.
1. Select the __Report Parameter Editor__ for the __ProductSubcategoryID__ parameter.
1. Set the __DisplayMember__ to __= Fields.SubcategoryName__ column.
1. Set the __ValueMember__ to __= Fields.ProductSubcategoryID__.
1. It is not compulsory to set the DataMember property when the data source contains only one table.
1. Click __OK__ to close the __Report Parameter Editor__.
1. Click __Next__ and __Finish__ the __Data Source Wizard__ for the __ProductSubcategoryID__ parameter.
1. Preview the report. Use the Product Category and Product Subcategory parameters to filter the list of products shown in the report.
