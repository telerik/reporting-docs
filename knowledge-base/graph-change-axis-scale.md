---
title: Change the Axis Scale in the Graph
page_title: Change the Axis Scale in the Graph Report Item
description: "Learn how to change the axis scale of the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-change-the-axis-scale
previous_url: /report-items/graph/how-to/how-to-change-the-axis-scale, /graphhowtochangeaxisscale
tags: telerik, reporting, graph, report, item, change, the, axis, scale
type: how-to
res_type: kb
---

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

How can I customize the axis scale of the Graph?

## Solution 

When the values that are plotted in the chart cover a very large range, you can change the axis scale to a Logarithmic scale. In other cases, you may need a DateTime scale. 

Note that when you use the Report Designer to change the Graph or a specific Series Chart Type, the **Scale** settings are reset to __Category Scale__. 

### Changing to Logarithmic

To achieve the desired scenario:

1. On the design surface, click the axis. The selected axis properties are listed in the **Property Browser**. 

1. In the __Misc__ section, select the __Logarithmic Scale__ option for __Scale__. 

1. Set the __Groupings__ and __Series.X/X0/Y/Y0__ expressions to a __numeric__ field. 

### Changing to Numerical

To achieve the desired scenario:

1. On the design surface, click the axis. The selected axis properties are listed in the **Property Browser**. 

1. In the __Misc__ section, select the __Numerical Scale__ option for __Scale__. 

1. Set the __Groupings__ and __Series.X/X0/Y/Y0__ expressions to a __numeric__ field. 

### Changing to DateTime

To achieve the desired scenario:

1. On the design surface, click on the axis. The selected axis properties are listed in the Property Browser. 

1. In the __Misc__ section for __Scale__ select the __DateTime Scale__ option. 

1. Set the __Groupings__ and __Series.X/X0/Y/Y0__ expressions to a __DateTime__ field. 

### Changing to Category

To achieve the desired scenario:

1. On the design surface, click the axis. The selected axis properties are listed in the Property Browser. 

1. In the __Misc__ section, select the __Category Scale__ option for __Scale__. 

1. Remove the corresponding field from the series definition. 

  * If you have selected the X axis, remove the __Series.X/X0__ expression. 
  * If you have selected the Y axis, remove the __Series.Y/Y0__ expression. 
  
  The labels and tick marks for the category axis entries are determined by the fields used in the `CategoryGroups.Groupings` expression. 



