---
title: Object must implement IConvertible
description: "Learn why and when the 'Object must implement IConvertible' is thrown and how to resolve it in Telerik Reporting"
type: troubleshooting
page_title: MultiValue Parameter in ObjectDataSource Throws Error IConvertible
slug: object-must-implement-iconvertible
tags: ObjectDataSource, MultiValue, ReportParameter
ticketid: 1612711
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

I have created an [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) component whose data method has a parameter that is of type `List<int>`. When I try to preview the report, I am met with the below error in place of the [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) using said `ObjectDataSource`.

## Steps to Reproduce

1. Create an `ObjectDataSource` whose data method expects a list/array of primitive type as one of its parameters.
1. Create a `MultiValue=True` [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) and set its value to be passed to the parameter of the `ObjectDataSource`
1. Set the value of the report parameter and preview the report.

## Error Message

`An error has occurred while resolving data source: Object must implement IConvertible`

## Cause

The `Multivalue` Report Parameters always return `Object[]`. As the received `Object[]` cannot be converted to `List<type>`, the corresponding `ObjectDataSource` Parameters cannot be correctly mapped to the Report Parameters.

## Solution

Change the type of the `ObjectDataSource` Parameters using `MultiValue` to `Object[]` in one of the following ways:

- Through the [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%})
- Through the code behind:

  ```C#
    new Telerik.Reporting.ObjectDataSourceParameter("UserNames", typeof(object[]), "= Parameters.UserNames.Value"),
  ```

## See Also

- [Using Parameters with the ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/using-parameters-with-the-objectdatasource-component%})
- [Using Multivalue Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%})
