---
title: Symbologies Restrict Characters Which Can Be Used in the Encoded Data
page_title: Symbologies Restrict Characters Which Can Be Used in the Encoded Data
description: "Learn how to fix the issue when the symbologies restrict characters which can be used in the encoded data when working with Telerik Reporting."
type: troubleshooting
slug: telerikreporting/designing-reports/report-structure/barcode/troubleshooting
tags: telerik, reporting, symbologies, restrict, characters, can, be, used, in, encoded, data
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

Some of the barcode types (symbologies) restrict the characters which can be used in the encoded data.

## Cause 

If during the encoding an invalid character for the symbology is encountered, instead of the actual barcode, an error message will be shown. 

## Solution 

Make sure that you provide a value that conforms with the symbology character set. 

![barcode-errors-invalid-value](images/Barcodes/barcode-errors-invalid-value.png)

