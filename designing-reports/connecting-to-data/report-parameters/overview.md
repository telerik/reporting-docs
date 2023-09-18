---
title: Overview
page_title: Report Parameters at a Glance
description: "Learn about the Report Parameters in Telerik Reporting, what properties they expose, how you may pass values to them, and much more."
slug: telerikreporting/designing-reports/connecting-to-data/report-parameters/overview
tags: overview,report,parameters
published: True
position: 0
previous_url: /designing-reports-parameters
---

# Report Parameters Overview

This document describes the main uses of report parameters, report parameter properties, and parameter values. Report parameters allow you to control the report's content, to connect related reports, or to use them as arguments in functions.

To design a report that uses parameters effectively, you need to understand how parameters and [Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) components work together, how parameters and expressions work together, and how to manage parameters.

## Main Usage of Report Parameters

Parameters may contain single or multiple values. In case they have pre-defined values (i.e. Available Values), the latter may be static or dynamic (e.g. query-based) collections. The parameters may be allowed to have BLANK and NULL values. Other usages of the report parameters are:

* in data binding - to vary report data retrieved from a [Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) component
* in [expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%}) - to directly provide a value
* in [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) filtering, sorting or grouping criteria

After a report parameter is created, you can modify the default values and other parameter properties, such as visibility.

For example, you might want to create a report with a hidden parameter that selects data specific to the user running the report. Or you can filter the displayed results in a table item, based on the selection of the report parameter.

## Report Parameter Properties

Report parameters can have the following properties:

* [Type](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Type) 

	Determines the type of the values that are acceptable. The allowed types are `Boolean`, `DateTime`, `Integer`, `Float`, and `String`. Acceptable values for each type are listed here: [ReportParameterType](/api/Telerik.Reporting.ReportParameterType) The default parameter type is `String`.

* [Name](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Name)

	Specifies the parameter name. Use it to access the parameter. The name must be a valid identifier - may contain only digits (0-9), letters (a-z, A-Z), and underscore sign (_). Must begin with a letter or underscore.

* [Value](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Value) 

	Used to specify a value for the parameter. It can be blank, a value of the allowed types, an Expression that evaluates to a value of the allowed types, or IEnumerable containing values of the allowed types.

	>note When a parameter accepts multiple values (MultiValue=True), you can set the value by programmatically assigning an IEnumerable of the allowed types.

* [Text](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Text) 

	Specifies the text for the parameter to be displayed in the report viewer as a prompt to the end user. It can be blank, string, or Expression. May be accessed in Expressions with the Global Object `=Parameters.[Parameter Name].Text`. If not set, the `Name` of the parameter will be used instead.

	> When you use an Expression to set the property, data fields should not be used and respectively they are not listed in the [Edit Expression Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}).

* [Visible](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Visible) 

	Specifies whether the editor will have UI in the parameters area. If you turn on the `Visible` property for at least one report parameter, the parameter area is shown when previewing the report in the report designer or in the report viewer.

* [AllowNull](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AllowNull) 

	Determines if __null__ (__Nothing__ in VB.NET) value is acceptable.

* [AllowBlank](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AllowBlank) 

	Applied only when the parameter is of type `String`. Determines if an empty string is acceptable.

* [MultiValue](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_MultiValue) 

	Determines if a collection of values (of the specified `Type`) is acceptable as value of the parameter. Parameters with `MultiValue` turned on are mainly used with the __IN__ logical operator.

* [AvailableValues](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AvailableValues) 

	The available values, or valid values, are a set of predefined values which are acceptable as the value of the parameter. Each available value may have a label that will be displayed if the parameter is visible. To define available values for a parameter you need to set the following nested properties:

	+ `DataSource` – a data source for the value/label pairs. The same data sources are supported as for the [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/binding-a-data-item-to-data%}), including the Telerik Reporting [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).

		> The optimization for reusing the raw data from the same DataSource component introduced with [R3 2019 (13.2.19.918)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-13-2-19-918) is valid only for __data items__. It doesn't concern the Report Parameters with AvailableValues relying on DataSource components. Even if there are several parameters that fetch their AvailableValues from the same DataSource, the latter will be called once for each parameter.

	+ `ValueMember` – a column name, expression, or embedded expression based on the __DataSource__ schema. It is used as `Value` in the value/label pair. May be accessed in Expressions with the Global Object `=Parameters.[Parameter Name].Value`.
	+ `DisplayMember` – a column name, expression, or embedded expression based on the __DataSource__ schema. It is used as `Label` in the value/label pair. May be accessed in Expressions with the Global Object `=Parameters.[Parameter Name].Label`. If omitted the `ValueMember` will be used as `DisplayMember` as well. Optional.

	At design time, you can use the [Data Source Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}) to select an existing or to create a new data source.

* [Mergeable](/api/Telerik.Reporting.IReportParameter#Telerik_Reporting_IReportParameter_Mergeable)

	Controls parameter merging in ReportBook. The default value of the Mergeable property is true. Set the Mergeable property to false if you want to prevent a parameter from being merged with its equivalent ones.

* [AutoRefresh](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_AutoRefresh)

	Determines whether to trigger the report preview after changing the value for a parameter. Applies only to visible parameters. The default value is __False__.

## Report Parameter Validation

When a report enters in the processing stage, its value is validated against its validation properties. If one or more parameters do not have valid values, processing is aborted. The following properties are used to validate the supplied parameter’s value:

* Type
* AllowNull
* AllowBlank
* MultiValue
* AvailableValues

## Passing a value to a Report Parameter

A Parameter is populated by setting its `Value` property. You may set this property to a valid value or an expression that evaluates to a valid value. The expression evaluation and validation are performed while the report is processed. An expression used as a parameter value may not contain a reference to the built-in `Fields` collection, as fields are still not populated when the parameters are processed.

Report Parameters' value can be populated in one of the following ways:

* At design time through the [ReportParameter Collection editor]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/reportparameter-collection-editor%})
* Using the automatic user interface that each Report Viewer provides.
* Programmatically by using the `ReportParameters` collection.
* Using a [SubReports]({%slug telerikreporting/designing-reports/report-structure/subreport%}) `Parameters` collection.

## Cascading (dependent) parameters

Cascading parameters provide a way of creating dependencies between parameters to handle large amounts of input data. You can define a set of parameters where the list of available values for one parameter depends on the values chosen in other parameters.

For example, the first parameter could present a list of product categories. When the user selects a category, the second parameter is updated with a list of subcategories within the category. A third parameter could then display a list of products within the selected subcategory. The value for the product parameter is used to filter the report to a particular product. The parameters whose values depend on other parameter values are known as cascading, dependent, or hierarchical parameters. For more details on how to use cascading parameters, see the following documents:

* [How to Cascade Parameters with applied filtering on Report level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-report-level%})
* [How to Cascade Parameters with applied filtering on data source level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-data-source-level%})

>note The Report Parameter is processed as a whole entity. Its evaluation starts after all its dependencies, for example, other Report Parameter values have been evaluated. If, for example, the *Text* property is set with an Expression that can be evaluated and the *Value* property depends on another Report Parameter, whose value is unknown/invalid, neither the Text nor the Value property will be set.

## Parameter area

When at least one report parameter has its `Visible` property turned on, a parameter area is shown as part of the report viewer. This helps the report developer to easily provide an input method for the end users. Based on the settings of the parameters, a suitable editor UI is created. The parameter's layout on the parameter area is formatted automatically. The order is determined by the order in which the parameters appear in the [ReportParameters](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_ReportParameters) collection. The end user can enter or select values in the editors. When at least one visible report parameter has the `AutoRefresh` property turned off, a `Preview` button is available. In this case, to preview the report, the end user must click the `Preview` button. If all parameters have default values, the report runs automatically on the first view. You can show or hide the parameters area from the `Parameters` button in the report viewer’s toolbar.

## See Also

* [Adding Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})
* [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%})
* [Using Report Parameters programmatically]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-programmatically%})
* [Using Multivalue Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%})
