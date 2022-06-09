---
title: How to Add Report Parameters
page_title: How to Add Report Parameters 
description: How to Add Report Parameters
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters
tags: how,to,add,report,parameters
published: True
position: 1
---

# How to Add Report Parameters

Report parameters typically filter report data that is retrieved from a data source. Filtering data at the data source can improve performance for processing    and viewing a report. For the times when you cannot filter data at the source, you can use parameters to filter report data after it is retrieved. You can also sort and group data in a report based on report parameters.    

There are several ways to add a Report Parameter: 			

* Using the __Report.ReportParameters__ property in the property grid.

* Select the __Report Parameters...__ option from the [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%})

* Right click on the Parameters node of the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%})

* From the __Configure Data Source Parameters__ step of the [DataSource Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%})

##Add a Report Parameter using Report Designer

1. Click the ellipses on the __Report.ReportParameters__ property. This invokes the __ReportParameter Collection editor__.  

  ![](images/ReportParameterEditor.png)

1. Click the __Add__ button to create a new parameter.

1. In __Name__, type the name of the parameter.

1. In __Text__ type the text for the parameter to be displayed in the report viewer as prompt to the end user. If not set, the Name of the parameter will be used instead.

1. In __Type__, select the data type for the parameter value. By default __String__ type is selected.

1. You can leave the __Value__ property blank, enter a literal value or click the ellipses to invoke the [Expression Edit Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}).

1. If the parameter can contain a blank value, set __AllowBlank__ accordingly.

1. If the parameter can contain a null value, set __AllowNull__ accordingly.

1. To allow a user to select more than one value for the parameter, set __MultiValue__ accordingly.

1. To allow a user to select or change a parameter value, set __Visible__ to __True__.

##Add a Report Parameter programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=AddNewReportParameterSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=AddNewReportParameterSnippet}}

##Defining AvailableValues for ReportParameter’s UI using Report Designer

1. Expand the __AvailableValues__ property of the report parameter and fill the following settings to determine the values the end user can choose from.

   * Set the __DataSource__ property to specify data source from which the available values of the editor will be loaded. The same object types used as data source for the report can be used as data source for the report parameters. If no DataSource is specified, available values are not loaded.

   * In the __ValueMember__ property choose a column from the data source from which the editor to load the values.

   * In the __DisplayMember__ property choose a column from the data source from which the editor to draw the value labels.

   * In the __Filters__ you can limit the number of records in the available values based on specified filter rules. If the conditions of the rules are met the record is included. Filters are defined using the [Edit Filter Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-filter-dialog%}).

   * Sorting can be performed on the available values through the __Sorting__ property. Sorting controls the order of the items provided to the user to choose from. Sorting is defined using the [Edit Sorting Dialog.]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-sorting-dialog%})

##Defining AvailableValues for ReportParameter’s UI programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=Define_AvailableValues_for_ReportParameter_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=Define_AvailableValues_for_ReportParameter_Snippet}}

