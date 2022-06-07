---
title: Specifications 
page_title: 1D Barcodes Specifications 
description: "Learn about the common setting and the specifics of the Code128 and GS1-128 one-dimensional barcode types when working with the Telerik Reporting Barcode report item."
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/1d-barcodes
previous_url: /report-items/barcode/barcode-types/1d-barcodes
tags: telerik, reporting, report, items, 1d, barcodes, specifications, settings
published: True
position: 1
---

# 1D Barcode Specifications

One-dimensional (1D) barcodes are made up of lines and spaces of various widths that create specific patterns.

The following table describes the specific characteristics of the barcodes per type.

## Common Settings

One-dimensional Barcodes support the `ShowText` common setting. When [`ShowText`](/reporting/api/Telerik.Reporting.Barcodes.Encoder1D#Telerik_Reporting_Barcodes_Encoder1D_ShowText) is set to `true`, the Barcode shows the text together with the bars. 

When the text is displayed, you can also align it horizontally by using the `TextAlign` property of the [`Style`](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_Style) object. 

![barcode-textalign-property](../images/Barcodes/barcode-textalign-property.png) 

You can also use the `VerticalAlign` property of the [`Style`](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_Style) object to align the Barcode vertically. 

![barcode-verticalalign-property](../images/Barcodes/barcode-verticalalign-property.png)

## Code128 Specifics

The one-dimensional Code128 barcode is subject to the following specifics: 

### Subsets 

Code128A, Code128B, and Code128C represent the A, B and C subsets of the Code128 symbology. Code128 uses an intelligent algorithm that picks automatically the appropriate subset according to the input value, and may switch between these subsets in the middle of a barcode to produce a shorter generated sequence. 

For example, if you have the input string `ABCD1234`, the `ABCD` part of the string will be encoded by using the A subset, while the `1234` part will be encoded with the C subset, because Code128C uses a double-density code for numerical values, thus producing a shorter barcode as a result. To disable this behavior, explicitly specify a subset (Code128A, Code128B, or Code128C) to the `Symbology` property of the Barcode report item. 

### Control Characters 

Code128 can represent both ASCII characters and non-ASCII control characters. Normally, the Barcode report item automatically inserts the appropriate control characters to conform to the Code128 specification. 

However, certain applications may require you to manually insert certain control characters, such as the FNC1-FNC4 functional characters. For this purpose, the Barcode report item assigns special Unicode values to these control characters outside the normal 0-127 ASCII code range. 
  

The following table lists all Code128 control characters and their corresponding Unicode values: 

| Control Character | Hexadecimal | Decimal |
| ------ | ------ | ------ |
|Code A|F4|244|
|Code B|F5|245|
|Code C|F6|246|
|FNC1|F7|247|
|FNC2|F8|248|
|FNC3|F9|249|
|FNC4|FA|250|
|Shift|FB|251|
|Start A|FC|252|
|Start B|FD|253|
|Start C|FE|254|
|Stop|FF|255|


For example, the following code inserts the FNC4 control character in the middle of a Barcode:
    
````C#
this.barcode1.Value = "ABCD" + "\u00FA" + "1234";
````
````VB.NET
me.barcode1.Value = "ABCD" & ChrW(&HFA) & "1234"
````

## GS1-128 Specifics 

GS1-128 is a special case of Code128. The only difference between GS1-128 and Code 128 is that GS1-128 inserts the FNC1 control character at the beginning of the barcode to conform to the GS1-128 specification.

If you have a multi-part GS1-128 barcode which requires the FNC1 control character as a delimiter between the different parts, you have to insert it manually. 
    
````C#
this.barcode1.Value = "1234" + "\u00F7" + "5678";
````
````VB.NET
me.barcode1.Value = "1234" & ChrW(&HF7) & "5678"
````


## See Also
 
* [`Telerik.Reporting.Barcode`](/reporting/api/Telerik.Reporting.Barcode)  
* 
* [`Telerik.Reporting.Barcodes.Encoder1D`](/reporting/api/Telerik.Reporting.Barcodes.Encoder1D)  
* 
* [`ShowText`](/reporting/api/Telerik.Reporting.Barcodes.Encoder1D#Telerik_Reporting_Barcodes_Encoder1D_ShowText)
