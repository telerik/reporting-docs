---
title: How to Create Chart Step by Step
page_title: How to Create Chart Step by Step | for Telerik Reporting Documentation
description: How to Create Chart Step by Step
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-step-by-step
tags: how,to,create,chart,step,by,step
published: True
position: 8
---

# How to Create Chart Step by Step



The easiest way to create a Graph is with our [graph wizard]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-graph-to-report%}).         We have added multiple options to create a graph with the Graph Wizard toolbox item so we strongly encourage you to         give it a try. You can also check the          [standalone designer](http://www.telerik.com/products/reporting/report-designer.aspx)          that supports even more options and tools for creating graphs than Visual Studio.          

If you choose not to use the graph wizard and you want to create graphs by yourself our         recommendation is to review [Structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})          and [Connecting to Data]({%slug telerikreporting/designing-reports/report-structure/graph/connecting-to-data%}) help articles.         Then check out the following table that shows the basic configuration for each chart type:       

## 


| Chart | Series Groups | Categories Groups | Coordinate Systems | Series |
| ------ | ------ | ------ | ------ | ------ |
| __ [Area]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/how-to-create-area-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Cartesian|
|Name: CS1|
|X axis: CategoryScale|
|Y axis: NumericalScale


||



|Type: AreaSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|Y: {expression}


|   |   |
| ------ | ------ |
|
| __ [Bar]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/how-to-create-bar-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Cartesian|
|Name: CS1|
|X axis: NumericalScale|
|Y axis: CategoryScale


||



|Type: BarSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|X: {expression}


|   |   |
| ------ | ------ |
|
| __ [Column]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/how-to-create-column-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Cartesian|
|Name: CS1|
|X axis: CategoryScale|
|Y axis: NumericalScale


||



|Type: BarSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|Y: {expression}


|   |   |
| ------ | ------ |
|
| __ [Line]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/how-to-create-line-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Cartesian|
|Name: CS1|
|X axis: CategoryScale|
|Y axis: NumericalScale


||



|Type: LineSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|Y: {expression}


|   |   |
| ------ | ------ |
|
| __ [Pie]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/how-to-create-pie-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Polar|
|Name: CS1|
|X axis: NumericalScale|
|Y axis: CategoryScale


||



|Type: BarSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|X: {expression}


|   |   |
| ------ | ------ |
|
| __ [Polar]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/how-to-create-polar-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Polar|
|Name: CS1|
|X axis: CategoryScale|
|Y axis: NumericalScale


||



|Type: BarSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|Y: {expression}


|   |   |
| ------ | ------ |
|
| __ [Range]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/how-to-create-range-chart%})__|



|Name: SG1|
|Grouping: None or {expression}


||



|Name: CG1|
|Grouping: Empty or {expression}


||



|Type: Cartesian|
|Name: CS1|
|X axis: CategoryScale|
|Y axis: NumericalScale


||



|Type: AreaSeries/BarSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|Y: {expression}|
|Y0: {expression}


|   |   |
| ------ | ------ |
|
| __ [Scatter]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/how-to-create-scatter-chart%})__|



|Name: SG1|
|Grouping: {expression}


||



|Name: CG1|
|Grouping: None


||



|Type: Cartesian|
|Name: CS1|
|X axis: NumericalScale|
|Y axis: NumericalScale


||



|Type: LineSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|LineStyle.Visible: False|
|X: {expression}|
|Y: {expression}


|   |   |
| ------ | ------ |
|
| __ [Bubble]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/how-to-create-bubble-chart%})__|



|Name: SG1|
|Grouping: {expression}


||



|Name: CG1|
|Grouping: None


||



|Type: Cartesian|
|Name: CS1|
|X axis: NumericalScale|
|Y axis: NumericalScale


||



|Type: LineSeries|
|CoordinateSystem: CS1|
|SeriesGroup: SG1|
|CategoryGroup: CG1|
|LineStyle.Visible: False|
|X: {expression}|
|Y: {expression}|
|Size: {expression}


||




# See Also

