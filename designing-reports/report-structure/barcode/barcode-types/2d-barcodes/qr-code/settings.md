---
title: Settings
page_title: Settings | for Telerik Reporting Documentation
description: Settings
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/qr-code/settings
tags: settings
published: True
position: 1
---

# Settings



This article explains the specific QR code settings.

## Version

This is an integer value, in the range from __1__  to __40__ , representing  	        the desired barcode version. Usually, higher versions are used do accommodate larger amounts of data. 	        If this property is not set, the encoder internally calculates the lowest possible version and uses it instead.         

## Error Correction Level

There are four possible values to choose from - L(Low), M(Medium), Q(Quartile), H(High).  	        These values allow for 7%, 15%, 25% and 30% recovery of symbol code words. Additionally, choosing  	        a higher version of error correction dedicates a larger portion of modules for error correction.  	        Thus, given two QR codes with the same sizes, the one with a lower error correction level would be  	        able to accommodate more data.         

## Mode

There are four values available for this property - Alphanumeric, Numeric, Byte and Kanji. Essentially, this determines the          	sets of acceptable symbols - numbers, characters, etc.         

## Extended Channel Interpretation (ECI)

The Extended Channel Interpretation, in short (ECI) allows for encoding of characters of different character sets. For example,          	choosing an ECI equal to 8859-7 will allow for encoding characters from the Latin/Greek alphabet. Please note, that the ECI          	setting is only respected when the Mode property of the control is set to Byte.         

## FNC1

This mode is used for messages containing data formatted either in accordance with the UCC/EAN Application Identifiers standard          	or in accordance with a specific industry standard previously agreed with AIM International.         

## Application Indicator

This setting allows for additional data to be applied to the FNC1 data. Please, keep in mind, that this is only applicable with           	FNC1Mode.FNC1SecondPosition. Additionally, the acceptable data for this property is in the range {a-z}],{[A-Z} and {00-99}.         

Essentially, both the FNC1 property and the ApplicationIndicator data is applied to the raw data encoded in the control,  			allowing for special formatting.         

## Examples

{{source=CodeSnippets\CS\API\Telerik\Reporting\BarcodeSnippets.cs region=Barcode_QRCodeEncoder_Settings}}
````cs
	            var encoder = new Telerik.Reporting.Barcodes.QRCodeEncoder();
	
	            encoder.Version = 10;
	            encoder.ErrorCorrectionLevel = Telerik.Reporting.Barcodes.QRCode.ErrorCorrectionLevel.M;
	            encoder.ECI = Telerik.Reporting.Barcodes.QRCode.ECIMode.CP437;
	            encoder.Mode = Telerik.Reporting.Barcodes.QRCode.CodeMode.Alphanumeric;
	            encoder.FNC1 = Telerik.Reporting.Barcodes.QRCode.FNC1Mode.SecondPosition;
	            encoder.ApplicationIndicator = "00";
	
	            this.barcode1.Encoder = encoder;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\BarcodeSnippets.vb region=Barcode_QRCodeEncoder_Settings}}
````vbnet
	        Dim encoder = New Telerik.Reporting.Barcodes.QRCodeEncoder()
	
	        encoder.Version = 10
	        encoder.ErrorCorrectionLevel = Telerik.Reporting.Barcodes.QRCode.ErrorCorrectionLevel.M
	        encoder.ECI = Telerik.Reporting.Barcodes.QRCode.ECIMode.CP437
	        encoder.Mode = Telerik.Reporting.Barcodes.QRCode.CodeMode.Alphanumeric
	        encoder.FNC1 = Telerik.Reporting.Barcodes.QRCode.FNC1Mode.SecondPosition
	        encoder.ApplicationIndicator = "00"
	
	        Me.barcode1.Encoder = encoder
````



# See Also
 * [Telerik.Reporting.Barcode](/reporting/api/Telerik.Reporting.Barcode)  * [Telerik.Reporting.Barcodes.QRCodeEncoder](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder)  * [ApplicationIndicator](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder#Telerik_Reporting_Barcodes_QRCodeEncoder_ApplicationIndicator)  * [ECI](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder#Telerik_Reporting_Barcodes_QRCodeEncoder_ECI)  * [ErrorCorrectionLevel](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder#Telerik_Reporting_Barcodes_QRCodeEncoder_ErrorCorrectionLevel)  * [FNC1](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder#Telerik_Reporting_Barcodes_QRCodeEncoder_FNC1)  * [Mode](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder#Telerik_Reporting_Barcodes_QRCodeEncoder_Mode)  * [Version](/reporting/api/Telerik.Reporting.Barcodes.QRCodeEncoder#Telerik_Reporting_Barcodes_QRCodeEncoder_Version) 
