---
title: Supported Types
page_title: Supported Types | for Telerik Reporting Documentation
description: Supported Types
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/supported-types
tags: supported,types
published: True
position: 0
---

# Supported Types



There are two types of barcodes according to their dimensions:

## Linear (1D) barcodes

The linear (one-dimensional) barcodes are made up of lines and spaces of various widths that create specific patterns. The Barcode item currently supports the following one-dimensional barcode types:         




| Barcode | Description |
| ------ | ------ |
|Codabar|(aka Ames Code/USD-4/NW-7/2 of 7 Code): Used in libraries and blood banks|
|Code 11|(USD-8): Used to identify telecommunications equipment|
|Code 25 Standard|Used in airline ticket marking, photofinishing|
|Code 25 Interleaved|Used in warehouse, industrial applications|
|Code 39|(aka USD-3, 3 of 9): U.S. Government and military use, required for DoD applications|
|Code 39 Extended|(aka USD-3, 3 of 9): U.S. Government and military use, required for DoD applications, supports full ASCII|
|Code 93|(aka USS-93): Compressed form of Code 39|
|Code 93 Extended|(aka USS-93): Compressed form of Code 39, supports full ASCII|
|Code 128|Very dense code, used extensively worldwide|
|Code 128 A|Subset of Code 128  *(more info in [1D Barcodes]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/1d-barcodes%}))|
|Code 128 B|Subset of Code 128  *(more info in [1D Barcodes]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/1d-barcodes%}))|
|Code 128 C|Subset of Code 128  *(more info in [1D Barcodes]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/1d-barcodes%}))|
|MSI|Variation of Plessey code, with similar applications|
|EAN 8|Short version of EAN-13, 8 characters|
|EAN 13|Used with consumer products internationally, 13 characters|
|GS1-128|Formerly known as UCC-128 and EAN-128. Used to encode shipping/product information  *(more info in [1D Barcodes]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/1d-barcodes%}))|
|Intelligent Mail|Used by U.S. Post Office as successor of POSTNET and PLANET barcodes.|
|PLANET|Printed by U.S. Post Office on envelopes. Predecessor of Intelligent Mail barcode|
|POSTNET|Printed by U.S. Post Office on envelopes. Predecessor of Intelligent Mail barcode|
|UPC A|Used with consumer products in U.S., 12 characters|
|UPC E|Short version of UPC symbol, 6 characters|
|UPC Supplement 2|Used to indicate magazines and newspaper issue numbers|
|UPC Supplement 5|Used to mark suggested retail price of book|




## Matrix (2D) barcodes

The matrix code is a two-dimensional way for representing information. It can also be referred to as a 2D barcode or simply a 2D code.           It is similar to the linear (one-dimensional) barcode, but can represent more data per unit area. The Barcode item currently supports the following 2D barcodes:         


| Barcode | Description |
| ------ | ------ |
|QR Code|One of the most popular 2D barcodes with wide commercial application. More info [here]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/qr-code/overview%}).|
|Swiss QR Code|A barcode based on the QR symbology used exclusively in Switzerland payment slips named QR-bill. More info [here]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/data-matrix/overview%}).|
|PDF147|A stacked linear 2D barcode used by U.S. Postal Services, Department of Homeland Security, airline industry and others. More info [here]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/pdf417/overview%}).|
|DataMatrix|2D barcode mostly used to mark smaller areas due to its high data density. Recommended by the US Electronic Industries Alliance. More info [here]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/data-matrix/overview%})|




# See Also

