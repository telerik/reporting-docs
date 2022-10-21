---
title: Getting Started
page_title: Getting Started with the Table Report Item
description: "Get up and running with Telerik Reporting, and learn how to create and use the Table report item and its Crosstab and List template items in reports."
slug: crosstab_item_get_started
tags: telerik, reporting, report, items, table, crosstab, list, getting, started
published: True
position: 1
---

# Getting Started with the Crosstab Report Item

This guide shows how to create and use the Telerik Reporting Crosstab report item in reports with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}).

* First, you will add a Crosstab item in an empty Report created with the Standalone Designer. You will use the Crosstab Wizard for this purpose.
* Following the instructions in the wizard, you will create a SqlDataSource to feed the Crosstab with data.
* The wizard will let us create also Groups with details and Totals. We will create one Row and one Column Group without Totals.
* Then, you will add a parent Row Group with Grand Totals outside the wizard to get acquainted with the process although the same may be done from the Wizard as well.

After the completion of this guide, you will also be able to configure a Crosstab in the Standalone Designer and achieve the following result: 

![The final Crosstab created with the Standalone Designer](images/CrosstabFinal.png)

## Open the Crosstab Wizard

Open the Standalone Report Designer and add a new `Blank report` item as explained in [Report Getting Started article]({%slug report_item_get_started%}). Select the Detail section of the new report and from the Standalone Designer Menu select `Insert`. Use the `Crosstab` button from the toolbar and the option `Crosstab Wizard` from the dropdown as shown in the image below:

![Open the Crosstab Wizard in the Standalone Designer](images/CrosstabWizardStart.png)

In the opened Crosstab Wizard hit the `Add New Data Source...` button. The `Create New Data Source` wizard will popup.

## Configure the SqlDataSource for the Crosstab

Select `SqlDataSource` from the list with the available DataSource components. Name it `crosstabSqlDataSource`.
Follow the instructions from the article [Designing Reports (Guide) - Step 3: Populate the Report with Data]({%slug telerikreporting/getting-started/first-steps%}#step-3-populate-the-report-with-data).
In this demo, we will use the following query from the __AdventureWorks__ sample database: 

````SQL
SELECT
	[Production].[Product].[Name] AS 'ProductName', 
	[Production].[ProductCategory].[Name] AS 'ProductCategory', 
	[Production].[ProductSubcategory].[Name] AS 'ProductSubCategory', 
	[Sales].[SalesOrderDetail].[LineTotal], 
	[Sales].[SalesOrderHeader].[OrderDate]
FROM (((([Sales].[SalesOrderDetail]
 INNER JOIN [Sales].[SalesOrderHeader]
 ON [Sales].[SalesOrderDetail].[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID])
 INNER JOIN [Production].[Product]
 ON [Sales].[SalesOrderDetail].[ProductID] = [Production].[Product].[ProductID])
 INNER JOIN [Production].[ProductSubcategory]
 ON [Production].[Product].[ProductSubcategoryID] = [Production].[ProductSubcategory].[ProductSubcategoryID])
 INNER JOIN [Production].[ProductCategory]
 ON [Production].[ProductSubcategory].[ProductCategoryID] = [Production].[ProductCategory].[ProductCategoryID])
````

You may preview the returned data and close the SqlDataSource wizard.

## Configure the Crosstab with the Crosstab Wizard

1. When you return to the Crosstab Wizard you will see the fields of the just created SqlDataSource. The image below how it should look like:

	![Choose a Data Source in the Crosstab Wizard in the Standalone Designer](images/CrosstabWizardChooseDataSource.png)

1. You may click `Next` and continue to the __Arrange Fields__ page of the wizard. Drag and drop the field as follows: 

	* `ProductSubCategory` to the _Row Groups_
	* `OrderDate.Year` to the _Column Groups_
	* `ProductName` to the _Detail Values_ - this will automatically apply the __Count__ [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}) to the value
	* `LineTotal` to the _Detail Values_ - this will automatically apply the __Sum__ aggregate function to the value

	Here is a screenshot of this configuration step:

	![Arrange Fields in the Crosstab Wizard in the Standalone Designer](images/CrosstabWizardArrangeFields.png)

1. The next page is `Choose Layout`. Let's leave its default layout as shown below:

	![Choose Layout in the Crosstab Wizard in the Standalone Designer](images/CrosstabWizardChooseLayout.png)

1. On the `Choose Style` page we may select a theme for the Crosstab layout. Let's try with the _Office_ theme:

	![Choose Office Style in the Crosstab Wizard in the Standalone Designer](images/CrosstabWizardChooseOfficeStyle.png)

1. We may `Review Summary` as displayed below and `Finish` the wizard:

	![Review Summary in the Crosstab Wizard in the Standalone Designer](images/CrosstabWizardReviewSummary.png)

The Wizard will close leaving a fully configured Crosstab in the middle of the Report Detail section:

![Crosstab in design view after finishing the Crosstab Wizard in the Standalone Designer](images/CrosstabAfterWizardDesign.png)

## Adjust the Crosstab Manually

1. Lets drag the Crosstab so that it starts from the top left corner of the Report Detail section. We won't add other components to this demo report, so we may also shrink the detail section of the Report. We may also delete the PageHeader and PageFooter sections added by default. Here is the `Design view` of the Crosstab now:

	![Manually adjusting the Crosstab in Standalone Designer - Design view](images/CrosstabManualAdjustDesign.png)

	And this is how the `Preview` looks like:

	![Manually adjusting the Crosstab in Standalone Designer - Preview](images/CrosstabManualAdjustPreview.png)

1. Let's format the numbers for the LineTotal. Select the detail cell under `Line Total` column and go to its Properties pane. By default, it is in the bottom-right corner of the Standalone Designer. Choose the `Format` property and click on the Ellipses to open the `Format Builder`. Select _Currency_ from the Categories and leave its default options as shown below:

	![Manually adjusting the Crosstab in Standalone Designer - Format Currency](images/CrosstabFormatCell.png)

	We may also increase the width of the LineTotal column to accommodate larger values. Just drag the right border of the Crosstab to the right.

1. Lets add new grouping by Categories. Currently, we have the Products grouped by SubCategories. Grouping them into Categories will make the Crosstab better organized an more readable. We will use the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) in `Extended Mode`.

	1. Select the Crosstab and in the Group Explorer that by default is at the bottom of the designer click on the Ellipses beside the `productSubCategory` Row Group.

	1. Select `Add Group` > `Parent Group` as shown below:

		![Crosstab in Standalone Designer - Add Parent Row Group Manually](images/CrosstabAddParentRowGroup.png)

	1. The Table Group editor will appear. Select `=Fields.ProductCategory` from the Expression dropdown as value for the Grouping (shown as _Group By_ in the editor):

		![Crosstab in Standalone Designer - Add Grouping to the new Parent Row Group](images/CrosstabParentRowGroupGrouping.png)

1. Now we can think of displaying also some aggregate values, for example Totals for the numeric fields like _LineTotal_.

	We need to add a column on the right that is outside the detail group of the Crosstab. For this purpose:

	1. Right-click over the last Crosstab column and from the context menu select `Insert Column` > `Outside Group - Right`:

		![Crosstab in Standalone Designer - Add New Column outside the Group](images/CrosstabAddColumnOutsideGroup.png)

		The new column will appear with empty cells.

	1. We may leave the top header row that displays the year for the orders empty in the new column. The second header we may name `Line Grand Total` as this would be the overall total for all years.

	1. Copy and Paste the Expression from the previous column `Line Total `. Note that when you preview the report it displays the correct Grand Total as the context for executing the Expression is not limited by year.

	1. Lets do some final adjustments like

		* renaming _Product Name_ to `Products Line Count` that actually shows how many products from the line we have had

		* increasing some column widths to accommodate all the content

		* applying background color to the Grand Totals to distinguish them easier

The expected result is displayed in the beginning of our guide.

## Next Steps

* [(Demo) Product Sales Report with a Crosstab Summary](https://demos.telerik.com/reporting/product-sales)
* [(Demo) List-Bound Report](https://demos.telerik.com/reporting/list-bound-report)
* [Basic Concepts of the Table, Crosstab, and List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/basic-concepts%})
* [Table Class API Reference](/api/telerik.reporting.table)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
* [Knowledge Base Section](/knowledge-base)

## See Also

* [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})
* [Report Getting Started]({%slug report_item_get_started%})
* [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%})
* [Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%})
