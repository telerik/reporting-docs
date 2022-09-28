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

This guide shows how to add the Telerik Reporting Graph report item to reports and use it to create a Stacked Area Chart. 

After the completion of this guide, you will be able to render a Stacked Area Chart within a Graph report item and achieve the following result. 

// add an example 

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

The Visual Studio Report Designer tool also provides an option for directly inserting the Graph in you report: 

1. Open the Visual Studio toolbox. From the **Telerik Reporting** tab, select **Graph Wizard**.
1. Click the design surface where you want to position the upper-left corner of the Graph. As a result, the Graph Wizard will open. 
1. Open the **Property** grid.
1. Set the **DataSource** property to one of the available [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).
1. Set up a **Coordinate System** with its X-axis and Y-axis.

## Creating the Stacked Area Chart 

After you have added the Graph report item to you report, you can [create a Stacked Area Chart by following the steps in this guide]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview%}#creating-area-charts). 

## Next Steps

* [Graph Structure and Elements]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})
* [Supported Chart Types]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/overview%})
* [Graph Class API Reference](/api/telerik.reporting.graph)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
* [Knowledge Base Section](/knowledge-base)

## See Also

* [Creating Bar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%}#creating-bar-charts)
* [Creating Column Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%}#creating-column-charts)
* [Creating Line Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview%}#creating-line-charts)
* [Creating OHLC Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview%}#creating-ohlc-charts)
* [Creating Pie Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}#creating-pie-charts)
* [Creating Polar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview%}#creating-polar-charts)
* [Creating Range Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview%}#creating-range-charts)
* [Creating Scatter Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%}#creating-scatter-charts)


