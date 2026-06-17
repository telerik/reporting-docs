---
title: Create Master-Detail Reports with SubReports
page_title: Create Master-Detail Reports by Using SubReport Items
description: "Learn how to create a master-detail report in Telerik Reporting using a SubReport item or a single Table with nested row groups."
type: how-to
slug: telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-master-detail-report-using-a-subreport-item
previous_url: /designing-reports/report-structure/how-to/how-to-create-a-master-detail-report-using-a-subreport-item, /designing-reports-master-detail
tags: telerik reporting, report, items, create, master, detail, report, using, subreport, item
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

How can I create a Master-Detail report by using a `SubReport` report item that contains the detail data in Visual Studio Report Designer?

## Solution

To achieve the desired scenario:

1. [Create the detail report](#creating-the-detail-report)
1. [Create a report parameter and a filter that uses the report parameter](#configuring-the-report-parameter-and-filter)
1. [Create the master report](#creating-the-master-report)
1. [Configure the SubReport item](#configuring-the-subreport-item)

For an alternative approach that requires no separate detail report, see [Creating a Master-Detail Layout with a Table and Nested Row Groups](#creating-a-master-detail-layout-with-a-table-and-nested-row-groups).

The master report data in this example consists of product categories from the AdventureWorks database. The detail report displays product names and numbers. The example uses the [Report Parameter](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview) to filter the detail report by a product category.

### Creating the Detail Report in Visual Studio Report Designer

1. Create a new class library named `MasterDetail` that will contain the reports.

   ![The New Project Visual Studio wizard page for creating a ClassLibrary for the reports](images/MasterDetail0000.png)

1. Add a new Telerik Report item to the project through **Add New item** -> **Reporting** -> **Telerik Reporting [VERSION] Wizard** -> **Blank Report**. Name it `DetailReport`.
1. From the upper left corner of design surface, click the report selector to select the report.
1. Navigate to the `DataSource` property of the report, open it, select **Add New Data Source** and choose [**SqlDataSource Component**](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview).
1. Set up the data connection to the AdventureWorks database, save it so you can use it later on when creating the master report. Click **Next**. Enter the following SQL statement. Click **Finish** in the DataSource wizard.

   ```SQL
   SELECT
   	P.Name,ProductID,ProductNumber,PC.ProductCategoryID
   FROM
   	Production.Product P,
   	Production.ProductSubcategory PS,
   	Production.ProductCategory PC
   WHERE
   	P.ProductSubcategoryID=PS.ProductSubcategoryID
   	AND PS.ProductCategoryID=PC.ProductCategoryID
   ```

1. Remove the page header and page footer sections. Open the [Data Explorer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer) and add the **ProductNumber** and **Name** fields to the detail section of the report.

The detail report in the designer will now look like the following.

![The subreport we are going to use as a detail report as it appears in the Visual Studio Report Designer](images/MasterDetail0010.png)

### Configuring the Report Parameter and Filter

Create a report parameter and a filter that uses the report parameter. The master report passes in the current **ProductCategoryID** for each record and the detail report displays all products with that **ProductCategoryID**.

1. In the **Property Window**, navigate to the **ReportParameters** property and click the ellipses.
1. In the ReportParameter Collection Editor, click the **Add** button. In the **Name** property for the parameter enter **ProductCategoryID**. Enter zero for the **Value**  property.

   ![ReportParameter Collection Editor with the configured parameter ProductCategoryID](images/MasterDetail0011.png)

1. In the **Property Window**, navigate to the **Filters** property and click the ellipses.
1. Click the **New** button to create a new filter. In the **Expression** drop-down for the filter select **=Fields.ProductCategoryID**. Leave the operator at the default equals to (**=**) sign. In the **Value**  property drop-down, select the **=Parameters.ProductCategoryID.Value** report parameter you created earlier.

   ![The Edit Filters dialog of the Visual Studio Report Designer configured for filtering on the ProductCategoryID parameter value](images/MasterDetail0013.png)

1. Click the **OK** button to close the dialog.

### Creating the Master Report

The master report will contain only a simple listing of product categories.

1. Add a new report item to the project and name it **MasterReport**.
1. The [Report Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview) opens when you select **Telerik Report [VERSION] Wizard - Band Report Wizard**.
1. On the **Choose Data Source** page of the wizard, click the **Add New Data Source** button and select [**SqlDataSource Component**](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview). On the **Choose Your Data Connection** page of the wizard, select the saved database connection you created for the detail report. Click the **Next** button.
1. Enter the SQL statement below and click the **Next** button.

   ```SQL
   SELECT ProductCategoryID,Name FROM Production.ProductCategory
   ```

1. In the **Design Data Layout** page of the wizard, add the **Name** column to the detail section and click the **Next** button. Accept the remaining defaults to complete the wizard.

### Configuring the SubReport Item

This step ties both reports together by using a `SubReport` to display the details and by passing the current **ProductCategoryID** from each record of the master report to the detail.

The detail report uses the parameter to filter the data to products for the specified product category only.

1. Resize the detail section to create some vertical room for a `SubReport` item.
1. Drag a [`SubReport`](slug:telerikreporting/designing-reports/report-structure/subreport) from the Toolbox to the detail section of the report.
1. In the **Properties** window for the `SubReport`, open the [**ReportSource**](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog) dialog, select **Type name** ([`TypeReportSource`](/reporting/api/Telerik.Reporting.TypeReportSource)), and set it to the **DetailReport**. Build the project first if **DetailReport** does not appear in the list.
1. Click the **Edit Parameters** button to display the **Edit Parameters** dialog.
1. Click the **New** button to define a parameter.
1. Set the **Parameter Name** to **ProductCategoryID** and the parameter value to **=Fields.ProductCategoryID**.
1. Click the **OK** button to close the parameters dialog. Click **OK** again to close the **Report Source** dialog.

   ![The Edit Parameters dialog of the Visual Studio Report Designer with the parameter ProductCategoryID set to the corresponding field value](images/MasterDetail0014.png)

Click the **Preview** button to preview the MasterReport. The product numbers and names from the detail report appear under each product category from the master report.

![The Preview result in the Visual Studio Report Designer for the category Accessories](images/MasterDetail0016.png)

### Creating a Master-Detail Layout with a Table and Nested Row Groups

As an alternative to the `SubReport` approach, you can achieve a master-detail layout in a single Table item that uses nested row groups. This approach requires no separate detail report and no parameter passing between reports.

1. Create a new report and configure its data source with a query that joins the master and detail tables:

   ```sql
   SELECT
       PC.Name AS CategoryName,
       PS.Name AS SubcategoryName,
       P.Name AS ProductName,
       P.ProductNumber
   FROM
       Production.ProductCategory PC
       INNER JOIN Production.ProductSubcategory PS
           ON PS.ProductCategoryID = PC.ProductCategoryID
       INNER JOIN Production.Product P
           ON P.ProductSubcategoryID = PS.ProductSubcategoryID
   ```

1. Drag a **Table** item from the Toolbox onto the detail section of the report.
1. In the **Table Wizard**, bind the data source and add **ProductName** and **ProductNumber** as columns. Click **Finish**.
1. Open the **Group Explorer** (**View** > **Group Explorer**). Under **Row Groups**, right-click **Detail** and select **Add Group** > **Parent Group**.
1. In the **Table Group** dialog, set **Group By** to `=Fields.CategoryName`. Select **Add group header** and click **OK**.
1. In the group header row, bind a text box to `=Fields.CategoryName` to label each category.

The Table renders one group header row per unique `CategoryName` value, with the corresponding product rows nested beneath it. The group is dynamic because it generates one row per unique field value at run time.

>tip To add a subcategory level between the category and the product rows, add a second nested row group under the category group in the **Group Explorer** and bind its header row to `=Fields.SubcategoryName`.

>tip You can create the SubReport-based layout with the Standalone Report Designer. Specify subreports by a path to a TRDX file or by placing the sub-report XML directly in the `SubReport.ReportSource` editor.

## See Also

- [SubReport Item](slug:telerikreporting/designing-reports/report-structure/subreport)
- [Report Parameters](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview)
- [Creating Master-Detail Reports with SubReports in Web report designer](slug:web-report-designer-user-guide-creating-master-detail-report)
