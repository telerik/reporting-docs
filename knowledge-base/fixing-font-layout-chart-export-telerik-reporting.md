---
title: Resolving Font and Style Differences in Chart Exports to PPTX and Excel
description: Learn how to address font and layout issues for charts exported from Telerik Reporting to PPTX and Excel.
type: how-to
page_title: Fixing Font and Layout Issues for Chart Exports in Telerik Reporting
meta_title: Fixing Font and Layout Issues for Chart Exports in Telerik Reporting
slug: fixing-font-layout-chart-export-telerik-reporting
tags: reporting, charts, export, pptx, excel, font, layout
res_type: kb
ticketid: 1693248
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

When exporting charts from Telerik Reporting to PPTX or Excel, the font and layout differ from the browser view and PDF exports. The font changes, and additional space is rendered in the exported files. The issue is isolated to Graph items, while Table items export correctly. The reports are generated in Visual Studio (.cs format) using the Calibri font.

This knowledge base article also answers the following questions:
- How to fix font differences in PPTX exports for Telerik Reporting?
- Why does additional space appear in exported Excel charts from Telerik Reporting?
- How to ensure consistent chart styles across export formats in Telerik Reporting?

## Solution

To resolve font and layout differences in chart exports:

1. **Ensure Font Availability on Target Systems**:
   - PPTX and Excel rely on the target system to have the specified fonts (e.g., Calibri) installed. If the font is unavailable, a fallback font is used.
   - Verify that Calibri is installed on the machine where the exported files are opened. For more details, refer to [Fonts Requirements](https://docs.telerik.com/reporting/rendering-fonts-in-reports).

2. **Embed Fonts in PPTX Files**:
   - Open the generated PPTX file on a machine with the Calibri font.
   - Use the "Save As" option. In the dialog, expand the "Tools" button, select "Save Options," and enable "Embed fonts in the file."

3. **Check for Overriding Styles**:
   - Review the report definition (`report.designer.cs`) and any external stylesheets to ensure no conflicting or default font settings override the intended style for Graph items.
   - Refer to [Styling Reports](https://docs.telerik.com/reporting/styling/styling-reports/exporting-and-reusing-style-sheets) for more information.

4. **Reduce Extra Space in Office Exports**:
   - Office formats process layout and padding differently for Graph items, which may cause additional space.
   - Reduce margins, padding, or explicitly set the Graph size in the report definition to minimize extra space.

5. **Verify Server Font Availability**:
   - Ensure Calibri is installed on all servers used for rendering. Certain server environments may lack standard Windows fonts.

## See Also

- [Fonts Requirements](https://docs.telerik.com/reporting/rendering-fonts-in-reports)
- [Styling Reports](https://docs.telerik.com/reporting/styling/styling-reports/exporting-and-reusing-style-sheets)
- [Text Truncated after Exporting to PowerPoint](https://www.onepager.com/support/faq.php?id=104) 
- [Telerik Reporting Overview](https://docs.telerik.com/reporting/overview)
- [Graph Item API Reference](https://docs.telerik.com/reporting/api/telerik.reporting.graph)
---
