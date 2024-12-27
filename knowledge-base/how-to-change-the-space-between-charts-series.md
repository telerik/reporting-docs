---
title: How to change the space between chart's series
description: Editing the space between chart's series. 
type: how-to
page_title: Modifying the space between chart's series
slug: how-to-change-the-space-between-charts-series
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Item</td>
			<td>Graph Item</td>
		</tr>
	</tbody>
</table>

## Description
  
 Using the [Graph item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}), you can set the amount of blank space between two adjacent data slots with [SpacingSlotCount](/api/telerik.reporting.scale#collapsible-Telerik_Reporting_Scale_SpacingSlotCount) property of the [Scale](/api/telerik.reporting.scale) class. However, in some scenarios there is a need to set the space **between** different series in a data slot.  
  
## Solution 1

By default, the Graph item does not have the setting to change the space between different series. The solution can be to include the additional series with empty values into the Graph's data source.  
  
- Modify the data for the Graph item  to include the additional series with zero values:  

```csv
Category,Series,SeriesOrder,Value
A,ser1,0,10
A,emptySer,1,0
A,ser2,2,20
B,ser1,0,15
B,emptySer,1,0
B,ser2,2,25
```
  
- In order the empty series to appear between the visible series, set the Sorting expression in **SeriesGroup** to **"= Fields.SeriesOrder "**.  
  
- To hide the legend item for the empty series, you can use **series.LegendItem.ConditionalFormatting** property.  
  
The attached report demonstrates the described approach.  
  
## Solution 2

The **Series.DataPointStyle.LineWidth** property can also be used to add the space between the series in combination with **series.DataPointStyle.LineColor** property set to *"White"* or *"Transparent"*. The unwanted effect of this approach can be that it will add the space between the series and the Axis as well.  

A step-by-step tutorial is demonstrated in the [Simulating Space Between Bars with LineWidth in the Same Category for Telerik Reporting]({%slug add-space-between-bars-telerik-reporting%}) article.

## Additional resources
[Download the sample report](resources/changespacebetweenseries.zip).

## See Also

* [How to: Change the Gap Between the Bars]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-change-the-gap-between-the-bars%})  
