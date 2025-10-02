---
title: Check If Data Field Exists Before Using It
description: "Learn how to avoid Report errors when a data field does not exist."
type: how-to
page_title: Avoid Report error when no such data field
slug: check-if-data-field-exists-before-using-it
position:
tags:
ticketid: 1462533
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

In some scenarios, part of the fields used to design a report may not be available at runtime. This will cause an exception in the report stating that the corresponding field is not defined in the current scope. The error message will be displayed in a red rectangle, replacing the corresponding report item. The error rectangle cannot be customized, and its size cannot be controlled. This may cause additional issues in report rendering, as extra horizontal page breaks may lead to report documents with more than the expected number of pages.

## Solution

Create a [User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) that returns the data field when it exists, and a default value when the column is not available. Here is a sample implementation:

```CSharp
public static object IfFieldDoesNotExist(Telerik.Reporting.Processing.IDataObject dataObject, string fieldName, object defaultValue)
{
    object result;
    if (dataObject.TryGetValue(fieldName, out result))
    {
        return result;
    }

    return defaultValue;
}
```

The function receives as arguments the [data object](/api/telerik.reporting.processing.processingelement#Telerik_Reporting_Processing_ProcessingElement_DataObject) in the current [data scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope%}), the name of the field that is checked, and the default value that will be used when the field does not exist in the data source. The function can be used in the Report like:

`=IfFieldDoesNotExist(ReportItem.DataObject, "FieldNameHere", DefaultValueHere)`

Details about the _ReportItem.DataObject_ can be found in [How to use the ReportItem.DataObject property in expressions]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%}) article.

## See Also

- [Error handling in Reports and Report Viewers]({%slug error-handling-in-reports-and-report-viewers%})
- [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
