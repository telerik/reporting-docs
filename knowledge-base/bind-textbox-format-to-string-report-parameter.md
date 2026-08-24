---
title: Bind the TextBox Format Property to a String Report Parameter
description: "Learn how to bind a Telerik Reporting TextBox Format property to a string report parameter and apply a dynamic composite format."
type: how-to
page_title: Bind TextBox Format to a String Report Parameter
slug: bind-textbox-format-to-string-report-parameter
position:
tags: telerik reporting, textbox, format, binding, report parameter, composite format
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 

| 20.2.26.812 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

You can bind the `Format` property of a `TextBox` to a string report parameter. This allows the format to be changed without modifying the report item. The report parameter value must be a .NET composite format string, such as `{0:#,##0.00}`.

The `Format` property does not accept a report expression directly. Use a binding with the property path `Format` and the expression `=Parameters.NumberFormat.Value` instead.

## Solution

### Configure the report in the Report Designer

1. Add a report parameter named `NumberFormat`.
1. Set the parameter **Type** to `String`.
1. Set the parameter **Value** to `{0:#,##0.00}`.
1. Select the `TextBox` that displays the value and set its **Value** to a field expression, such as `=Fields.Amount`.
1. Open the `TextBox` **Bindings** property and add a binding with the following settings:

   | Binding setting | Value |
   |----------------|-------|
   | Property path | `Format` |
   | Expression | `=Parameters.NumberFormat.Value` |

When the report renders, a value such as `1234567.89` is formatted with two decimal places and a grouping separator according to the report culture.

### Configure the report programmatically

The following example creates a string report parameter and binds the `TextBox.Format` property to that parameter:

```csharp
var report = new Telerik.Reporting.Report();
report.ReportParameters.Add(
    "NumberFormat",
    Telerik.Reporting.ReportParameterType.String,
    "{0:#,##0.00}");

var textBox = new Telerik.Reporting.TextBox
{
    Value = "=Fields.Amount"
};

textBox.Bindings.Add(new Telerik.Reporting.Binding
{
    Path = "Format",
    Expression = "=Parameters.NumberFormat.Value"
});

var detailSection = new Telerik.Reporting.DetailSection();
detailSection.Items.Add(textBox);
report.Items.Add(detailSection);
```

The binding expression returns the value of the `NumberFormat` report parameter. The `TextBox.Value` expression supplies the value that the composite format string formats.


### Apply the format to multiple report items

You can use the same string report parameter to control the format of multiple text items. Add the following binding to every `TextBox` that should use the shared format:

| Binding setting | Value |
|----------------|-------|
| Property path | `Format` |
| Expression | `=Parameters.NumberFormat.Value` |

For example, add this binding to both an amount text box and a total text box. When you change the `NumberFormat` parameter from `{0:#,##0.00}` to `{0:C2}`, both text boxes use the new format the next time the report is processed. You only need to change the parameter value; you do not need to edit each bound text item.

The shared format applies only to text items that use this binding. Items without the binding retain their own format.

### Format string examples

| Parameter value | Result for `1234567.89` |
|----------------|--------------------------|
| `{0:0.00}` | `1234567.89` |
| `{0:#,##0.00}` | `1,234,567.89` |
| `{0:C2}` | Currency output according to the report culture |

The grouping separator and decimal symbol depend on the culture used to render the report.

### Troubleshooting

- Set the binding **Property path** to `Format`, not `PropertyPath`.
- Set the binding **Expression** to `=Parameters.NumberFormat.Value`.
- Ensure that the report parameter name matches the name used in the expression.
- Ensure that the report parameter is a `String` and contains a valid composite format string.
- Keep the numeric value in `TextBox.Value`; the `Format` binding controls how that value is displayed.

When inspecting bindings in code, use the `Binding.Path` property to read the target path. The `Binding` class does not expose a `PropertyPath` property.

## See Also

- [Bindings](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings)
- [Using Report Parameters in Expressions](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions)
- [Report Parameters Overview](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview)
- [Expressions as Values of Item Properties](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/expressions-as-values-of-item-properties)
