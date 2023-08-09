---
title: Improving Basic Report
page_title: Improving Your First Report
description: "Learn how to edit reports in the Telerik Web Report Designer, add SharedDataSources and Actions, copy content between reports and more in this step by step tutorial."
slug: telerikreporting/getting-started/web-designer/improving-basic-report
tags: how,web,designer,report,navigate,action,shareddatasource
published: True
position: 2
---

# Implement a Common Master-Detail Report Scenario

In this step-by-step tutorial, we will improve the basic report created in the previous tutorial [Embedding the Web Report Designer in .NET 6 and Creating Your First Report]({%slug telerikreporting/getting-started/web-designer/set-up-and-create-basic-report%}) by adding a common business requirement to click a data series to show more details on a child report.

* First, you will create a second report to display the details data.
* Then, you will learn how to add [SharedDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%}) to share data source  between reports.
* Next, you will add and configure [PieChart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}) to the detailed report.
* Finally, you will learn how to add a [Drillthrough/Navigate To Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}) to the master report Column Chart.
* At the end you will have a master report able to navigate to a child report with detailed data for the selected Product Category.

## Creating a Child Report

Our first goal is to create a new report within the Web Report Designer. It will serve as a child report for displaying the detailed data for the selected category from the main report we created previously:

1. Go to the main toolbar `Menu` and select `New Report`. The `Create Report` dialog opens and lets you:

	1. Let's name the report `SalesBySubcategory`.
	1. Let it be a `TRDP` report as the main one.
	1. Enter the same `Location` that is the _Demo_ subfolder.
	1. Click Save to apply the settings.

1. We'll remove the Page Header and Footer sections again.
1. We can add the same [Report Header]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%}) as in the main report:

	1. Search for `report header` in the Search box and add it to the child report.
	1. If necessary, increase its height.
	1. Go to the main report and select the PictureBox and TextBox from its Report Header.
	1. Open the `Context menu` by clicking on the ellipses (...) beside the selecte items in the `Explorer` tab of the Menu. Select `Copy` to copy the items to the clipboard.
	1. Return to the child report, select the Report Header and invoke its `Context menu` to `Paste` the selected items.
	1. Adjust their position, if necessary.

1. Next, we'll [add a Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%}) that will receive the Category from the parent report.

	We will use the parameter to filter the data from the WebServiceDataSource.

	1. Search for `report parameter` in the Search box.
	1. Select `+` to open the `Add New Item` dialog that lets you add a new parameter to the collection.
	1. Let's name the parameter `Category` and use the same for the `Text` property that is used as a label.
	1. We'll add the default `Value` _Bikes_ as we know this category exists.
	1. Mark the paramete as `Visible` in the user interface.
	1. Click `Save` to preserve the new parameter settings.

1. Let's update the report title to display the selected category available in the new Report Parameter:

	1. Select the TextBox in the Report Header.
	1. Click on the ellipses (...) beside its `Value` property in the Property editor. This opens the `Edit Value` dialog.
	1. Select the `Report Parameters` from the list on the left.
	1. Double-click on the `Category Value` from the middle list.
	1. Update the Expression by concatenating a string at the end to become `= Parameters.Category.Value + "Sales by Subcategory"`.
	1. `Save` and `Preview` the child report. The report should display the default category in the Report Header.

1. Configure the child report to reuse the DataSource from the main report:

	1. Convert the WebServiceDataSource from the main report to a [SharedDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%}):

		1. Navigate to the main report.
		1. Select its WebServiceDataSource from the `Explorer` tab of the Menu.
		1. Invoke the `Context menu` by clicking on the ellipses (...) and select `Save As Shared Data Source`.
		1. In the opened `Create Shared Data Source` dialog name the component `productSalesData` and check the `Replace data source in report` to let both reports use the SharedDataSource that is stored in the Assets manager.
		1. Click `Save` and ensure the webServiceDataSource1 hab been moved from `Inline Data Sources` to `Shared Data Sources`.

	1. Navigate back to the child report.

		1. Open the context menu of the `Shared Data Sources` and select `Add Existing Shared Data Source`.
		1. In the popped-up `Browse For Folder` dialog sele `Shared Data Sources` on the left and choose the `productSalesData.sdsx` file, which is our shared data source.
		1. Click `Save` and ensure the `productSalesData1` component appears under the `Shared Data Sources`.

1. Let's use the SharedDataSource to create our PieChart.

The entire process is described in the YouTube video tutorial [Getting Started with the Web Report Designer: Part 2](https://www.youtube.com/watch?v=DXKlgq-MYIU).




## See Also

* [Video tutorial 'Getting Started with the Web Report Designer: Part 2'](https://www.youtube.com/watch?v=DXKlgq-MYIU)
* [Video tutorial 'Getting Started with the Web Report Designer: Part 1'](https://www.youtube.com/watch?v=L-utkcB8-5c)
* [Embedding the Web Report Designer in .NET 6 and Creating Your First Report]({%slug telerikreporting/getting-started/web-designer/set-up-and-create-basic-report%})
* [Web Report Designer](%{slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Telerik Reporting Homepage](https://www.telerik.com/products/reporting)
* [Reporting Forums](https://www.telerik.com/forums/reporting)
* [Reporting Blog](https://www.telerik.com/blogs/tag/reporting)
* [Reporting Videos](https://www.telerik.com/videos/reporting)
* [Reporting Roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap)
* [Reporting Pricing](https://www.telerik.com/purchase/individual/reporting)
* [Reporting Training](https://learn.telerik.com/learn/course/external/view/elearning/19/reporting-report-server-training)
