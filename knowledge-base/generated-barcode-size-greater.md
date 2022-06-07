---
title: The Generated Barcode Size Is Greater Than the Available Item Size
page_title: The Generated Barcode Size Is Greater Than the Available Item Size
description: "Learn how to fix the issue when the generated barcode size is greater that the available size from the item when working with Telerik Reporting."
type: troubleshooting
slug: generated_barcode_size_greater_than_available
tags: telerik, reporting, generated, barcode, size, greater, than, available, item
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
		<td>Barcode</td>
	</tr>
</table>

## Description

The generated barcode size is greater that the available size from the item and instead of the actual barcode, an error message is shown.

## Solution 

To work around this issue, increase the size of the Barcode item by setting the `Barcode.Stretch` property to `true` or by using a smaller value for the `Barcode.Module` property. 

  ![barcode-errors-large-size](images/Barcodes/barcode-errors-large-size.png)
