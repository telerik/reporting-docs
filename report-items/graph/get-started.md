---
title: Getting Started
page_title: Getting Started
description: "Get up and running with Telerik Reporting, and learn how to create and use the Graph report item in reports."
slug: graph_item_get_started
previous_url: /report-items/graph/how-to/how-to-add-graph-to-report
tags: telerik, reporting, report, items, graph, getting, started
published: True
position: 0
previous_url: /AddGraphToReport
---

# Getting Started with the Graph Report Item

This guide shows how to create and use the Telerik Reporting Graph report item in reports. 

* First, you will specify the Graph report item and ... 
* Then, you will ...  

After the completion of this guide, you will also be able to configure the Barcode with code and achieve the following result.

// add demo here 

# How to add Graph to Report

The simplest way to add a __Graph__ item to your report is to run the Graph Wizard for Visual Studio report designer or to run a *new Bar*, *Column*, *Area*, *Line*, *Pie*, *Scatter*, or *Others* chart wizard in the standalone designer. After you add a Graph item to the design surface, you can click the chart elements to edit the selected element's properties in the *Properties* grid or in the standalone Report Designer you can use the ribbon tools. 

## To add a graph to a report by using the Visual Studio report designer Graph Wizard

1. Open the Visual Studio toolbox and select Graph Wizard from the Telerik Reporting tab.

1. Click on the design surface where you want the upper-left corner of the graph item. The Graph Wizard opens. 

1. Follow the steps in the Graph Wizard.

1. When you finish the wizard a new Graph item will be created on the design surface. 

## To add a graph to a report by using the standalone Report Designer Graph Wizard

1. Open the *Insert* tab from the ribbon bar and select the desired chart type. The graph will be placed in the center of the selected container.

1. Follow the steps in the Graph Wizard.

1. When you finish the wizard a new Graph item will be created on the design surface. 

## To insert a graph to a report

> Graph item for direct insertion is only available in the Visual Studio report designer.For the standalone report designer, please use a Graph wizard for the specific chart type.

1. Open the Visual Studio toolbox and select Graph item from the *Telerik Reporting* tab.

1. Click on the design surface where you want the upper-left corner of the graph item. The graph item is initialized on the selected design surface.

1. Open the Property Grid.

1. Set the DataSource property to one of the available [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).

1. Set up a Coordinate System with its x-axis and y-axis.


## See Also 

* [Connecting the Graph to Data]({% slug telerikreporting/designing-reports/report-structure/graph/structure %})
* [Supported Chart Types]({% slug telerikreporting/designing-reports/report-structure/graph/chart-types/overview %})