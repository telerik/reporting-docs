---
title: Skipping Report Header Content in CSV Export in Telerik Reporting
description: Learn how to exclude report header content from the CSV export in Telerik Reporting by using bindings or an alternative syntax.
type: how-to
page_title: Excluding Report Header Section Content from CSV Export in Telerik Reporting
meta_title: Excluding Report Header Section Content from CSV Export in Telerik Reporting
slug: exclude-report-header-csv-export-telerik
tags: telerik reporting, csv export, report header, bindings, nostatictext
res_type: kb
ticketid: 1682743
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>18.3.24.1218</td>
</tr>
</tbody>
</table>

## Description

I want to exclude the dynamic content of the `reportHeaderSection` from appearing in the CSV export of a report in Telerik Reporting. Despite using the `NoStaticText = true` device info setting, dynamic content from the report header section still appears in the CSV export. I also discovered an alternative syntax using curly braces `{}` that seems to address the issue, but I am unsure about its implications.

This knowledge base article also answers the following questions:
- How can I remove report header content from CSV export in Telerik Reporting?
- Why does wrapping expressions with curly braces exclude content in CSV export?
- What are the implications of using curly braces in Telerik Reporting expressions?

## Solution

To exclude dynamic content from the `reportHeaderSection` in CSV export, use one of the following methods:

### Method 1: Use Value Bindings

1. Configure the `NoStaticText = true` device info setting.
2. For each `TextBox` in the `reportHeaderSection`, avoid direct expressions in the `Value` property.
3. Instead, use bindings for the `Value` property. For example:

```xml
<TextBox Name="TextBox1">
    <Bindings>
        <Binding PropertyName="Value" Expression="= Parameters.MyParameter.Value" />
    </Bindings>
</TextBox>
```

This method ensures that the dynamic content is treated like static text in the CSV export, effectively excluding it.

### Method 2: Use Curly Braces in Expressions

1. Replace the `=` symbol at the beginning of expressions with curly braces `{}`.
2. Example:

```xml
<TextBox Name="TextBox1" Value="{Parameters.MyParameter.Value}" />
```

This syntax appears to "trick" the CSV rendering extension into excluding the content. However, this approach may rely on undocumented behavior and could have unintended consequences in future versions or when used with other export formats.

### Recommendation

Use Method 1 (Value Bindings) as the primary solution to ensure consistent and predictable behavior. Use Method 2 (Curly Braces) as a fallback, but be aware of its potential risks.

## See Also

- [Report Header and Footer Sections - Telerik Reporting](https://docs.telerik.com/reporting/report-items/report-item/report-headers-footers)
- [Setting the CSV Rendering Extension Device Info Settings - Telerik Reporting](https://docs.telerik.com/reporting/knowledge-base/configuring-the-csv-rendering-extension)
- [Bindings in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings)
- [CSV Device Information Settings - Telerik Reporting](https://docs.telerik.com/reporting/doc-output/configure-the-export-formats/csv-device-information-settings)
