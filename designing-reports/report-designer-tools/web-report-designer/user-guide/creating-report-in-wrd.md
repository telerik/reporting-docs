---
title: Creating a Simple Report
page_title: Creating a Simple Report
description: "Learn how to create you first report by using Telerik Web Report Designer: you will add a data source, a company logo, and a custom title, and a graph that will display the report's data."
slug: designing-reports/report-designer-tools/web-report-designer/user-guide/creating-report-in-wrd
tags: tutorial,web,report,designer,tool,design,create
published: True
position: 5
---

# Creating a Simple Report

This tutorial demonstrates the essential steps necessary to create a new report in the Web Report Designer.

You will start from scratch by creating a blank report and styling it by adding a custom header, company logo, and a title. Then, you will connect the report to a data source. Finally, you will add graphs that will visualize the report's data.

To create the report:

1. Go to the Report Designer's main **Menu** and select **New Report**. This opens the **Create a Report** dialog.

1. In the **File Name** field, enter the desired name for the report, for example, `ProductSales`.

1. In the **Save as type** drop-down, select the TRDP report type. TRDP is the recommended report type and stands for Telerik Report Definition Packed.

1. Select the location for the report and click **Save**.

	![The 'Create Report' dialog of the Telerik Web Report Designer](../../../../getting-started/web-designer/images/create-trdp-report-web-designer.png)

## Styling the Report

Newly created reports contain default elements such as headers, footers, and detail sections. When customizing the report, you can change these default elements and add new once, for example, images.

To style the sample report:

1. Delete the default page header (at the top of the page), footer (at the top of the page), and detail section (the main body of the report) by selecting each of them and pressing the `Delete` keyboard key. 

1. Add a new custom report header:

   2.1. Use `Ctrl+F` to focus the search box.

   2.2. Type `Report Header`, and press `Enter`. This will focus the **Page Header** report section in the **Components** menu.

   2.3. Click the **Page Header** item to add this section to the report.

	![Searching for the 'Report Header' and locating it in the web designer's 'Components' menu.](../../../../getting-started/web-designer/images/locate-report-header-component.png)

1. Add a company logo to the report header by using a picture box:

	3.1. Use `Ctrl+F` to focus the search box.

	3.2. Type `PictureBox`, and press `Enter`. This will focus the **PictureBox** report component in the **Components** menu.

    3.3. Click the **PictureBox** item and drag it to the report header. Adjust its size and position as needed.

	3.4. Make sure that the picture box is focused (selected), locate the **DATA** category in the properties area of the Web Report Designer. The properties area is the pane on the right, which contains properties specific to the currently selected report item.

	3.5. Go to **DATA** > **Value** and click the ![The 'Select file...' button in the Telerik Web Report Designer](./images/select-file-button.png) button to open the Assets Manager.
	
	3.6. Select the **Images** folder and then click the **Upload** button to upload an image from your device.
	
	3.7. Select the newly uploaded image and click **Save**.

	![Saving a new image in the Assets Manager of the Telerik Web Report Designer](./images/add-image-to-picture-box.png)

1. Add a title to the report by using a text box:

	4.1. Use `Ctrl+F` to focus the search box.
	
	4.2. Type `TextBox`, and press `Enter`. This will focus the **TextBox** report component in the **Components** menu. 
    
	4.3. Click the **TextBox** item and drag it to the report header. Adjust its size and position as needed.
	
	4.4. Double-click on the text box and type `Sales by Category`.
	
	4.5. To change the text font, go to **APPEARANCE** > **Style** > **Font** in the properties area pane on the right and apply the desired styles, for example, Arial with size 22 pt in bold.

	![The TextBox 'Sales by Category' styled and aligned in the Telerik Web Report Designer.](../../../../getting-started/web-designer/images/style-and-align-textbox-web-designer.png)

## Adding the Report Data

The report in this tutorial will visualize data fetched from a remote source that is accessible through a URL.

To add data to the report:

1. Locate the **DATA SOURCES** category in the **Components** menu of the Web Report Designer.

1. Click the **Web Service Data Source** item to start the data source configuration wizard.
    
1. Click the **TextBox** item and drag it to the report header. Adjust its size and position as needed.

1. In the **Service URL** field, enter `https://demos.telerik.com/reporting/api/data/ProductSales.min`—the URL of the service providing the data for the report.

## Adding a Chart

To visualize the data you will add a Column Chart component:

1. Locate the **CHARTS** category in the **Components** menu of the Web Report Designer.

1. Click the **Column** item and drag it to the detail section of the report. This will load the Column Chart configurator on the right.

1. In the **DATA** > **Data Source** dropdown, select `webServiceDataSource1`—this will populate the **Data Source Fields** in the Column Chart configurator.

	![Configuring the Column Chart in the web report designer.](../../../../getting-started/web-designer/images/configure-column-chart-web-designer.png)

1. Drag the `ProductCategory` field from **DATA** > **Data Source Fields** to **FIELDS ARRANGEMENT** > **Categories** .

1. Drag the `LineTotal` field from **DATA** > **Data Source Fields** to **FIELDS ARRANGEMENT** > **Values** .

1. Click **Create** to add the configured chart to the report.

## Styling the Chart

Optionally, you can adjust the appearance of the Chart:

1. Select the Chart in the report detail section.

1. In the configuration pane on the right, go to **APPEARANCE** > **Style** and clear the **Visible** checkbox. This will remove the legend from the Chart.

1. Go to **PRESENTATION** > **Titles** and select the `graphTitle1` item to open the **Edit Item** dialog.

1. Expand the **Style** category and clear the **Visible** checkbox. This will remove the Chart's title.

	![Styling the Column Chart in the web report designer.](../../../../getting-started/web-designer/images/style-column-chart-web-designer.png)

## Next Steps


## See Also

* [Reference 1]()
* [Reference 2]()
