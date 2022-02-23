---
title: How to Create Chart Step by Step
page_title: How to Create Chart Step by Step | for Telerik Reporting Documentation
description: How to Create Chart Step by Step
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-step-by-step
tags: how,to,create,chart,step,by,step
published: True
position: 8
---
<style>
table th:first-of-type {
    width: 10%;
}
table th:nth-of-type(2) {
    width: 25%;
}
table th:nth-of-type(3) {
    width: 25%;
}
table th:nth-of-type(4) {
    width: 20%;
}
table th:nth-of-type(5) {
    width: 20%;
}
</style>

# How to Create Chart Step by Step

The easiest way to create a Graph is with our [graph wizard]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-graph-to-report%}). We have added multiple options to create a graph with the Graph Wizard toolbox item so we strongly encourage you to give it a try. You can also check the [standalone designer](http://www.telerik.com/products/reporting/report-designer.aspx) that supports even more options and tools for creating graphs than Visual Studio. 

If you choose not to use the graph wizard and you want to create graphs by yourself our recommendation is to review [Structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%}) and [Connecting to Data]({%slug telerikreporting/designing-reports/report-structure/graph/connecting-to-data%}) help articles. Then check out the following table that shows the basic configuration for each chart type: 

| Chart | Series Groups | Categories Groups | Coordinate Systems | Series |
| ------ | ------ | ------ | ------ | ------ |
| __[Area]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/how-to-create-area-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: AreaSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| __[Bar]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/how-to-create-bar-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: CategoryScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_X_: {expression} |
| __[Column]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/how-to-create-column-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| __[Line]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/how-to-create-line-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: LineSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| __[Pie]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/how-to-create-pie-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Polar<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: CategoryScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_X_: {expression} |
| __[Polar]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/how-to-create-polar-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Polar<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| __[Range]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/how-to-create-range-chart%})__ | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: AreaSeries/BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression}<br/>_Y0_: {expression} |
| __[Scatter]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/how-to-create-scatter-chart%})__ | _Name_: SG1<br/>_Grouping_: {expression} | _Name_: CG1<br/>_Grouping_: None | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: NumericalScale | _Type_: LineSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_LineStyle.Visible_: False<br/>_X_: {expression}<br/>_Y_: {expression} |
| __[Bubble]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/how-to-create-bubble-chart%})__ | _Name_: SG1<br/>_Grouping_: {expression} | _Name_: CG1<br/>_Grouping_: None | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: NumericalScale | _Type_: LineSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_LineStyle.Visible_: False<br/>_X_: {expression}<br/>_Y_: {expression}<br/>_Size_: {expression} |
