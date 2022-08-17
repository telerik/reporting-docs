---
title: Initialization
page_title: Initialization Approaches for the Graph Report Item
description: "Learn more about the alternative initialization approaches when working with the Telerik Reporting Graph report item."
slug: graph_item_initialization
tags: telerik, reporting, report, items, graph, initialization, approaches, insert, add
published: True
position: 2
---

# Initialization Approaches 

To start using the Graph in the Standalone or the Visual Studio Report Designer tool, you can either add it to or insert it in a report.  

## Adding the Graph

* (Visual Studio Report Designer) For the specific steps to add the Graph to the report by using the Graph Wizard in the Visual Studio Report Designer, refer to the article on [getting started with the Graph report item]({% slug graph_item_get_started %}). 

* (Standalone Report Designer) To add a Graph to the report by using the Standalone Report Designer: 

  1. Open the Standalone Report Designer. 
  1. Run the required Chart Wizard, for example, **new Bar**, **Column**, **Area**, , or **Others**. 
  1. Add a Graph item to the design surface. 
  1. In the **Properties** grid, click the chart elements to edit the properties of the selected element. An alternative way to achieve the same result is to use the ribbon tools of the Standalone Report Designer. 

## Inserting the Graph

* (Visual Studio Report Designer) The Visual Studio Report Designer allows you to directly insert the Graph without using a Graph Wizard: 

  1. Open the Visual Studio toolbox. From the **Telerik Reporting** tab, select the Graph item.
  1. Click the design surface where you want to place the upper-left corner of the Graph. As a result, the report item will be initialized on the selected design surface.
  1. Open the **Properties** Grid.
  1. Set the **DataSource** property to one of the available [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).
  1. Set up a **Coordinate System** with its X and Y axes.

* (Standalone Report Designer) To insert the Graph with the Standalone Report Designer by using the Graph Wizard:

  1. Open the **Insert** tab from the ribbon bar. Select the desired chart type. As a result, the Graph will be placed in the center of the selected container.
  1. Follow the Graph Wizard prompts.
  1. After you complete the instructions of the Wizard, the new Graph item will be created on the design surface. 


## See Also 

* [Connecting the Graph to Data]({% slug telerikreporting/designing-reports/report-structure/graph/structure %})
* [Supported Chart Types]({% slug telerikreporting/designing-reports/report-structure/graph/chart-types/overview %})