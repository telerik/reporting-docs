---
title: How to add Secondary Axis
page_title: How to add Secondary Axis | for Telerik Reporting Documentation
description: How to add Secondary Axis
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-secondary-axis
tags: how,to,add,secondary,axis
published: True
position: 2
---

# How to add Secondary Axis



When the values in a chart vary widely from series to series, or when you have mixed types of data (for example, price and volume),         you can plot one or more series on a secondary vertical or horizontal axis. The scale of the secondary axis reflects the values for the associated series.       

To help distinguish the data that is plotted along the secondary axis, you can change the chart type for just one of the series.         For example, you could change one series to a line type.       

## 

To complete the following procedures, you must have an existing chart.

1. Select the Graph item and locate the __CoordinateSystems__  property in the property grid. Click on the ellipsis button to                open the __CoordinateSystems__  collection editor.             

1. Click on the __Add__  button arrow and add a second coordinate system.             

1. For the axis you want to reuse - open the drop down list and choose the axis created previously for the primary coordinate system.             

1. For the new __Axis__  choose New and the type of the scale from the drop down list.             

The secondary axis can also appear on the right or top of the graph.            This is controlled by defining where the secondary axis crosses the shared axis.            For the example below assume that X is the shared axis and there are two Y axes.         

1. For the __Scale__  of the shared __X axis__  you have to add two __CrossAxisPositions__ .             

1. The first will be applied to the first Y axis - leave the position to Auto (the default).             

1. For the second one (applied to the second Y axis) - set the position to AtMaximum.                This will force it to cross the X axis at its maximum value which should be on the right end of the axis scale.             

# See Also

