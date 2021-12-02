---
title: Settings
page_title: Settings | for Telerik Reporting Documentation
description: Settings
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/data-matrix/settings
tags: settings
published: True
position: 1
---

# Settings



This article explains the specific Data Matrix code settings.

## Encodation

The encodation determines the type of contents encoded by the Data Matrix barcode. Choosing a proper encodation imposes validation rules, but reduces the barcode size and improves its readability.

The following table shows the supported encodations and provides information about their restrictions and data storing requirements:

* __ASCII__  - allowed characters include double digit numerics and all values from the ASCII table.               The double digit numerics use 4 bits. The ASCII values in the 0-127 range use 8 bits. The ASCII values in 128-255 range use 16 bits.             

* __C40__  - Used primarily for upper-case alphanumerics.               The upper-case alphanumeric characters use 5.33 bits.               The lower-case and special characters use 10.66 bits.             

* __Text__  - Used primarily for lower-case alphanumerics.               The lower-case alphanumeric characters use 5.33 bits.               The upper-case and special characters use 10.66 bits.             

* __X12__  - Uses the characters from                [ANSI X12 EDI data set](https://edi3.dicentral.com/ansi-x12) .               Each character takes 5.33 bits.             

* __EDIFACT__  - Used to encode ASCII values in the 32-94 range.               Each character takes 6 bits.             

* __Base256__  - Used to encode characters in the whole ASCII range.               Each character takes 8 bits.             

* __AsciiGS1__  - Used to encode FNC1 characters in the ASCII range             

## SymbolSize

Sets the symbol size and shape of the generated barcode. It can be automatically determined using           __SquareAuto__  or __RectangleAuto__ ,           or specific like __Square32x32__  or __Rectangle16x48__ .         

## TextEncoding

Determines character encoding used to encode the barcode contents. By default it is set to UTF-8,          which uses more bits per character and may increase the size of the barcode image.         

## Examples

{{source=CodeSnippets\CS\API\Telerik\Reporting\BarcodeSnippets.cs region=Barcode_DataMatrixEncoder_Settings}}
````cs
	            var encoder = new Telerik.Reporting.Barcodes.DataMatrixEncoder();
	
	            encoder.Encodation = Telerik.Reporting.Barcodes.DataMatrix.Encodation.Ascii;
	            encoder.SymbolSize = Telerik.Reporting.Barcodes.DataMatrix.SymbolSize.SquareAuto;
	            encoder.TextEncoding = System.Text.UTF8Encoding.UTF8;
	
	            this.barcode1.Encoder = encoder;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\BarcodeSnippets.vb region=Barcode_DataMatrixEncoder_Settings}}
````vbnet
	        Dim encoder = New Telerik.Reporting.Barcodes.DataMatrixEncoder()
	
	        encoder.Encodation = Telerik.Reporting.Barcodes.DataMatrix.Encodation.Ascii
	        encoder.SymbolSize = Telerik.Reporting.Barcodes.DataMatrix.SymbolSize.SquareAuto
	        encoder.TextEncoding = System.Text.UTF8Encoding.UTF8
	
	        Me.barcode1.Encoder = encoder
````



# See Also
 * [Telerik.Reporting.Barcode](/reporting/api/Telerik.Reporting.Barcode)  * [Telerik.Reporting.Barcodes.DataMatrixEncoder](/reporting/api/Telerik.Reporting.Barcodes.DataMatrixEncoder)  * [Encodation](/reporting/api/Telerik.Reporting.Barcodes.DataMatrix#Telerik_Reporting_Barcodes_DataMatrix_Encodation)  * [SymbolSize](/reporting/api/Telerik.Reporting.Barcodes.DataMatrix#Telerik_Reporting_Barcodes_DataMatrix_SymbolSize) 

 * [TextEncoding](https://docs.microsoft.com/en-us/dotnet/api/system.text.encoding)
