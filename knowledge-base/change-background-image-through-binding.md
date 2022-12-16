---
title: How to Change a Report's Background Image through Binding
description: Set the BackgroundImage property through Binding
type: how-to
page_title: Change the Background Image of a Report through Binding
slug: change-background-image-through-binding
position: 
tags: 
ticketid: 1479467
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.1.20.618</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
How can I change a report's background image based on a specific value? Can I bind the image to a property?

## Solution
To set the background image through a [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}), use the `Style.BackgroundImage.ImageData` property path. 
The following steps describe the recommended approach:

1. Reset the `BackgroundImage` property and remove any configured images.

1. Select __Bindings__ in the __Properties__ menu of the report.

1. Create a new binding with the following parameters:

   * Property path: `Style.BackgroundImage.ImageData`
   
   * Expression: `=IIf(Condition, imageWhenConditionIsTrue, imageWhenConditionIsFalse)`
