---
title: Create Custom-Shaped Marker for Graph's Legend Items
description: Use custom-shaped marker for Graph's legend items.
type: how-to
page_title: Implement custom-shaped marker for Graph's legend items
slug: create-custom-shaped-marker-for-graph-s-legend-items
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
			<td>Graph</td>
		</tr>
	</tbody>
</table>
  
## Description  

The Graph uses the same markers for its series and their respective legend items. Occasionally, it makes sense to substitute the legend markers with custom ones for a better presentation effect. 
  
## Solution  

This can be achieved using a background image that supports transparency (i.e. PNG) and set it as [LegendItem](/api/telerik.reporting.legenditem).[MarkStyle](/api/telerik.reporting.legenditem#collapsible-Telerik_Reporting_LegendItem_MarkStyle).[BackgroundImage](/api/telerik.reporting.drawing.style#collapsible-Telerik_Reporting_Drawing_Style_BackgroundImage). 

The transparent area on the image will allow the default series color to be displayed on the legend marker.

Using this approach, the pie chart legend can be presented using circular marks, as shown below:  

![Preview](resources/reporting-graph-custom-legend-markers.png)

## Notes

The default series marker is created using drawing path primitives, therefore it is scalable without quality loss. Using a background image, however, might lead to distorted images on higher zoom levels, because of the resized raster images.  
  
