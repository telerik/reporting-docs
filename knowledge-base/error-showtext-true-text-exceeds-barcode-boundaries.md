---
title: An Error Is Thrown When Barcode ShowText Is true
page_title: An Error Is Thrown When Barcode ShowText Is true
description: "Learn how to fix the issue when an error is thrown when ShowText is set to true and the size of the text exceeds the bounds of the Barcode item when working with Telerik Reporting."
type: troubleshooting
slug: error_showtext_true
tags: telerik, reporting, barcode, report, item, error, when, showtext, true, text, exceeds, boundaries
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

When `ShowText` is set to `true` and the size of the text exceeds the bounds of the Barcode item, an error message is rendered to indicate the problem.

## Solution 

To handle the issue, change the font size, pick another font or increase the size of the item. 

![barcode-errors-large-text](images/Barcodes/barcode-errors-large-text.png)

