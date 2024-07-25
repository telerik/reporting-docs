---
title: Global Objects
page_title: Global Objects Explained
description: "Learn what are the Global Objects in Telerik Reporting and how you may use them in the expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects
tags: global,objects
published: True
position: 3
previous_url: /expressions-global-objects
---

# Global Objects Overview

Telerik script language provides the following intrinsic (or "built-in") objects that may be used in [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) inside the report definition.

## Fields

The `Fields` collection represents the set of fields specified by the report data source plus any additional calculated fields that you create. It is a __function__ that requires a string argument with the name of the data field and not an __object__ like `ReportItem.DataObject`.

After you create a data source for a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) (Report, Table, Crosstab, List, Chart), the field collection appears in the [Data Explorer toolbox]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}).

Example: `Fields.ProductID` - returns the value of the field ProductID in the current data scope instance. If the data source does not contain the referenced column, an error is thrown. If the report has no data source set, the expression result is null (Nothing)

>note If the data source field name is not a valid name in terms of programming languages (contains spaces, punctuation marks, etc.) enclose its name in square brackets, for example =Fields.[My Column]; Because brackets are special characters, you must use a backslash (`\\`) to escape the bracket, if it is part of a data field name. For example, a data field named `Field[1]` would be referenced as `Fields.[Field\\[1\\]]`.

Another option for accessing the values in the fields collection is the global function [Fields(fieldName)]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}).

When the DataSource is a collection of objects that don't contain named fields, for example, an array of integers/strings, you may access the collection items in the Report Expressions as `= Fields.Item` or `= Fields("Item")`.

## Parameters

Represents the collection of report parameters, each of which can be single-value or multi-value. See [Adding Parameters to Report]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}).

Examples: 

* `=Parameters.Product.Value` - returns the actual `Value` of the report parameter with the name Product.
* `=Parameters.Product.Label` - when the parameter Product has AvailableValues, returns its property `AvailableValues.DisplayMember`. When there are no AvailableValues or the DisplayMember is not specified, it falls back to the actual `Value` of the parameter.
* `=Parameters.Product.Text` - returns the property `Text` of the report parameter with the name Product. When Text is not specified it displays the `Name` of the parameter, in this example, _Product_.

Another option for accessing the report parameters' collection is the global function [Parameters(parameterName)]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/report-functions%}).

## Environment

Represents a read-only type that contains information about the environment in which the reporting engine works. Contains two properties: `OperatingSystem` and `GraphicsEngine`.

* `OperatingSystem` returns the identifier of the operating system in which the current application is running, as provided by the [OperatingSystem.VersionString](https://learn.microsoft.com/en-us/dotnet/api/system.operatingsystem.versionstring) property (e.g. 'Microsoft Windows NT 6.2.9200.0').
* `GraphicsEngine` returns a [GraphicsEngine](/api/telerik.drawing.contract.graphicsengine) member representing the currently used graphics engine. Available values: `Gdi` and `Skia`, accessible also through the **ReportingConstants.GraphicsEngine** options. Example: `=Switch(Environment.GraphicsEngine, GraphicsEngine.Gdi, "Using GDI", GraphicsEngine.Skia, "Using Skia", "N\A")`

## ExecutionTime

A [DateTime](https://learn.microsoft.com/en-us/dotnet/api/system.datetime) instance containing the date and time of the moment when the current report started its processing by the reporting engine.

## PageNumber

The current page number. It can be used only in the page header and footer. 

## PageCount

The total number of pages in the report that can be used only in the page header and footer.

>note The page numbering behavior in a report contained in a report book may be controlled through the [PageNumberingStyle](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_PageNumberingStyle) property.

## RenderingFormat

Represents the runtime rendering extension currently used to render the report.

For information regarding the available child properties, check out the [RenderingFormat](/api/Telerik.Reporting.Processing.RenderingFormat) API reference or use the Expression Builder dialog.

This global object will be populated while rendering the report in any report viewer or programmatically. The object will not be available in the ReportParameters properties evaluation as the parameters get evaluated before the rendering operation gets started.

It is strongly recommended to use this property only for report visual output customizations and not for data retrieval parameterization, as the report data gets cached between the rendering operations for desktop viewers. Thus, using it will not lead to the desired effect.

## ReportItem

The current processing item in which context the expression is evaluated. The object is not evaluated when the processing item is not available, i.e. when using it in report parameters.

The `ReportItem` is an __object__ passed from each item to its children. The `ReportItem.DataObject` in particular holds the data of the parent item, which makes it available to its children. If the parent item is a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) with groups, only the group data is passed as `ReportItem.DataObject` to the corresponding groups and the items within these groups.

When the child is a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}), it passes as `ReportItem.DataObject` its own data to its children. If the child isn't a data item and doesn't have a DataSource, it passes the `ReportItem.DataObject` received from its parent to its children.

For example, the `Fields` from a Table DataSource are passed as `ReportItem.DataObject` to its cells' items, e.g. TexBoxes. Therefore, in these no-data items, the Expression `=Fields.fieldName` is equivalent to the Expression `=ReportItem.DataObject.fieldName`.

On the Table item though, the `ReportItem.DataObject` comes from its parent, for example, from the Report item. For that reason, `=ReportItem.DataObject.fieldName` is different from `=Fields.fieldName` in the Table. The `Fields` __function__ represents the Table DataSource, whereas the `ReportItem.DataObject` __object__ represents its parent (e.g. Report) DataSource.

For information regarding the available processing ReportItem properties, check out the corresponding processing item API reference.

## ReportDefinition

The current report definition.

For information regarding the available Report definition properties, check out the [Report](/api/Telerik.Reporting.Report) API reference.

## UserIdentity

Represents the current user identity in which context the expression is evaluated.

For information regarding the available child properties, check out the [UserIdentity](/api/Telerik.Reporting.Processing.UserIdentity) API reference or use the Expression Builder dialog.

This global object will be populated for all web report previews based on the HTML5 report viewer. The default user identity resolution can be substituted for each report rendering service by overriding the corresponding GetUserIdentity method.

When exporting a report programmatically the global object can be populated by setting the static property [Telerik.Reporting.Processing.UserIdentity.Current](/api/Telerik.Reporting.Processing.UserIdentity#Telerik_Reporting_Processing_UserIdentity_Current).
