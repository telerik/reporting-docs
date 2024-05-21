---
title: Invoice Report Wizard
page_title: Invoice Report Wizard at a Glance
description: "Learn more about the Invoice Report Wizard in the Report Designer and how to use it to create Invoice reports in Telerik Reporting."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/invoice-report-wizard
tags: invoice,report,wizard,designer,create
published: True
position: 4
previous_url: /InvoiceWizardWalkthrough, /quick-start-add-report-visual-studio, /ui-report-wizard
---

# Invoice Report Wizard of the Report Designer

Invoices are one of the most common business documents, that’s why their preparation should be as simple and fast as possible. Telerik Reporting has introduced a template for making invoices and the current article will explain the key points of the process.

## Create an invoice using the Invoice Template

1. As the most report templates, the Invoice template will be created using a wizard, which will guide you in a step-by-step process. If you are using the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), you can start the __Invoice Wizard__ from the New command, or in case you are using the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}), you can add a __New Report Wizard item__ to your project and select the __Invoice Wizard__ from the __Wizard Selector__ that should appear.

1. The first page of the wizard presents four different invoice layouts to choose from. There is also a brief note that explains in which case the selected layout will be suitable. On the right is a sample picture displaying the resulting invoice design. These four layouts correspond with four predefined reports that are used as a base templates and once the wizard finishes, it will apply the changes onto the selected one and load it into the designer.

	![Select Template dialog of the Invoice Report Wizard in the Designer](images/Templates/Invoice/InvoiceWizard_1_SelectTemplate.png)

1. Once you select the appropriate layout and go to the next page, you need to define the data scenario you will be using when creating the invoice.

	+ The __Plain Data scenario__ is suitable where all the data is contained in one data set and the company details is repeated on every data row along with the items that form the value of the invoice. Although it is not a very common scenario, it might be suitable for invoices with a few items where you want to setup just one data source.
	+ The __Header-Details scenario__ is more common and contains two data sources – the first one is for the static data, related with the company and contains fields that are not to be listed in the invoice details. Such fields are CompanyName, Phone, Fax, ShipTo, BillTo, etc. The second data source contains the data for the items, listed in the invoice – ProductNumber, Description, Price, Taxes, Discounts, etc.

	![Data Scenario dialog of the Invoice Report Wizard in the Designer](images/Templates/Invoice/InvoiceWizard_2_SelectDataScenario.png)

1. The next couple of pages guide the user through the data source setup. If the __Plain Data scenario__ is selected, the Wizard will start a “create-and-setup” sequence for a single data source. If the __Header-Details scenario__ is selected, there will be two sequences displayed consecutively. These wizard pages are common for the most of the report wizards, so we won’t explain their structure and behavior in details. However, the last page of the data source sequence is newly introduced and it defines the relations between the predefined template fields and the fields from the data sources which were set in the previous step.

	![Header data Field Mapping dialog of the Invoice Report Wizard in the Designer](images/Templates/Invoice/InvoiceWizard_3_FieldMapping.png)

1. The FieldMappings form consists of a treeview that contains the data source fields (on the left) and a grid with two columns for template and mapped fields (on the right). The data source fields should be mapped to the template fields, which are shown in the left column of the grid. On the right column are displayed the already mapped fields. Initially the Wizard will automatically map the data source fields that have the same name as the template fields. The fields that are present in the template but you do not need them in your invoice, should be left unmapped and they will not exist in the resulting report.

	> Some of the template fields are noted with a red star. This means that these fields must be mapped to data fields or the report building and processing might result in an unexpected behavior. These fields actually are the most important fields for an invoice – the InvoiceNumber, InvoiceDate, ProductNumber and the ProductPrice.

	You can map the data source fields to the template fields by dragging them from the tree view and dropping them onto the grid. You can also select the necessary data field from the combobox item in the right grid column. In case you need to delete a mapping, you can do this by using the DEL key or selecting `< none >` from the combobox. For convenience, the data source fields that are already mapped are displayed in a gray color in the treeview.

	![Detail data Field Mapping dialog of the Invoice Report Wizard in the Designer](images/Templates/Invoice/InvoiceWizard_4_FieldMapping_Done.png)

1. Once you are done mapping the fields, click Next to go to the __Summary page__. It displays a brief information about the selected layout, data scenario and the defined mappings. It will also display a message if you are missing some mandatory mapping so you could go back and fix it if it is not intentional.

	![Summary page of the Invoice Report Wizard in the Designer](images/Templates/Invoice/InvoiceWizard_5_Summary.png)

1. When you are all set, you can click Finish and the designer will load the produced invoice report, ready to be used. If you have setup the data sources and field mappings properly, you should just click __Preview__ and your invoice will be displayed.
