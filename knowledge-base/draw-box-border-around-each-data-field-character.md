---
title: Draw Box Border Around Each Data Field Character
description: How to display each character/digit of a data field in a separate TextBox with borders
type: how-to
page_title: Display each data field character surrounded with borders
slug: draw-box-border-around-each-data-field-character
position: 
tags: 
ticketid: 1567512
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
In some reports, you may need to display each data field character/digit in a separate TextBox surrounded by borders.

## Solution
You may achieve the requirement with a List with a Rotated layout, in which `DataSource` is set to the array of the characters of the corresponding data field. You may use [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) for the `DataSource` of the List with the following [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}):

````
= Fields.Value.ToCharArray()
````

In the code above, `Value` is the name of the main data source field that holds the original string. Note that the above _Expression_ utilizes the system [String.ToCharArray Method](https://docs.microsoft.com/en-us/dotnet/api/system.string.tochararray) that converts the string to an array of characters. This lets us provide the collection of characters as DataSource and thus display each of them in a separate detail section/cell of the List item and format it with borders or in other way.

In order to display the characters horizontally, you may rotate the List layout. You need to right-click over the List cell and select `Rotate Layout` from the context menu.

## See Also

A demo report demonstrating the above approach may be found in our [GitHub Examples](https://github.com/telerik/reporting-samples/blob/master/BoxedCharacters.trdp).
