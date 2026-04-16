---
title: Retrieving Previous Record in Detail Section
description: Learn how to retrieve the previous record in the detail section of a Telerik Reporting report.
type: how-to
page_title: Accessing Previous Record in Detail Section of Telerik Reporting
meta_title: Accessing Previous Record in Detail Section of Telerik Reporting
slug: accessing-previous-record-in-detail-section-telerik-reporting
tags: reporting, detail-section, previous, exec, isnull, expressions
res_type: kb
ticketid: 1710935
---

## Description

I want to display the previous record in the detail section of my Telerik Reporting report. Using the Previous function directly in the detail section does not allow retrieving the previous group's value, because the function requires an explicit scope to be evaluated. I need this functionality to manipulate the data starting from the second record.

## Solution

To achieve this functionality, use the `Previous` function. It allows retrieving values from the previous record or group within the detail section by specifying the appropriate scope.

1. Use the following expression to get the previous group's value:

   ```
   = Previous("group", Fields.Column1)
   ```

   Replace `"group"` with the name of your group and `Fields.Column1` with the field you want to retrieve.

3. To avoid displaying an empty value for the first record, use the `IsNull` function. This ensures a default value, such as `0`, is shown for the first record:

   ```
   = IsNull(Previous("group", Fields.Column1),0)
   ```

### Notes
* Ensure the group name passed as the scope argument to the `Previous` function matches your report design.

## Sample Report

* [PreviousRecord.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/PreviousRecord.trdx)

## See Also

* [Previous and Exec functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%})
* [IsNull function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/conditional-functions%})
* [Expressions in Telerik Reporting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
