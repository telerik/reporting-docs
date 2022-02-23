---
title: How to add Graph to Report
page_title: How to add Graph to Report | for Telerik Reporting Documentation
description: How to add Graph to Report
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-graph-to-report
tags: how,to,add,graph,to,report
published: True
position: 0
---

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
