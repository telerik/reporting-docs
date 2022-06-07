---
title: Getting Started
page_title: Getting Started
description: "Get up and running with Telerik Reporting, and learn how to create and use the Barcode report item in reports."
slug: barcode_item_get_started
tags: telerik, reporting, report, items, barcode, getting, started
published: True
position: 1
---

# Getting Started with the Barcode Report Item

This guide shows how to create and use the Telerik Reporting Barcode report item in reports. 

* First, you will specify the type of the Barcode report item, configure its settings, and encode its value. 
* Then, you will set the width of the Barcode elements and elaborate on the appearance of the report item.   

At the end, you will be able to achieve the following result. 

{{source=CodeSnippets\CS\API\Telerik\Reporting\BarcodeSnippets.cs region=Barcode_Common_Settings}}
````cs
var encoder = new Telerik.Reporting.Barcodes.Code128AEncoder();

// Set any specific encoder settings...
encoder.ShowText = false; // The default value is true.

this.barcode1.Encoder = encoder;
this.barcode1.Angle = 90;
this.barcode1.BarAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left;
this.barcode1.Checksum = true;
this.barcode1.Module = Telerik.Reporting.Drawing.Unit.Point(3);
this.barcode1.Stretch = false;
this.barcode1.Value = "1234567890";
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\BarcodeSnippets.vb region=Barcode_Common_Settings}}
````vbnet
Dim encoder = New Telerik.Reporting.Barcodes.Code128AEncoder()

' Set any specific encoder settings...
encoder.ShowText = False 'The default value is True

Me.barcode1.Encoder = encoder
Me.barcode1.Angle = 90
Me.barcode1.BarAlign = Telerik.Reporting.Drawing.HorizontalAlign.Left
Me.barcode1.Checksum = True
Me.barcode1.Module = Telerik.Reporting.Drawing.Unit.Point(3)
Me.barcode1.Stretch = False
Me.barcode1.Value = "1234567890"
````

## Specifying the Barcode 

1. To specify the type of the Barcode, use the [`Encoder`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Encoder) property. After setting the desired encoder, you can further adjust the specific settings you require. 

  ![barcode-encoder-property](images/Barcodes/barcode-encoder-property.png)

1. Now, you need to encode the Barcode value through the [`Value`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Value) property. `Value` can be a static string or an expression which is evaluated at runtime.

  ![barcode-value-property](images/Barcodes/barcode-value-property.png)

## Setting the Size and Appearance 

1. You can now specify the width (size) of the Barcode elements. To set the Barcode size, use either of the following approaches: 

  + Use the [`Module`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Module) property. 

  + Automatically calculate the width from the size of the item when the [`Stretch`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property is set to `true`. 

  ![barcode-module-stretch-property](images/Barcodes/barcode-module-stretch-property.png)

1. Align the bars to the edges of the item through the [`BarAlign`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_BarAlign) property. 

  Note that `BarAlign` is not applicable when the [`Stretch`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property is set to `true`. 

  ![barcode-baralign-property](images/Barcodes/barcode-baralign-property.png)
  
1. Rotate the Barcode through the [`Angle`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Angle) property. 

  Note that when the angle is not divisible by 90 degrees and the [`Stretch`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property is `true`, the Barcode will be scaled down so that it fits into the item bounds. 

  ![barcode-angle-property](images/Barcodes/barcode-angle-property.png)
	 
1. Include a checksum in the Barcode by using the [`Checksum`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Checksum) property. 

  Note that some symbologies either do not provide a checksum or the checksum is part of the symbology specification. In these cases, `Checksum` will have no effect. 



## See Also
 
* [`Telerik.Reporting.Barcode`](/reporting/api/Telerik.Reporting.Barcode)  
* [`Encoder`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Encoder)  
* [`Value`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Value)  
* [`Module`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Module)  
* [`Stretch`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch)  
* [`BarAlign`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_BarAlign)  
* [`Angle`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Angle)  
* [`Checksum`](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Checksum)
