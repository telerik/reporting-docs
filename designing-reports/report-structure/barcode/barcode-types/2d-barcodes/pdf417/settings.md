---
title: Settings
page_title: Settings | for Telerik Reporting Documentation
description: Settings
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/pdf417/settings
tags: settings
published: True
position: 1
---

# Settings



This article explains the specific PDF417 code settings.

>note Depending on the mode and error correction levels, any invalid characters, entered by the user, as well    		as any characters, which surpass the maximum number of symbols, which can be accommodated, will be discarded. 


## Encoding Mode

This is an enumeration, which determines the types of symbols, which will be accepted by the barcode, as well as     			the algorithm by which they will be encoded internally. The enumeration has the following values: 			

* __Auto__ This specifies no particular encoding mode. This means that the barcode control will determine  					internally how to encode each particular symbol, according to the ISO specification. 				  

* __Byte__ The Byte Compaction mode enables a sequence of 8-bit bytes to be encoded into a sequence of codewords.    				  	It is accomplished by a Base 256 to Base 900 conversion, which achieves a compaction ratio of six bytes to five codewords.    				  	Characters with ascii codes from 0 to 255 are acceptable. The table below lists all the characters and their values.   				    

  ![barcode-pdf 417-table 1-byte](images/Barcodes/barcode-pdf417-table1-byte.png)

* __Numeric__ The numeric mode allows encoding of numeric symbols only [0-9]. Any other characters are discarded.    				  

* __Text__ The text mode allows encoding of text characters – upper and lowercase letters, as well as digits,    				  	punctuation and some additional characters. The complete character table is listed below:   				    

  ![barcode-pdf 417-table 2-text](images/Barcodes/barcode-pdf417-table2-text.png)

## Error Correction Level

This is an integer value from 0 to 8. This value determines how many error correction clusters will be  			added to the rendered data. The table below lists the values for each level of error correction:  		    

  ![barcode-pdf 417-table 3-error-correction](images/Barcodes/barcode-pdf417-table3-error-correction.png)

## Rows and Columns

Internally, code PDF417 renders in columns and rows. These rows and columns create a grid, which in turn accommodates      	     all the modules of encoded data. The maximum number of columns in the code is 30, whereas the maximum number of rows is 90.     	     Depending on the scenario, this internal behavior may influence the readability of the control. To address this, two properties      	     are exposed - Rows and Columns. These two properties will allow you to pre-determine the number of rows and columns in      	     the rendered PDF417 code. For example, when you have limited width, you can increase the number of rows.     	   

One thing to keep in mind is that these properties are related to the data, which needs to be encoded.      	     If there is too much data, more rows/columns will be added. If there is insufficient data, not all rows/columns will be used.     	  

## Examples

{{source=CodeSnippets\CS\API\Telerik\Reporting\BarcodeSnippets.cs region=Barcode_PDF417Encoder_Settings}}
````cs
	            var encoder = new Telerik.Reporting.Barcodes.PDF417Encoder();
	
	            encoder.Columns = 3;
	            encoder.Rows = 3;
	            encoder.Encoding = Telerik.Reporting.Barcodes.PDF417.EncodingMode.Auto;
	            encoder.ErrorCorrectionLevel = 2;
	
	            this.barcode1.Encoder = encoder;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\BarcodeSnippets.vb region=Barcode_PDF417Encoder_Settings}}
````vbnet
	        Dim encoder = New Telerik.Reporting.Barcodes.PDF417Encoder()
	
	        encoder.Columns = 3
	        encoder.Rows = 3
	        encoder.Encoding = Telerik.Reporting.Barcodes.PDF417.EncodingMode.Auto
	        encoder.ErrorCorrectionLevel = 2
	
	        Me.barcode1.Encoder = encoder
````



# See Also
 * [Telerik.Reporting.Barcode](/reporting/api/Telerik.Reporting.Barcode)  * [Telerik.Reporting.Barcodes.PDF417Encoder](/reporting/api/Telerik.Reporting.Barcodes.PDF417Encoder)  * [Columns](/reporting/api/Telerik.Reporting.Barcodes.PDF417Encoder#Telerik_Reporting_Barcodes_PDF417Encoder_Columns)  * [Encoding](/reporting/api/Telerik.Reporting.Barcodes.PDF417Encoder#Telerik_Reporting_Barcodes_PDF417Encoder_Encoding)  * [ErrorCorrectionLevel](/reporting/api/Telerik.Reporting.Barcodes.PDF417Encoder#Telerik_Reporting_Barcodes_PDF417Encoder_ErrorCorrectionLevel)  * [Rows](/reporting/api/Telerik.Reporting.Barcodes.PDF417Encoder#Telerik_Reporting_Barcodes_PDF417Encoder_Rows) 
