---
title: Setting up and Creating Report
page_title: Embedding the Web Report Designer in .NET 6 and Creating Your First Report
description: "Learn how to set up the Telerik Web Report Designer in .NET 6 applications via the Visual Studio Item Templates and how to create a report with Logo and Graph in this step by step tutorial."
slug: telerikreporting/getting-started/web-designer/set-up-and-create-basic-report
tags: how,configure,.net,applications,web,designer,report
published: True
position: 1
---

This is a step-by-step tutorial that shows how to integrate the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in `.NET 6` ASP.NET Core application in Visual Studio 2022.

* First, you will create a Web Application and add Telerik Web Report Designer through its Visual Studio Item Template.
* Next, you'll create and style a new report.
* Then, you will add a remote DataSource and connect it to a new Graph in the report.
* At the end you will have a web application with embedded Telerik Web Report Designer with the default `SampleReport.trdp` and the newly created `ProductSales.trdp` reports in its storage that you may preview and edit.

The entire process is described in the YouTube video tutorial [Getting Started with the Web Report Designer: Part 1](https://www.youtube.com/watch?v=L-utkcB8-5c).

# Setting up the Web Report Designer in .NET 6

Lets create an ASP.NET Core application in Visual Studio and embed the Telerik Web Report Designer in it:

1. Open Visual Studio 2022 and create a new project through the project template `ASP.NET Core Web App`. Name the project and select `.NET 6.0` as a Target Framework.
1. Right-click on the project and select `Add New Item`. You may search for "telerik reporting" to list the available Reporting item templates. Add `Telerik Web Report Designer HTML5 Page {{site.suiteversion}}`. The version may vary, depending on the last Reporting version installed. Name the new page `webReportDesigner.html` (this is the default name), and build the project when prompted by Visual Studio.
1. In the popped-up Web Designer Wizard, select `Create new REST service` as we don't have an existing one.
1. On the next step the wizard will ask for the initial report to load. Select the `Sample report definition` option to create a new sample report if you don't have any. When you click `Finish` you should see a status page confirming that everything was set up correctly.
1. (optional) Add to the file `launchSetting.json` in folder `Properties` the property, setting the opening project page:

	`"launchUrl": "webReportDesigner.html"`.

1. Run the project. If everything is fine, you should see the web page with the designer with the Sample Report opened, and the onboarding guide to walk you through the main tools in the designer. We recommend to get familiar with them by clicking on the `Next` button. You may skip the guide at any step through the button `End Tour`. Pay attention to the Search functionality of the designer that lets you locate any report item, section or property easily.

# Creating Your First Report

Our next goal is to create a brand new report with the just configured Web Report Designer:

1. Go the the main toolbar `Menu` and select `New Report`. The `Create Report` dialog opens and lets you enter the `File Name`, and select its `Type` and `Location`. Lets name the report `ProductSales`, leave its `Type` to be `TRDP` standing for _Telerik Report Definition Packed_ and place it in the `Demo` folder. Click Save to apply the settings.
1. The new empty report should open in the designer with its default Page Header, Detail and Page Footer sections. Lets delete the page sections by selecting them and pressing the `Delete` key from the keyboard.
1. Next, we want to add a [Report Header]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%}). Press `Ctrl+F` to focus the Search box, type `Report Header`, and press `Enter` key to focus the report section in the `Components` menu. Click the item to add the section to the report.
1. Lets add the company logo to the report.

	1. We need to add a [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) to the Report Header. You may search for the report item, drag it to the Report Header and adjust it as needed.
	1. To upload the logo, search for the PictureBox Value property, click on the icon beside it. It opens the `Select File` dialog, which represents the Assets Manager. The latter contains all report assets as images, stylesheets, etc.
	1. Select the `Images` folder and click the `Upload` button to upload the image. Click on the `Browse` and find the image on your system and open it. Add the selected image by clicking on the `Upload`. Now the image is in the Assets Manager and you may click `Save`. The value should be populated and the image should be displayed in the PictureBox.

1. Add title to the report. We may use [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}).

	1. Search in the global search box of the designer and drag the item to the Report Header.
	1. You may change the text inline. Lets type `Sales by Category`.
	1. Apply Styles by selecting the TextBox, searching for _Style_ and finding the appropriate _Font_ styles. Lets use default Font with Size 22pt, bolded, centered and aligned to the middle.
	1. Position and realign the TextBox so that the content fits and looks beautiful.

1. Our next step would be to add a DataSource component to the Report. Let it be the [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) fetching data from a remote source.

	1. Search for the component and add it to the report. It opens the _Configure Web Service DataSource_ wizard.
	1. For `ServiceUrl` we will add the known URL to our demo site `https://demos.telerik.com/reporting/api/data/ProductSales.min`. It points to a reliable JSON data file. Leave the other options with their default values.
	1. Skip the next page, where you may add request parameters, as we don't have any.
	1. Skip also the third page that asks whether in design-time you would like to use real or mocked data. We will use real data.
	1. Preview the data on the next page and click `Finish`.
	1. The wizard closes and in the designer's `Explorer` tab you should see the new WebServiceDataSource component with its data fields listed.

1. Next, lets add the [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) that is going to show the sales data.

	1. Search for `Column` and drag the Column chart from the `Explorer` ment to the report Detail section. This will open a chart configurator to the right pane.
	1. Select the WebServiceDataSource from the dropdown of the DataSource property. The fields will be listed.
	1. Drag the `ProductCategory` field to the `Categories`.
	1. For the `Values` property use the `LineTotal` field. Click on `Create` to render the chart with real data and show it in the report.
	1. Finally, style the column graph:

		* Find and remove the `Legend` by unchecking its `Style` > `Visible` checkbox.
		* Enter the `Titles` section, select the graph title and uncheck the `Visible` checkbox in the `Style` section from the opened `Edit item` dialog.

1. Preview the pixel-perfect report document by clicking on the designers `Preview` button at the top right corner.

## See Also

* [Web Report Designer](%{slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Setting up the Web Report Designer in .NET and .NET Core 3.1 applications]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Telerik Reporting Homepage](https://www.telerik.com/products/reporting)
* [Reporting Forums](https://www.telerik.com/forums/reporting)
* [Reporting Blog](https://www.telerik.com/blogs/tag/reporting)
* [Reporting Videos](https://www.telerik.com/videos/reporting)
* [Reporting Roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap)
* [Reporting Pricing](https://www.telerik.com/purchase/individual/reporting)
* [Reporting Training](https://learn.telerik.com/learn/course/external/view/elearning/19/reporting-report-server-training)
