---
title: Encoder Requires Specific Lengths for Barcode Values Error
page_title: Encoder Requires Specific Lengths for Barcode Values Error
description: "Learn how to fix the issue when an error is thrown that the encoder requires a specific length for the barcode value when working with Telerik Reporting."
type: troubleshooting
slug: encoder_requires_specific_barcode_length
tags: telerik, reporting, barcode, report, item, error, encoder, requires, specific, length
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

A descriptive error message is shown that the encoder requires a specific length for the barcode value. 

## Cause  

Some encoders, such as Intelligent Mail and PLANET, require the barcode values to have specific lengths. For the Intelligent Mail barcode the supported lengths are 20, 25, 29 or 31 characters. For the PLANET barcode the supported lengths are 11 or 13 characters. 

## Solution 

Satisfy the requirements of the encoder. 

![barcode-errors-invalid-content-length](images/Barcodes/barcode-errors-invalid-content-length.png)
