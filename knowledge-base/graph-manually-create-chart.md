---
title: Manually Create a Chart in the Graph
page_title: Manually Create a Chart in the Graph Report Item
description: "Learn how to manually create a Chart in the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-step-by-step
previous_url: /report-items/graph/how-to/how-to-create-chart-step-by-step, /graphhowtocreatechart
tags: telerik, reporting, graph, report, item, create, chart, manually
type: how-to
res_type: kb
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

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting Graph Report Item</td>
		</tr>
	</tbody>
</table>


## Description

How can I manually create a chart in the Graph?

## Solution 

If you choose not to use the `Graph Wizard` but create your chart manually, first get acquainted with the [Structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%}) of the Graph. 

Then, check out the following table that shows the basic configuration for each chart type: 

| Chart | Series Groups | Categories Groups | Coordinate Systems | Series |
| ------ | ------ | ------ | ------ | ------ |
| [Area]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: AreaSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| [Bar]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: CategoryScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_X_: {expression} |
| [Column]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| [Line]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: LineSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| [Pie]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Polar<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: CategoryScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_X_: {expression} |
| [Polar]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Polar<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression} |
| [Range]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview %}) | _Name_: SG1<br/>_Grouping_: None or {expression} | _Name_: CG1<br/>_Grouping_: Empty or {expression} | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: CategoryScale<br/>_Y axis_: NumericalScale | _Type_: AreaSeries/BarSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_Y_: {expression}<br/>_Y0_: {expression} |
| [Scatter]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview %}) | _Name_: SG1<br/>_Grouping_: {expression} | _Name_: CG1<br/>_Grouping_: None | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: NumericalScale | _Type_: LineSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_LineStyle.Visible_: False<br/>_X_: {expression}<br/>_Y_: {expression} |
| [Bubble]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview %}) | _Name_: SG1<br/>_Grouping_: {expression} | _Name_: CG1<br/>_Grouping_: None | _Type_: Cartesian<br/>_Name_: CS1<br/>_X axis_: NumericalScale<br/>_Y axis_: NumericalScale | _Type_: LineSeries<br/>_CoordinateSystem_: CS1<br/>_SeriesGroup_: SG1<br/>_CategoryGroup_: CG1<br/>_LineStyle.Visible_: False<br/>_X_: {expression}<br/>_Y_: {expression}<br/>_Size_: {expression} |
