---
title: Creating Band Report with the Report Wizard
page_title: Using the Report Wizard to Create Band Reports Step-by-step
description: "Learn how to use the Report Wizard to create a Band Report in Telerik Reporting in this step-by-step tutorial."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/how-to-use-the-report-wizard-to-create-a-band-report
tags: how,to,use,the,report,wizard,to,create,a,band,report
published: True
position: 1
previous_url: /quick-start-create-simple-report
reportingArea: General
---

# Using the Report Wizard to Create a Band Report

In this article we will discuss how to create a band layout report with the [Band Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}).

To create a new report with this wizard:

- Standalone Report Designer:

  - Select **File | New |** from the Telerik Report Designer File menu; **Click** on the Band Report Wizard template. Create file dialog opens; Choose a file name and directory. Click **Save** and the Band Report Wizard opens.

- Visual Studio:

  - Create a new class library or use an existing one. Verify that the targeted.NET framework version is.NET4(+), Full profile as Client profile is not supported.
  - **Right-click** the project context menu and select **Add | New Item | Telerik Report**. Enter a name for the report class and click the **Add** button to close the dialog. Select report wizard form opens.
  - Select the **Band Report Wizard** option from the list and click **OK**.

- On the **Choose Data Source page** of the Report Wizard, select **Add New Data Source.**
- The [DataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}) is started. Select the **[SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})** icon and click the OK button.
- On the **Choose Your Data Connection** page select a connection for the AdventureWorks database from the drop down list. If there is no existing connection, choose a data provider and click **Browse** to create a new connection. When done click the **Next** button.
- **The Save the Connection String** step appears, where you can save the connection string in the application configuration file if you want with the name you want. Click **Next**.
- The **Configure Data Source Command** step will display next.

  - Click the **Query Builder** button.

    > The Query Builder is part of Visual Studio and is available only in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). As of Telerik Reporting Q3 2014 SQL queries can be built in the Standalone Designer with the [Query Designer in the Standalone Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/query-designer-in-the-standalone-designer%}). If you are using the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) use the following select query and click Next:

    ```SQL
    SELECT Production.Product.Name, Production.Product.ProductNumber, Production.Product.ReorderPoint,
    	Production.ProductPhoto.ThumbNailPhoto, Production.ProductInventory.Quantity
    	FROM Production.Product
    	INNER JOIN Production.ProductInventory ON Production.Product.ProductID = Production.ProductInventory.ProductID
    	INNER JOIN Production.ProductProductPhoto ON Production.Product.ProductID = Production.ProductProductPhoto.ProductID
    	INNER JOIN Production.ProductPhoto ON Production.ProductProductPhoto.ProductPhotoID = Production.ProductPhoto.ProductPhotoID
    ```

  - In the **Add Table** dialog select "Product", "ProductInventory", "ProductPhoto" and "ProductProductPhoto" from the list of tables. Note: You can hold down the control key and click each of the tables to select them all at one time.
  - Click the **Add** button to close the dialog.
  - On the **Query Builder** select the fields shown in the figure below. In the Product table select "Name", "ProductNumber" and "ReorderPoint". In ProductPhoto select the "ThumbNailPhoto" column. In the ProductInventory table select the "Quantity" column.
  - Click the **OK** button to close the dialog.
  - The **Configure Data Source Command** step would show the generated statement. Clicking the **Next** button would lead you to the **Preview Data Source Results** step, where you can preview the data. Click finish to return to the **Choose Data Source** page of the Report Wizard. On the next page choose **Standard Report Type** and click the **Next** button.

  > The [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}) article provides additional steps how to use parameterized SQL query.

- The **Design Data Layout** page of the Report Wizard allows you to assign database fields to sections of the report. The Report Wizard automatically places and formats the database fields in the appropriate report sections.

  - Select from the **Available Fields** list on the left side of the page.
  - Select "Name", "ProductNumber", "ReorderPoint" and "Quantity".
  - After selecting each field, click the **Detail** button to add those columns to the detail listing of the report.
  - Click the **Next** button.

- On the **Choose Report Layout** page of the Report Wizard unselect the **Adjust report items to fit available space** checkbox. Click the **Next** button.
- On the **Choose Report Style** page of the Report Wizard select "Civic" from the **Style Sheets** list on the left side of the page. Notice the style changes in the Preview portion on the right side of the page. The initial report layout appears in the design view.

  > Notice that the wizard has automatically provided:
  >
  > - Data bound fields in the detail section of the report.
  >
  > - Styled page and column titles.
  >
  > - A page footer with standard date and page number output.

- Click the Preview of the designer to view your report.

From here you can continue with the following quickstart tutorials:

- [How to extend a Band Report]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/how-to-extend-a-band-report%}) - to include [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}), [Shape]({%slug telerikreporting/designing-reports/report-structure/shape%}) and [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) report items. This topic also introduces in-place editing, copying and pasting styles, using the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}) and [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}).
