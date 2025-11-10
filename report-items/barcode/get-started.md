---
title: Getting Started
page_title: Barcode Report Item Getting Started Guide
description: "Get up and running with Telerik Reporting, and learn how to add and configure the Barcode report item in reports."
slug: barcode_item_get_started
tags: telerik, reporting, report, items, barcode, getting, started
published: True
position: 1
reportingArea: General
---

# Getting Started with the Barcode Report Item

This guide shows how to create and use the Telerik Reporting Barcode report item in reports.

* First, you will specify the type of the Barcode report item, configure its settings, and encode its value.
* Then, you will set the width of the Barcode elements and elaborate on the appearance of the report item.

After the completion of this guide, you will also be able to configure the Barcode with code and achieve the following result.

{{source=CodeSnippets\CS\API\Telerik\Reporting\BarcodeSnippets.cs region=Barcode_Common_Settings}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\BarcodeSnippets.vb region=Barcode_Common_Settings}}


## Specifying the Barcode

1. To specify the type of the Barcode, use the [`Encoder`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Encoder) property. After setting the desired encoder, you can further adjust the specific settings you require.

	![Configure the Encoder Property of a QR Barcode in the Report Designer](images/Barcodes/barcode-encoder-property.png)

1. Now, you need to encode the Barcode value through the [`Value`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Value) property. `Value` can be a static string or an expression which is evaluated at runtime.

	![Configure the Value Property of a QR Barcode in the Report Designer](images/Barcodes/barcode-value-property.png)

## Setting the Size and Appearance

1. You can now specify the width (size) of the Barcode elements. For the purposes of this guide, you will automatically calculate the width from the size of the item when the [`Stretch`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property is set to `true`.

	![The Effects of the Module Property of the Barcode Item set to 1pt and 1px and of the Stretch Property set to True](images/Barcodes/barcode-module-stretch-property.png)

1. Align the bars to the edges of the item through the [`BarAlign`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_BarAlign) property.

	Note that `BarAlign` is not applicable when the [`Stretch`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property is set to `true`.

	![The Effect of the BarAlign Property of the Barcode Item set to Left, Center and Right](images/Barcodes/barcode-baralign-property.png)

1. Rotate the Barcode through the [`Angle`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Angle) property.

	Note that when the angle is not divisible by 90 degrees and the [`Stretch`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property is `true`, the Barcode will be scaled down so that it fits into the item bounds.

	![The Effect of the Angle Property of the Barcode Item set to 90, 180 and 270](images/Barcodes/barcode-angle-property.png)

1. Include a checksum in the Barcode by using the [`Checksum`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Checksum) property.

	> Some symbologies either do not provide a checksum or the checksum is part of the symbology specification. In these cases, `Checksum` will have no effect.

## Next Steps 

* [(Demo) Barcodes Report](https://demos.telerik.com/reporting/barcodes-report)
* [(Demo) Swiss QR Bill Report](https://demos.telerik.com/reporting/swiss-qr-bill-report)

## See Also

* [(API) Telerik.Reporting.Barcode](/api/Telerik.Reporting.Barcode)
* [(API) Encoder](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Encoder)
* [(API) Value](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Value)
* [(API) Module](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Module)
* [(API) Stretch](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch)
* [(API) BarAlign](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_BarAlign)
* [(API) Angle](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Angle)
* [(API) Checksum](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Checksum)
