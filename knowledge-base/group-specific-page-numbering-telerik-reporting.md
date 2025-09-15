---
title: Numbering Pages Based on Group Scope
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
   </tbody>
</table>

## Description

I need page numbering based on a specific group using Standalone Designer. Instead of absolute page numbers, I want the numbering to reset within each group. For example, if there are two pages per group, the numbering should appear as "Page 1 of 2" and "Page 2 of 2" for the first group, then reset to "Page 1 of 2" for the next group. This numbering should reflect the pages within the group scope.

## Solution

To implement group-specific page numbering, follow these steps:

### Using Built-in Page Functions

1. Open the report in the Standalone Designer.
1. Define a group for the desired field (e.g., `ResidentID`) at the report level if not already done.
1. Add a TextBox to the page footer.
1. Use the following expression to display page numbering within the group:

   `= "Page " + PageNumber("residentGroup", Fields.ResidentID) + " of " + PageCount("residentGroup", Fields.ResidentID)`
   
   - Replace `"residentGroup"` with your group's name.
   - Replace `Fields.ResidentID` with the key field of the group.
 
1. Assign the data source directly to the report to ensure the group scope functions correctly.

## See Also

* [Page Functions Explained - Telerik Reporting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%})
* [Grouping Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%}) 
* [Adding Groups to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})
