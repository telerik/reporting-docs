---
title: Numbering Pages Based on Group Scope in Telerik Reporting
description: Learn how to configure page numbering within groups in Telerik Reporting to display relative page numbers for each group.
type: how-to
page_title: Group-Specific Page Numbering in Telerik Reporting
meta_title: Group-Specific Page Numbering in Telerik Reporting
slug: group-specific-page-numbering-telerik-reporting
tags: reporting, page numbering, groups, page functions, telerik reporting
res_type: kb
ticketid: 1698535
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.521 </td>
</tr>
</tbody>
</table>

## Description

I need page numbering based on a specific group in Telerik Reporting. Instead of absolute page numbers, I want the numbering to reset within each group. For example, if there are two pages per group, the numbering should appear as "Page 1 of 2" and "Page 2 of 2" for the first group, then reset to "Page 1 of 2" for the next group. This numbering should reflect the pages within the group scope.

This knowledge base article also answers the following questions:
- How to reset page numbers within each group in Telerik Reporting?
- How to use PageNumber and PageCount functions with group scope?
- How to implement group-specific page numbering in a report?

## Solution

To implement group-specific page numbering, follow these steps:

### Using Built-in Page Functions
1. Open the report in the Telerik Reporting Designer.
2. Define a group for the desired field (e.g., `ResidentID`) at the report level if not already done. Ensure the grouping is applied directly on the report, not inside a list item.
3. Add a TextBox to the page footer.
4. Use the following expression to display page numbering within the group:
   ```
   ="Page " + PageNumber("residentGroup", Fields.ResidentID) + " of " + PageCount("residentGroup", Fields.ResidentID)
   ```
   - Replace `"residentGroup"` with your group's name.
   - Replace `Fields.ResidentID` with the key field of the group.
5. Assign the data source directly to the report to ensure the group scope functions correctly.

### Using a Custom Function
If the built-in functions do not meet your requirements, you can create a custom user function:
1. Create a static class with a method to track page numbers per group.
2. For example:
   ```csharp
   public static class PageHelper
   {
       private static Dictionary<string, int> groupPageNumbers = new Dictionary<string, int>();

       public static string MyPageNumber(string groupKey, int currentPage)
       {
           if (!groupPageNumbers.ContainsKey(groupKey))
           {
               groupPageNumbers[groupKey] = 1;
           }
           else
           {
               groupPageNumbers[groupKey]++;
           }

           return $"Page {groupPageNumbers[groupKey]}";
       }
   }
   ```
3. Register the custom assembly in the Telerik Reporting Designer.
4. Use the custom function in the page footer, passing the group identifier and the current page number.

### Adjusting the Report Layout
Ensure that the group is defined at the report level rather than inside a list item. This allows page functions to work correctly within the intended group scope.

### Sample Report
Refer to the provided sample report for an implementation where the data source is directly assigned to the report, and the group is created at the report level.

## See Also

- [Page Functions Explained - Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions)
- [Grouping Data in Reports](https://docs.telerik.com/reporting/designing-reports/organizing-data/grouping-data) 
- [Custom Functions in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/expressing-data/custom-functions)


