---
title: Improving Basic Report
page_title: Improving Your First Report
description: "Learn how to edit reports in the Telerik Web Report Designer, add SharedDataSources and Actions, copy content between reports, and more in this step-by-step tutorial."
slug: telerikreporting/getting-started/web-designer/improving-basic-report
tags: how,web,designer,report,navigate,action,shareddatasource
published: True
position: 2
---

# Implement a Common Master-Detail Report Scenario

In this step-by-step tutorial, we will improve the basic report created in the previous tutorial [Embedding the Web Report Designer in .NET 8 and Creating Your First Report]({%slug telerikreporting/getting-started/web-designer/set-up-and-create-basic-report%}) by adding a common business requirement to click a data series to show more details in a child report.

* First, we will create a second report to display the details data.
* Then, we will learn how to add a [SharedDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%}) to share data source between reports.
* Next, we will add and configure a [PieChart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}) to the detailed report.
* Finally, we will learn how to add a [Drillthrough/Navigate To Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}) to the master report Column Chart.
* At the end, we will have a master report able to navigate to a child report with detailed data for the selected **Product Category**.

## Creating a Child Report

Our first goal is to create a new report within the Web Report Designer. It will serve as a child report for displaying the detailed data for the selected category from the main report we created previously:

1. Go to the main toolbar `Menu` and select `New Report`. The `Create Report` dialog opens:

	1. Let's name the report `SalesBySubcategory`.
	1. Let it be a `TRDP` report as the main one.
	1. Enter the same `Location` that is the _Demo_ subfolder.
	1. Click `Save` to apply the settings.

1. We'll remove the Page Header and Footer sections again.
1. We can add the same [Report Header]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%}) as in the main report. We will copy it from the latter:

	1. Search for the `report header` in the Search box and add it to the child report.
	1. If necessary, increase its Height.
	1. Go to the main report and select `PictureBox` and `TextBox` from its Report Header.
	1. Open the `Context menu` by clicking on the ellipses (...) beside the selected items in the `Explorer` tab of the Menu. Select `Copy` to copy the items.

		![Choosing 'Copy' command from the context menu of the selected items in the main report.](images/copy-report-header-items-from-main-report.png)

	1. Return to the child report, select the Report Header, and invoke its `Context menu` to `Paste` the selected items.

		![Choosing 'Paste' command from the context menu of the Report Header in the child report.](images/paste-copied-items-to-child-report-header.png)

	1. Adjust the pasted items' positions, if necessary.

1. Next, we'll [add a Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%}) that will receive the Category from the parent report.

	We will use the parameter to filter the data from the [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}).

	1. Search for the `report parameter` in the Search box.
	1. Select `+` to open the `Add New Item` dialog that lets you add a new parameter to the collection.
	1. Let's name the parameter `Category` and use the same for the `Text` property. The latter represents the label in the parameter's editor.
	1. We'll add the default `Value` _Bikes_ as we know this category exists.
	1. Mark the parameter as `Visible` in the user interface.
	1. Click `Save` to preserve the new parameter settings.

	![Adding the visible 'Category' parameter with default value 'Bikes' to the child report.](images/add-new-report-parameter-to-child-report.png)

1. Let's update the report title to display the selected category available in the new Report Parameter:

	1. Select the TextBox in the Report Header.
	1. Click on the ellipses (...) beside its `Value` property in the Property editor. This opens the `Edit Value` dialog.
	1. Select the `Report Parameters` from the list on the left.
	1. Double-click on the `Category Value` from the middle list.
	1. Update the Expression by concatenating a string at the end to become `= Parameters.Category.Value + "Sales by Subcategory"`.

		![Updating the TextBox value in the child report through the Edit Value dialog.](images/update-textbox-value-in-child-report.png)

	1. `Save` and `Preview` the child report. The report should display the default category in the Report Header.

		![Preview of the child report with title corresponding to the specified default category 'Bikes'.](images/intermediate-preview-child-report.png)

1. Configure the child report to reuse the DataSource from the main report:

	1. Convert the `WebServiceDataSource` from the main report to a [SharedDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%}):

		1. Navigate to the main report.
		1. Select its WebServiceDataSource from the `Explorer` tab of the Menu.
		1. Invoke the `Context menu` by clicking on the ellipses (...) and selecting `Save As Shared Data Source`.

			![Saving the existing web service data source in the main report as shared data source.](images/save-as-shared-data-source.png)

		1. In the opened `Create Shared Data Source` dialog, name the component `productSalesData` and check the `Replace data source in report` to let both reports use the SharedDataSource that is stored in the Assets manager.
		1. Click `Save` and ensure the `webServiceDataSource1` has been moved from `Inline Data Sources` to `Shared Data Sources`.

		![Configuring the created shared data source in the main report.](images/create-shared-data-source.png)

	1. Navigate back to the child report.

		1. Open the context menu of the `Shared Data Sources` and select `Add Existing Shared Data Source`.

			![Adding an existing shared data source to the child report from the Assets manager.](images/add-existing-shared-data-source.png)

		1. In the popped-up `Browse For Folder` dialog select `Shared Data Sources` on the left and choose the `productSalesData.sdsx` file, which is our shared data source that we just saved from the main report.

			![Selecting an existing shared data source SDSX file from the 'Browse For Folder' dialog in the child report.](images/select-existing-shared-data-source.png)

		1. Click `Save` and ensure the `productSalesData1` component appears under the `Shared Data Sources` of the child report.

1. Let's use the SharedDataSource to create our Pie Chart:

	1. Search for `pie` to bring up the `Configure Pie Chart` pane on the right side of the web report designer.
	1. Select the `Data Source`.
	1. Drag the `ProductSubcategory` field to the `Series` box. This way, we will create the Pie Chart slices from the Product SubCategories.

		![The almost configured properties of the Pie Chart in the child report.](images/configure-pie-chart-in-child-report.png)


	1. Drag the `LineTotal` into the `Values` box. The aggregate function `Sum` is automatically applied to the field, so the Values of each Pie slice will be the sum of `LineTotal`.
	1. Click `Create` and you should see a Pie Chart that contains all the data from the DataSource.

		![Pie Chart shown in design time with all the data in the child report.](images/pie-chart-with-all-data.png)

	1. Since we want to see only the data for a specific category, we need to add a rule to filter the data based on the value of our report parameter.

		1. Search for `filters` and add a new filter to the Graph.
		1. Add as an Expression `=Fields.ProductCategory`.
		1. Select `Equal` as Operator.
		1. For `Value`, enter the value of the report parameter `= Parameters.Category.Value`.

			![Adding the filtering rule in the child report's pie chart.](images/configuring-filter-in-pie-chart.png)

		1. You should see an immediate update for the `Bikes` category since this is the parameter's default value.

	1. Format the Pie Chart:

		1. Hide the `Title`.
		1. Update the series by adding `DataPointLabelConnectors`:

			* Check the `DataPointLabelConnectorStyle` > `Visible` property.
			* Set `DataPointLabelOffset` to `5mm`.
			* For `DataPointLabelAlignment` use `OutsideColumn` from the dropdown.
			* Click `Save`.

		![Styling the pie chart series' data point labels in the child report.](images/pie-chart-series-datapointlabelalignment.png)

	1. The live preview should display the updated Pie Chart in the `Design` view of the Web Report Designer.

	![The final pie chart in design time view of the child report.](images/design-view-child-report.png)

1. Connect the main and the child report with the [Drillthrough Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}):

	1. Navigate to the main report.
	1. Search for `category group` in the Search box and select the `productCategoryGroup1`.
	1. In the `Edit Item` dialog go to `Action` and select `Navigate to report` from the dropdown.
	1. Set the _Report source_ `Type` to __UriReportSource__.
	1. Open the Assets manager from the icon next to `Uri` and select the `SalesBySubcategory.trdp` report from the `Demo` folder.
	1. Add a new Parameter to the `Parameters` collection of the _Report source_ with `Name` corresponding to the child report's parameter, i.e. `Category`, and `Value` being the value of the current product category field, i.e. `=Fields.ProductCategory`.
	1. Click `Save` to preserve the configuration.

	![The column chart in the main report with configured Navigate to Report action.](images/navigate-to-report-action-in-main-report-chart.png)

1. Test how the reports interact:

	1. Navigate from the main report to the child report by clicking on a particular **Product Category** column in the Column Chart.
	1. Navigate back to the main report from the child report through the [Viewer's Toolbar]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}#toolbar) button __Navigate back in history__.

	![The child report in the web designer preview opened by clicking on the 'Accessories' category of the column chart in the main report.](images/child-report-opened-by-clicking-on-accessories-category-in-main-report.png)

>note The entire process is demonstrated in the YouTube video tutorial [Getting Started with the Web Report Designer: Part 2](https://www.youtube.com/watch?v=DXKlgq-MYIU).

## See Also

* [Video tutorial 'Getting Started with the Web Report Designer: Part 2'](https://www.youtube.com/watch?v=DXKlgq-MYIU)
* [Video tutorial 'Getting Started with the Web Report Designer: Part 1'](https://www.youtube.com/watch?v=L-utkcB8-5c)
* [Embedding the Web Report Designer in .NET 8 and Creating Your First Report]({%slug telerikreporting/getting-started/web-designer/set-up-and-create-basic-report%})
* [Web Report Designer](%{slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Telerik Reporting Homepage](https://www.telerik.com/products/reporting)
* [Reporting Forums](https://www.telerik.com/forums/reporting)
* [Reporting Blog](https://www.telerik.com/blogs/tag/reporting)
* [Reporting Videos](https://www.telerik.com/videos/reporting)
* [Reporting Roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap)
* [Reporting Pricing](https://www.telerik.com/purchase/individual/reporting)
* [Reporting Training](https://learn.telerik.com/learn/course/external/view/elearning/19/reporting-report-server-training)
