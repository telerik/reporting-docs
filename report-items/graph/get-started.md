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

To add a Graph item to your report in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), run a **new Bar**, **Column**, **Area**, **Line**, **Pie**, **Scatter**, or **Others** Chart Wizard, or use the ribbon tools: 

1. From the ribbon bar, open the **Insert** tab and select the desired Chart type. As a result, the Graph will be placed in the center of the selected container.
1. Follow the steps indicated by the Graph Wizard.
1. When you finish with the prompts, a new Graph report item of the type you selected will appear on the design surface. 

### Using the Visual Studio Designer

To add a Graph item to your report in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}), run the Graph Wizard: 

1. Open the Visual Studio toolbox. From the **Telerik Reporting** tab, select **Graph Wizard**.
1. Click the design surface where you want to position the upper-left corner of the Graph. As a result, the Graph Wizard will open. 
1. Follow the steps indicated by the Graph Wizard.
1. When you finish with the prompts, a new Graph report item will appear on the design surface.

The Visual Studio Report Designer tool also provides an option for directly inserting the Graph into your report. With this approach, the user is fully responsible for the Graph configuration. The following section explains the required settings.

## Configuring the Graph Manually - Common Steps for the Supoprted Charts

1. Add Graph to the Report
	Let's assume that we have added the Graph item to our Report. We may do this as explained above, either with the Graph Wizard that would preconfigure it, or simply as an item (only in the Visual Studio Report Designer).
	
1. Open the **Property** grid.
	Here you may see the Graph properties. You may (re)configure them manually to customize the displayed Chart.

1. Set the `DataSource` property to one of the available [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).
	The main purpose of the Graph is to display visually meaningful data. That said, it needs a DataSource that would be bound to the proper data.
	Let's use the AdventureWorks sample database. This requires a [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) that would connect to the database and fetch the requested data in run-time through the specified `DataProvider`. The latter will use the `ConnectionString` for connecting, and execute the Query or Stored Procedure assigned to the `SelectCommand` property to get the data.
	
	Let's use the default `SqlClient Data Provider` with the named connection string from our demo reports that should be preset in your designer's configuration file `Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString`.
	
	Here is the Select command we are going to use:
	
	````SQL
// Fields used by all graphs
Name
SubTotal
OrderDate
TotalDue
Category
LineTotal
StoreName
ProductCategory
````

	In the particular Charts we are going to create, we will use only part of the above fields, so you may shorten the above Query based on the Chart type you would like to create. The reason for this is that each Chart type is suitable for displaying different types of data, hence the different database columns that would fit better to different Charts.

1. Follow the instructions for the particular Chart type you would like to create. Here are the required database fields and the links to the tutorials with the steps:

	[Creating Scatter Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%}#creating-scatter-charts)
	Name
	SubTotal
	OrderDate

	[Creating Range Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview%}#creating-range-charts)
	Name
	TotalDue
	OrderDate

	[Creating Polar Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview%}#creating-polar-charts)
	OrderDate
	Category
	LineTotal

	[Creating Pie Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}#creating-pie-charts)
	StoreName
	SubTotal
	LineTotal

	[Creating Line Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview%}#creating-line-charts)
	ProductCategory
	OrderDate
	LineTotal

	[Creating Column Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%}#creating-column-charts)
	OrderDate
	Category
	LineTotal

	[Creating Bar Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%}#creating-bar-charts)
	OrderDate
	Category
	LineTotal

	[Creating Area Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview%}#creating-area-charts)
	OrderDate
	LineTotal

	[Creating OHLC Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview%}#creating-ohlc-charts)
	The Open-High-Low-Close (OHLC) chart is typically used to illustrate movements in the price of a financial instrument over time. In the tutorial, we use a [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}) with suitable data since it better illustrates the concept that the data available in the AdventureWorks sample database. Here is the CSV data:
	
	````
data here
````


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
