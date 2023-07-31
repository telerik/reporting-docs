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

The Fields collection represents the set of fields specified by the report data source plus any additional calculated fields that you create. After you create a data source for a data item (Report, Table, Crosstab, List, Chart), the field collection appears in the [Data Explorer toolbox]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}).

Example: Fields.ProductID - returns the value of the field ProductID in the current data scope instance. If the data source does not contain the referenced column, error is thrown. If the report has no data source set, the expression result is null (Nothing)

>note If the data source field name is not a valid name in terms of programming languages (contains spaces, punctuation marks, etc.) enclose its name in square brackets, for example =Fields.[My Column]; Because brackets are special characters, you must use a back slash (`\\`) to escape the bracket, if it is part of a data field name. For example, a data field named `Field[1]` would be referenced as `Fields.[Field\\[1\\]]`.

Another option of accessing the values in the fields collection is the global function [Fields(fieldName)]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}).

> In the context of a [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) like Table, `Fields` refers to its inner data. The `ReportItem.DataObject` references the parent's Data Item data. This lets you bind them, for example, to filter the inner item data. For details see [Use parent data item data for child data item datasource parameter]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%}#use-parent-data-item-data-for-child-data-item-datasource-parameter).

## Parameters

Represents the collection of report parameters, each of which can be single-value or multi-value. See [Adding Parameters to Report]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}).

Examples:

* `=Parameters.Product.Value` - returns the actual `Value` of the report parameter with name Product.
* `=Parameters.Product.Label` - when the parameter Product has AvailableValues, returns its property `AvailableValues.DisplayMember`. When there are no AvailableValues or the DisplayMember is not specified, it falls back to the actual `Value` of the parameter.
* `=Parameters.Product.Text` - returns the property `Text` of the report parameter with name Product. When Text is not specified it displays the `Name` of the parameter, in this example, _Product_.

Another option for accessing the report parameters' collection is the global function [Parameters(parameterName)]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/report-functions%}).

## PageNumber

The current page number that can be used only in page header and footer. 

## PageCount

The total number of pages in the report that can be used only in page header and footer.

>note The page numbering behavior in a report contained in a report book may be controlled through the [PageNumberingStyle](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_PageNumberingStyle) property.

## RenderingFormat

Represents the runtime rendering extension currently used to render the report.

For information regarding the available child properties, check out the [RenderingFormat](/api/Telerik.Reporting.Processing.RenderingFormat) API reference or use the Expression Builder dialog.

This global object will be populated while rendering the report in any report viewer or programmatically. The object will not be available in the ReportParameters properties evaluation as the parameters get evaluated before the rendering operation gets started.

It is strongly recommended to use this property only for report visual output customizations and not for data retrieval parameterization, as the report data gets cached between the rendering operations for desktop viewers. Thus, using it will not lead to the desired effect.

## ReportItem

The current processing item in which context the expression is evaluated. The object is not evaluated when the processing item is not available, i.e. when using it in report parameters.

For information regarding the available processing ReportItem properties, check out the corresponding processing item API reference.

## ReportDefinition

The current report definition.

For information regarding the available Report definition properties, check out the [Report](/api/Telerik.Reporting.Report) API reference.

## UserIdentity

Represents the current user identity in which context the expression is evaluated.

For information regarding the available child properties, check out the [UserIdentity](/api/Telerik.Reporting.Processing.UserIdentity) API reference or use the Expression Builder dialog.

This global object will be populated for all web report previews based on the HTML5 report viewer. The default user identity resolution can be substituted for each reports rendering service by overriding the corresponding GetUserIdentity method.

When exporting a report programmatically the global object can be populated by setting the static property [Telerik.Reporting.Processing.UserIdentity.Current](/api/Telerik.Reporting.Processing.UserIdentity#Telerik_Reporting_Processing_UserIdentity_Current).
