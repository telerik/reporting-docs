---
title: Retrieve Last Day of Month for Specified Date in Telerik Reporting
description: Learn how to retrieve the last day of the month for a specified date parameter in Progress® Telerik® Reporting.
type: troubleshooting
page_title: Formula to Get Last Day of Month Using Date Parameter in Telerik Reporting
meta_title: Formula to Get Last Day of Month Using Date Parameter in Telerik Reporting
slug: retrieve-last-day-of-month-telerik-reporting
tags: reporting, datetime, parameters, formula, expressions
res_type: kb
ticketid: 1690706
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
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

I need a formula to retrieve the last day of the month for a specified date parameter in Progress® Telerik® Reporting. For example, if I pass in a parameter with a date like `"2025-06-17"`, the formula should produce the date `"2025-06-30"`.

## Cause

The need arises for calculating the last day of the month dynamically based on a parameter value provided by the user.

## Solution

To calculate the last day of the month for a specified date parameter (`Parameter1`), use the following formula:

```plaintext
= Parameters.Parameter1.Value.AddDays(CDbl(1 - Parameters.Parameter1.Value.Day)).AddMonths(0).AddMonths(1).AddDays(CDbl(-1))
```

### Explanation:
1. Replace `Today()` with your parameter value, such as `Parameters.Parameter1.Value`, in the formula.
2. The formula calculates the first day of the next month and subtracts one day to get the last day of the current month.

### Example:
Suppose the parameter `Parameter1` has a value of `"2025-06-17"`. The formula will produce `"2025-06-30"`. 

Refer to the official documentation on [Date and Time Functions](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/date-and-time-functions) for additional details on DateTime functions.

## See Also

- [Date and Time Functions - Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/date-and-time-functions)
- [Parameters in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/parameters)
