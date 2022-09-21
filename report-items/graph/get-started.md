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

This guide shows how to add the Telerik Reporting Graph report item in reports. 

The simplest way to add a __Graph__ item to your report is to run the Graph Wizard for [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) or to run a *new Bar*, *Column*, *Area*, *Line*, *Pie*, *Scatter*, or *Others* chart wizard in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}). After you add a Graph item to the design surface of the _Visual Studio Report Designer_, you can click the chart elements to edit the selected element's properties in the *Properties* grid. In the _Standalone Report Designer_ you can use the ribbon tools. 

## Add a Graph item to a Report by using the _Visual Studio report designer Graph Wizard_

1. Open the Visual Studio toolbox and select `Graph Wizard` from the Telerik Reporting tab.

1. Click on the design surface where you want the upper-left corner of the Graph item. The `Graph Wizard` opens. 

1. Follow the steps in the `Graph Wizard`.

1. When you finish the wizard a new Graph report item will be created on the design surface. 

## Add a Graph item to a report by using the _Standalone Report Designer Graph Wizard_

1. Open the *Insert* tab from the ribbon bar and select the desired chart type. The Graph item will be placed in the center of the selected container.

1. Follow the steps in the `Graph Wizard`.

1. When you finish the wizard a new Graph report item from the chosen type will be created on the design surface. 

## Insert a Graph item to a Report

> Graph item for direct insertion is only available in the Visual Studio Report Designer.For the Standalone Report Designer, please use the `Graph Wizard` for the specific chart type.

1. Open the Visual Studio toolbox and select Graph item from the *Telerik Reporting* tab.

1. Click on the design surface where you want the upper-left corner of the Graph item. The Graph item is initialized on the selected design surface.

1. Open the Property grid.

1. Set the `DataSource` property to one of the available [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).

1. Set up a `Coordinate System` with its X-axis and Y-axis.

1. Continue based on the selected chart type as explained in the following KB articles:

	* [Creating Area Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview%}#creating-area-charts)
	* [Creating Bar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%}#creating-bar-charts)
	* [Creating Column Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%}#creating-column-charts)
	* [Creating Line Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview%}#creating-line-charts)
	* [Creating OHLC Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview%}#creating-ohlc-charts)
	* [Creating Pie Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}#creating-pie-charts)
	* [Creating Polar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview%}#creating-polar-charts)
	* [Creating Range Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview%}#creating-range-charts)
	* [Creating Scatter Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%}#creating-scatter-charts)

## See Also 

* [Graph Structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})
* [Supported Chart Types]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/overview%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
