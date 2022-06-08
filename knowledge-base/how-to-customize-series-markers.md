---
title: How to customize series markers.
description: How to apply custom series markers.
type: how-to
page_title: How to edit the series markers.
slug: how-to-customize-series-markers
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Report Items</td>
		<td>Graph</td>
	</tr>
</table>
  
## Description

By default, the Graph's series markers can be set to one of the shapes available in **MarkerType** property of the series. This article demonstrates how to customize series markers and use a different shape.  
  
## Solution  
  
You can display a custom image as a marker. For that, set this image in Graph's **Series.DataPointStyle.BackgroundImage** property. Depending on the shape and the size of the custom marker, adjust **MarkerType** and **MarkerSize** properties of the series.  
  
Custom markers can also be displayed based on a certain condition. For that, set the required condition and the image in **Series.DataPointConditionalFormatting** property.  

> Only the marker types that form a closed contour support **BackgroundImage**. The markers that consist only of lines (i.e. X, Plus, Minus) will not render a background image if set.  
    
## Additional resources
[Download the sample report](resources/graphcustommarkers.zip).

## See Also 

[Conditional Formatting]({% slug telerikreporting/designing-reports/styling-reports/conditional-formatting %}) 

[Formatting a Graph]({% slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/overview %})  
  
