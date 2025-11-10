---
title: Swiss QR Code
page_title: Swiss QR Code Barcode Report Item
description: "Learn more about the two-dimensional Swiss QR Code barcode type supported by the Telerik Reporting Barcode report item."
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/swiss-qr-code/overview
previous_url: /report-items/barcode/barcode-types/2d-barcodes/swiss-qr-code/overview, /report-items/barcode/barcode-types/2d-barcodes/swiss-qr-code/settings, /report-items-barcode-swiss-qrcode-visual-structure
tags: telerik, reporting, report, items, barcode, 2d, swiss, qr, code, overview
published: True
position: 2
reportingArea: General
---

# Configuring the Swiss QR Code in Reports

The Swiss QR Barcode is used mostly in the QR-bill, which is a document designed to replace the payment slips and currently used in payment transactions in Switzerland.

The Swiss QR Barcode uses the QR symbology to encode its data, applying a few rules on the encoding parameters and physical (printed) dimensions. For a runnable example, refer to the [Swiss QR Bill Report demo](https://demos.telerik.com/reporting/swiss-qr-bill-report).

## Structure

The following image shows the structure of the Swiss QR Barcode.

![The Structure of the Swiss QR Code](images/Barcodes/barcode-swiss-qr-structure.png)

The most important characteristics of the Swiss QR Barcode are:

* To ensure that the Swiss QR Code is read securely, a minimum module size of __0.4 mm__ is required when printing. Converted to pixels on 96 DPI that makes ~1.51px. Due to rounding to a whole pixel, when the barcode is previewed on a computer screen, it may seem that some modules have a different size from the others. This effect gets resolved when rendering in a format that uses anti-aliasing and is not observed when printing, due to the printer higher DPI.

* The measurements of the Swiss QR Code for printing must always be __46 x 46 mm__ without the surrounding quiet space. To satisfy this requirement, the barcode item will calculate the minimum size of the Barcode item on the design surface and will display an error message if the item size is not large enough. Forcing a constant barcode size also makes the [`Stretch`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Stretch) property redundant, so it is not respected.

* The quiet zone or area is the space surrounding the barcode modules. The QR barcode specification mandates that the quiet zone at least four modules wide, which equals to __1.6 mm__ given the minimum module size.

	The Swiss QR Code design specifications suggests the quiet zone to be set to __5 mm__. To satisfy this requirement the [`SwissQRCodeEncoder`](/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder) provides a dedicated property named [`QuietZone`](/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_QuietZone) that allows you to set the width of the quiet zone in a string format, for example, `5mm`, `0.5cm`, or `0.2in`.

* To increase the recognizability, the Swiss QR Code contains an additional recognition symbol: a Swiss cross logo measuring __7 x 7 mm__. The logo is rendered in the center of the barcode, overlaying the existing barcode modules.

## Settings

Since the Swiss QR barcode is an extension of the QR barcode symbology, some of the [settings applicable to QR barcode]({% slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/qr-code/overview %}#settings) are also applicable to the Swiss QR barcode.

### Bill Data

The `BillData` compound property contains the data needed to construct the correctly formatted barcode value. The property consists of the `Creditor`, `Debtor`, and `Payment` sub-properties, each containing relevant information about the bill data.

#### Creditor

The `Creditor` property contains information about the `Payable To` data entity. 

* __Address__&mdash;Determines the Creditor address fields, shown below in alphabetical order: 

	+ (Mandatory) __City__&mdash;35 characters max
	+ (Mandatory) __Country__&mdash;Contains the two-letter country code as defined by ISO 3166-1
	+ (_Optional_) __House Number__
	+ (Mandatory) __Postal code__&mdash;16 characters max
	+ (_Optional_) __Street__

* (Mandatory) __IBAN__&mdash;Must pass the validation check for an IBAN identifier.
* (Mandatory) __IBANType__&mdash;Determines the type of the IBAN field. The supported values are `IBAN` and `QRIBAN`. The default value is `IBAN`.
* (Mandatory) __Name__&mdash;Determines the Creditor name, 70 characters max.

#### Debtor

The `Debtor` property contains information about the `Payable By` data entity.

* __Address__&mdash;Determines the Debtor address fields, following the same rules as the Creditor address fields, listed above.
* (Mandatory) __Name__&mdash;Determines the Debtor name, 70 characters max.

#### Payment

The `Payment` property contains information about the `Payment` data entity.

* (_Optional_) __AdditionalInfo__&mdash;Contains additional information about the bill recipient.
* (_Optional_) __AlternativeProcedure1__&mdash;Represents the first of the two elements containing specific information about the alternative procedures applied to the bill.
* (_Optional_) __AlternativeProcedure2__&mdash;Represents the second of the two elements containing specific information about the alternative procedures applied to the bill.
* (Mandatory) __Amount__&mdash;Contains the amount of money to be paid. Maximum 12 digits, including the decimals. The default value is `0.01`.
* (Mandatory) __Currency__&mdash;Determines the amount currency. The supported values are `CHF`, `EUR`. The default value is `CHF`.
* __Reference__&mdash;Determines the payment reference number. It can be empty or `null` when the __ReferenceType__ field is set to `NON`. The length is [5 - 25] characters.
* (Mandatory) __ReferenceType__&mdash;Determines the type of the payment reference number. The supported values are `NON`, `SCOR`, `QRR`. The default value is `NON`.
* (_Optional_) __StructuredBillInfo__&mdash;Contains coded information for automated booking of the payment. 140 characters max.

### Quiet Zone

`QuietZone` determines the size of the quiet zone (quiet area). Represents the unprinted border around the barcode modules. It can be set in physical units like `1.6mm` or `0.5cm`. The size of the quiet zone is taken into account when calculating the required size of the Barcode item.

## Validate the Bill Data

`ValidateBillData` determines whether the data provided in the [`BillData`](/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_BillData) property will be validated or not. If set to `false`, the data will not be validated. If set to `true`, the data will be validated under the following conditions:

* At design-time the validation will be performed only if the [`BillData`](/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_BillData) property contains static values, that is, its fields must not contain any expression.
* At run-time (during the report processing stage) the validation will be always performed, because all the expressions will be evaluated against the current data context.

### Value from Bill Data

`ValueFromBillData` determines whether the [`Value`](/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Value) property of the barcode will obtain its value from the data configured in the [`BillData`](/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_BillData) property or not. If set to `true`, the data will be constructed from the fields in the `BillData` property. If set to `false`, the `BillData` fields will not be respected and the barcode item will encode the raw data used in the `Value` field.

## See Also

* [(Demo) Swiss QR Bill Report](https://demos.telerik.com/reporting/swiss-qr-bill-report)
* [Swiss Implementation Guidelines QR-bill (PDF)](https://www.paymentstandards.ch/dam/downloads/ig-qr-bill-2019-en.pdf)
* [Swiss QR Code Validator](https://www.swiss-qr-invoice.org/validator/)
