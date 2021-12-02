---
title: How to Swap Graph Axes
page_title: How to Swap Graph Axes | for Telerik Reporting Documentation
description: How to Swap Graph Axes
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-swap-graph-axes
tags: how,to,swap,graph,axes
published: True
position: 10
---

# How to Swap Graph Axes



The graph series can be oriented towards both axes of its corresponding coordinate system.

## 

###To change the orientation of all series inside of a graph:

1. Select the graph in the designer.

1. Right-click and select Swap Axes from the context menu.

>note Performing this action will swap the X / Y values of all series and interchange the axes positions of all coordinate systems.          


###To change the orientation of individual series:

1. Select desired series in the designer.

1. Right-click and select Swap Axes from the context menu.

>note Performing this action will cause the selected series to swap their X / Y values.           Additionally, the coordinate system referred by the series will also have its axes swapped.         If only some of the series sharing a coordinate system are rotated, a new coordinate system will be created and assigned to them.             The new coordinate system will share it's axes with the original but with interchanged places ( XAxis / YAxis, AngleAxis / RadiusAxis).             Upon reversing the operation or changing the orientation of the rest of the series,              sharing the former coordinate system, the two coordinate systems will be merged based on their axes.            


# See Also

