---
title: Adjusting TextBox Spacing and Layout
description: "Learn how to resolve issues with textbox spacing and layout discrepancies between the report designer and viewer."
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
    </tbody>
</table>

## Description

I noticed discrepancies between the Standalone Report Designer and the Report Viewer, where the textbox spacing and alignment do not match. 

The issue often arises due to the textbox expanding when using large font sizes, causing layout shifts. Additionally, the report designer may show blank spaces at the bottom of the report that do not appear in the viewer or printed label.

## Solution

To resolve the layout discrepancies, follow these steps:

1. Check how much space the textbox takes at runtime. You can do that by setting an easily distinguishable background color to the element. If the size grows vertically at runtime and it breaks the pixel-perfect layout, reduce the font size of the affected textbox items. 
1. Avoid overlapping items(such as TextBox items) in the report. Overlapping can cause unpredictable alignment in the report preview.
1. Check the [paper size and page settings]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%}#page-settings). Ensure the dimensions match the intended label size (e.g., 63x38).
1. Ensure that the layout elements fit within the page boundaries. Move any element positioned at the bottom carefully to avoid triggering a new page. If a textbox moves to a new page when adjusted, verify the report's margins and page size.


## See Also

* [Telerik Reporting Documentation]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [Interactive and Print Layouts Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%})  
* [TextBox Report Item Overview]({%slug telerikreporting/designing-reports/report-structure/textbox%})
