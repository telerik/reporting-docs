---
title: Settings
page_title: Settings | for Telerik Reporting Documentation
description: Settings
slug: telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/swiss-qr-code/settings
tags: settings
published: True
position: 1
---

# Settings



This article explains the specific Swiss QR code settings.

Since the Swiss QR barcode is an extension of the QR barcode symbology, some of the settings applicable to QR barcode are also applicable to the Swiss QR barcode.         The list with the QR barcode settings can be reviewed [here]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/2d-barcodes/qr-code/settings%}).         The list below shows the settings that are specific to the Swiss QR barcode.       

## BillData

This compound property contains the data needed to construct the correctly formatted barcode value.           The property consists of three sub-properties: Creditor, Debtor and Payment, each containing relevant information about the bill data.         

### Creditor

The Creditor property contains information about the *Payable To*  data entity.             

* __Address__  - Determines the Creditor address fields, shown below in alphabetical order:                 

   + __City__  - mandatory field, 35 characters max.                     

   + __Country__  - mandatory field, containing the 2-letter country code as defined by ISO 3166-1.                     

   + __House Number__  - non-mandatory field.                     

   + __Postal code__  - mandatory field, 16 characters max.                     

   + __Street__  - non-mandatory field.                     

* __IBAN__  - mandatory field that must pass the validation check for an IBAN identifier.                 

* __IBANType__  - mandatory field determining the type of the IBAN field. Supported values: *IBAN/QRIBAN* . The default value is *IBAN* .                 

* __Name__  - mandatory field determining the Creditor name, 70 characters max.                 

### Debtor

The Debtor property contains information about the *Payable By*  data entity.             

* __Address__  - Determines the Debtor address fields, following the same rules as the Creditor address fields, listed above.                 

* __Name__  - mandatory field determining the Debtor name, 70 characters max.                 

### Payment

The Payment property contains information about the *Payment*  data entity.             

* __AdditionalInfo__  - non-mandatory field containing additional information about the bill recipient.                 

* __AlternativeProcedure1__  - non-mandatory field representing the first of the two elements containing specific information about the alternative procedures applied to the bill.                 

* __AlternativeProcedure2__  - non-mandatory field representing the second of the two elements containing specific information about the alternative procedures applied to the bill.                 

* __Amount__  - mandatory field containing the amount of money to be paid. Maximum 12 digits, including the decimals. The default value is *0.01* .                 

* __Currency__  - mandatory field determining the amount currency. Supported values: *CHF/EUR* . The default value is *CHF* .                 

* __Reference__  - a field determining the payment reference number. It can be empty or null when the __ReferenceType__  field is set to *NON* . Length: [5 - 25] characters.                 

* __ReferenceType__  - mandatory field determining the type of the payment reference number. Supported values: *NON/SCOR/QRR* . The default value is *NON* .                 

* __StructuredBillInfo__  - non-mandatory field containing coded information for automated booking of the payment. 140 characters max.                 

## QuietZone

Determines the size of the quiet zone (quiet area) - unprinted border around the barcode modules. It can be set in physical units like "1.6mm" or "0.5cm".           The quiet zone size is taken into account when calculating the required size of the Barcode item.         

## ValidateBillData

Determines whether the data provided in the  [BillData](/reporting/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_BillData)  property will be validated, or not.           If set to __false__ , the data will not be validated.           If set to __true__ , the data will be validated under the following conditions:         

* At design-time the validation will be performed only if the  [BillData](/reporting/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_BillData)  property contains static values, i.e. its fields must not contain any expression.             

* At run-time (during the report processing stage) the validation will be always performed, because all the expressions will be evaluated against the current data context.             

## ValueFromBillData

Determines whether the barcode  [Value](/reporting/api/Telerik.Reporting.Barcode#Telerik_Reporting_Barcode_Value)  property will obtain its value from the data configured in the  [BillData](/reporting/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder#Telerik_Reporting_Barcodes_SwissQRCodeEncoder_BillData)  property, or not.           If set to __true__ , the data will be constructed from the fields in the *BillData*  property.           If set to __false__ , the *BillData*  fields will not be respected and the barcode item will encode the raw data used in the *Value*  field.         

# See Also


# See Also

 * [          Swiss Implementation Guidelines QR-bill (PDF)
        ](https://www.paymentstandards.ch/dam/downloads/ig-qr-bill-2019-en.pdf)

 * [Telerik.Reporting.Barcodes.SwissQRBillData](/reporting/api/Telerik.Reporting.Barcodes.SwissQRBillData) 

 * [Telerik.Reporting.Barcodes.SwissQRCodeEncoder](/reporting/api/Telerik.Reporting.Barcodes.SwissQRCodeEncoder) 
