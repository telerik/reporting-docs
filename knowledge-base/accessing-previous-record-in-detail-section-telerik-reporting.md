---
title: Retrieving Previous Record in Telerik Reporting Detail Section
description: Learn how to retrieve the previous record in the detail section of a Telerik Reporting report.
type: how-to
page_title: Accessing Previous Record in Detail Section of Telerik Reporting
meta_title: Accessing Previous Record in Detail Section of Telerik Reporting
slug: accessing-previous-record-in-detail-section-telerik-reporting
tags: reporting, detail-section, previous, exec, isnull, expressions
res_type: kb
ticketid: 1710935
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
<td>20.0.26.211</td>
</tr>
</tbody>
</table>

## Description

I want to display the previous record in the detail section of my Telerik Reporting report. Using the Previous function directly in the detail section does not allow retrieving the previous group's value. I need this functionality to manipulate the data starting from the second record. I am open to saving the previous value into a variable if necessary.

This knowledge base article also answers the following questions:
- How to use the Previous function in Telerik Reporting?
- How to retrieve values from the previous group in Telerik Reporting?
- How to avoid empty values for the first record in Telerik Reporting?

## Solution

To achieve this functionality, use the `Exec` function combined with the `Previous` function. The `Exec` function allows retrieving values from the previous group within the detail section.

1. Use the following expression to get the previous group's value:
   ```
   = Exec("group", Previous(Fields.Column1))
   ```

   Replace `"group"` with the name of your group and `Fields.Column1` with the field you want to retrieve.

2. To avoid displaying an empty value for the first record, use the `IsNull` function. This ensures a default value, such as `0`, is shown for the first record:
   ```
   = IsNull(Exec("group", Previous(Fields.Column1)), 0)
   ```

### Example Code Snippets

#### Retrieve Previous Group Value:
```
= Exec("group", Previous(Fields.Column1))
```

#### Handle Empty First Record:
```
= IsNull(Exec("group", Previous(Fields.Column1)), 0)
```

### Notes
- Ensure the group name in the `Exec` function matches your report design.
- The `Previous` function retrieves the previous detail section's value by default.

## See Also

- [Previous and Exec functions - Telerik Reporting](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions)
- [IsNull function - Telerik Reporting](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/expressions/expressions-reference/functions/conditional-functions)
- [Expressions in Telerik Reporting](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/expressions/overview)
