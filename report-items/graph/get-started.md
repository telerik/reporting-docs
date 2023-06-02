---
title: Getting Started
page_title: Graph Report Item Getting Started Guide
description: "Get up and running with Telerik Reporting, and learn how to create and use the Graph report item in reports."
slug: graph_item_get_started
previous_url: /report-items/graph/how-to/how-to-add-graph-to-report, /AddGraphToReport
tags: telerik, reporting, report, items, graph, getting, started
published: True
position: 1
---

# Getting Started with the Graph Report Item

This guide shows how to add the Telerik Reporting Graph report item to reports and use it to create the major supported Chart types.

After the completion of this guide, you will be able to render different Chart types within a Graph report item.

## Adding the Graph

Depending on the Report Designer tool you are using, the Graph provides the following approaches for including it in your report:

* [Adding the Graph with the Graph Wizard of the Standalone Report Designer](#using-the-standalone-report-designer)
* [Adding or directly inserting the Graph with the Visual Studio Report Designer](#using-the-visual-studio-report-designer)

### Using the Standalone Report Designer

To add a Graph item to your report when working with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), run a new `Bar`, `Column`, `Area`, `Line`, `Pie`, `Scatter`, or `Others` Chart Wizard, or use the ribbon tools:

1. From the ribbon bar, open the **Insert** tab and select the desired Chart type. As a result, the Graph will be placed in the center of the selected container.
1. Follow the steps indicated by the Graph Wizard.
1. When you finish with the prompts, a new Graph report item of the type you selected will appear on the design surface.

### Using the Visual Studio Report Designer

To add a Graph item to your report when working with the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}), run the Graph Wizard:

1. Open the Visual Studio toolbox. From the **Telerik Reporting** tab, select **Graph Wizard**.
1. Click the design surface where you want to position the upper-left corner of the Graph. As a result, the Graph Wizard will open.
1. Follow the steps indicated by the Graph Wizard.
1. When you finish with the prompts, a new Graph report item will appear on the design surface.

The Visual Studio Report Designer tool also provides an option for directly inserting the Graph into your report. With this approach, the user is fully responsible for the Graph configuration. The following section explains the required settings.

>note The Graph is a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and cannot be added to [Page Sections]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%})

## Configuring the Graph Properties

After you have added the Graph report item to your report, you can manually configure its properties by following common steps that are valid for all supported chart types.

1. Open the **Properties** grid which displays all Graph properties. Through the grid, you can manually configure and reconfigure all Graph properties and customize the displayed chart type.

1. Set the **DataSource** property to one of the available [Data Source components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).

	To visualize its data, the Graph requires you to provide a DataSource and bind it to the desired data set. You will use the AdventureWorks sample database which requires an [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) that will connect to the database and fetch the requested data in run-time through the specified `DataProvider`. The data provider will use the `ConnectionString` for connecting, and execute the Query or Stored Procedure assigned to the `SelectCommand` property to get the data.

	Now use the default `SqlClient Data Provider` with the named connection string `Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString` from the demo reports that is preset in the the configuration file of your designer.

1. Create the chart type you require. Depending on the specific charts you will create, you need to use different SQL Queries that are provided in the dedicated articles. The reason for this is that each Chart type is suitable for displaying different types of data, hence the different database columns that will fit better to different Charts.

	For the specific instructions for creating the chart you require, use the following step-by-step guides:

	* [Creating Bar charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%}#creating-bar-charts)
	* [Creating Column charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%}#creating-column-charts)
	* [Creating Line charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview%}#creating-line-charts)
	* [Creating Area charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview%}#creating-area-charts)
	* [Creating Polar charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview%}#creating-polar-charts)
	* [Creating Pie charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}#creating-pie-charts)
	* [Creating Scatter charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%}#creating-scatter-charts)
	* [Creating Range charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview%}#creating-range-charts)
	* [Creating OHLC charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview%}#creating-ohlc-charts)

## Next Steps

* [Graph Structure and Elements]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})
* [Supported Chart Types]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/overview%})
* [Graph Class API Reference](/api/telerik.reporting.graph)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
* [Knowledge Base Section](/knowledge-base)

## See Also

* [Bar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%})
* [Column Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%})
* [Line Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview%})
* [OHLC Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview%})
* [Pie Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%})
* [Polar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview%})
* [Range Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview%})
* [Scatter Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%})
* [Sparklines Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/sparklines%})
