---
title: Getting Started
page_title: Getting Started
description: "Get up and running with Telerik Reporting, and learn how to create and use the Report item in reports."
slug: report_item_get_started
tags: telerik, reporting, report, items, item, getting, started
published: True
position: 1
---

# Getting Started with the Report Item

This guide shows how to create and use the Telerik Reporting Report item in reports. 

* First, you will specify the Report item and ... 
* Then, you will ...   
* Next, ...

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

## Specifying the Report Item 


## Adding Paging 


## Setting the Appearance  



## See Also
 
