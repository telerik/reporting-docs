---
title: Adding Report Parameters
page_title: Adding Report Parameters Explained
description: "There are several ways to add a report parameter to the report depending on the preferred designer. Learn more!"
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters
tags: how,to,add,report,parameters,availablevalues
published: True
position: 1
previous_url: /designing-reports-parameters-adding-parameters
reportingArea: General
---

# Approaches for Adding Report Parameters

## What is a Report Parameter?

[Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) allow you to control the report's content, connect related reports, or use them as arguments in functions. They typically filter report data that is retrieved from a [data source component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}). Filtering data at the data source can improve performance for processing and viewing a report. 

For the times when you cannot filter data at the source, you can use parameters to [filter report data after it is retrieved]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}#client-side-filtering). You can also sort and group data in a report based on report parameters.

Report Parameters can also be used to allow for user-input data when the report is displayed in a report viewer.

## Add a Report Parameter using Report Designer

There are several ways to add a Report Parameter to the Report depending on the preferred designer:

### Desktop Report Designers

1. Invoke the __ReportParameter Collection editor__ with one of the following approaches:

	* Using the `Report.ReportParameters` property in the property grid.
	* Select the __Report Parameters...__ option from the [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%})
	* Right click on the `[Parameters]` node of the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%})
	* From the __Configure Data Source Parameters__ step of the [DataSource Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%})

	![The ReportParameter Collection editor of the Desktop Report Designers](images/ReportParameterEditor.png)

1. Click the __Add__ button to create a new parameter.

### Web Report Designer

1. Expand the `DATA` node of the Report Explorer properties to view the inner node `Report parameters`.
1. Click on the `+` sign beside `Report parameters` to create a new parameter and open the dialog with its properties.

![The Add New Item editor of the Web Report Designer for editint Report Parameter properties](images/WebDesignerReportParameterEditor.png)

## Configure the Properties of a Report Parameter using Report Designer

1. In `Name`, type the name of the parameter.
1. In `Text` type the text for the parameter to be displayed in the report viewer as a prompt to the end user. If not set, the Name of the parameter will be used instead.
1. In `Type`, select the data type for the parameter value. By default `String` type is selected.
1. You can leave the `Value` property blank, enter a literal value, or click the ellipses to invoke the [Expression Edit Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}).
1. If the parameter can contain a blank value, set `AllowBlank` accordingly.
1. If the parameter can contain a null value, set `AllowNull` accordingly.
1. To allow a user to select more than one value for the parameter, set `MultiValue` accordingly.
1. To allow a user to select or change a parameter value, set `Visible` to `True`.

## Defining AvailableValues for ReportParameter’s UI using Report Designer

Expand the `AvailableValues` property of the report parameter and fill in the following settings to determine the values the end user can choose from.

* Set the `DataSource` property to specify the data source from which the available values of the editor will be loaded. The same object types used as data sources for the report can be used as data sources for the report parameters. If no DataSource is specified, available values are not loaded.
* In the `ValueMember` property choose a column from the data source from which the editor to load the values.
* In the `DisplayMember` property choose a column from the data source from which the editor to draw the value labels.
* In the `Filters` you can limit the number of records in the available values based on specified filter rules. If the conditions of the rules are met the record is included. Filters are defined using the [Edit Filter Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-filter-dialog%}).
* Sorting can be performed on the available values through the `Sorting` property. Sorting controls the order of the items provided to the user to choose from. Sorting is defined using the [Edit Sorting Dialog.]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-sorting-dialog%})

## Add a Report Parameter programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=AddNewReportParameterSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=AddNewReportParameterSnippet}}

## Defining AvailableValues for ReportParameter’s UI programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=Define_AvailableValues_for_ReportParameter_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=Define_AvailableValues_for_ReportParameter_Snippet}}

In the above snippet, the Expressions `=Fields.[Field Name]` reference fields from the data source of the report parameter, i.e. from its `AvailableValues.DataSource`. The applied filter will limit the parameter `AvailableValues` only to the data rows that have the same `=Fields.ProductCategory` value as the one specified by the other Report Parameter `=Parameters.ProductCategory`. After the filtering, the values in the `AvailableValues` will be sorted based on the field specified as an `Expression` for the sorting and its `Direction`, i.e. `=Fields.ProductSubcategory`, in ascending order.
