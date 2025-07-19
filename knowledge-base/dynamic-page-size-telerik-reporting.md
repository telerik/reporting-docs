---
title: Dynamically Setting Page Size Based on Report Parameter in Telerik Reporting
description: Learn how to dynamically set PageSettings.PageSize in Telerik Reporting using a binding expression based on a report parameter.
type: how-to
page_title: How to Dynamically Adjust Page Size Based on Report Parameter in Telerik Reporting
meta_title: Dynamically Adjust Page Size in Telerik Reporting Using Report Parameter
slug: dynamic-page-size-telerik-reporting
tags: telerik, reporting, pagesettings, binding, parameters
res_type: kb
ticketid: 1693152
---

## Environment

<table>
  <tbody>
    <tr>
      <td>Product</td>
      <td>Reporting</td>
    </tr>
    <tr>
      <td>Version</td>
      <td>14.2.20.1021</td>
    </tr>
  </tbody>
</table>

## Description

I need to dynamically adjust the page size of a Telerik report based on a report parameter. I want to use a binding expression for `PageSettings.PageSize` without relying on an external function, such as a .NET library with custom functions. I am looking for a solution where the page size can be dynamically controlled using expressions.

This knowledge base article also answers the following questions:
- How to bind page size to a report parameter in Telerik Reporting?
- How to set page size dynamically in Telerik Reporting without external functions?
- How to use report parameters to control page dimensions?

## Solution

To adjust the page size dynamically based on the report parameter, use a binding expression that passes the parameter value as a string. Follow these steps:

1. Ensure the report parameter, such as `sizeParameter`, is of type string and contains the page size value in the format `"width,height"` (e.g., `"8.5in,11in"` for letter size).

2. Set up the binding expression for the `PageSettings.PageSize` property using the parameter value.

Example binding expression:
```text
= Parameters.sizeParameter.Value
```

3. Ensure the report parameter is properly configured with valid values corresponding to the expected page dimensions.

When this expression is used, the `PageSettings.PageSize` property will dynamically adjust based on the parameter values provided by the user.

## See Also

- [Using Expressions in Binding](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings)
- [Report Parameters Overview](https://docs.telerik.com/reporting/designing-reports/parameters/overview)
- [Telerik Reporting PageSettings API](https://docs.telerik.com/reporting/api/telerik.reporting.pagesettings)
