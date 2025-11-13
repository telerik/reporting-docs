---
title: Adjusting Textbox Spacing and Layout in Telerik Reporting
description: Resolve issues with textbox spacing and layout discrepancies between the report designer and viewer in Telerik Reporting.
type: how-to
page_title: Fixing Textbox Alignment and Space Discrepancy in Telerik Reporting
meta_title: Fixing Textbox Alignment and Space Discrepancy in Telerik Reporting
slug: adjusting-textbox-spacing-layout-telerik-reporting
tags: reporting, textbox, layout, alignment, font-size, designer, viewer
res_type: kb
ticketid: 1702612
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
<td> 19.2.25.924 </td>
</tr>
</tbody>
</table>

## Description

I noticed discrepancies between the Telerik Reporting designer and viewer where the textbox spacing and alignment do not match. The issue often arises due to the textbox expanding when using large font sizes, causing layout shifts. Additionally, the report designer may show blank spaces at the bottom of the report that do not appear in the viewer or printed label.

This knowledge base article also answers the following questions:
- Why does the report preview look different from the designer layout?
- How can I fix textbox alignment issues in Telerik Reporting?
- Why does blank space disappear in the report preview or printed label?

## Solution

To resolve the layout discrepancies, follow these steps:

1. Reduce the font size of the affected textboxes. Large font sizes, such as 20pt, cause the textbox to grow, pushing other elements downward. Use a smaller font like 14pt to prevent this.
2. Avoid overlapping textboxes in the designer. Overlapping can cause unpredictable alignment in the report preview.
3. Check the paper size and page settings. Ensure the dimensions match the intended label size (e.g., 63x38).
4. Ensure that the layout elements fit within the page boundaries. Move any element positioned at the bottom carefully to avoid triggering a new page. If a textbox moves to a new page when adjusted, verify the report's margins and page size.

Example of reducing font size in the report file:

```xml
<TextBox Name="Item1">
    <Text Style="FontSize: 14pt">1</Text>
</TextBox>
```

## See Also

- [Telerik Reporting Documentation](https://docs.telerik.com/reporting)  
- [Understanding Report Layouts and Page Settings](https://docs.telerik.com/reporting/designing-reports-page-settings)  
- [Common Report Design Issues](https://docs.telerik.com/reporting/troubleshooting-layout-issues)  
