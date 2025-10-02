---
title: Resolving Font and Style Differences in Graph Charts Exported to PPTX and XLSX
description: Learn how to address font and layout issues for charts exported from Telerik Reporting to PowerPoint and Excel.
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
   </tbody>
</table>

## Description

When exporting charts from Telerik Reporting to PPTX or Excel, the font and layout differ from the browser view and PDF exports. The font changes, and additional space is rendered in the exported files. The issue is isolated to Graph items, while Table items export correctly. The reports are generated in Visual Studio (.cs format) using the Calibri font.

## Solution

To resolve font and layout differences in chart exports:

1. **Ensure Font Availability on Target Systems**:
   * The OpenXML formats (PPTX, XLSX, and DOCX) rely on the target system to have the specified fonts (e.g., Calibri) installed. If the font is unavailable, a fallback font is used.
   * Verify that Calibri is installed on the machine where the exported files are opened. For more details, refer to [Fonts Requirements]({%slug telerikreporting/designing-reports/rendering-and-paging/fonts-requirements%}).

1. **Embed Fonts in PPTX Files**:
   * Open the generated PPTX file on a machine with the Calibri font.
   * Use the "Save As" option. In the dialog, expand the "Tools" button, select "Save Options," and enable "Embed fonts in the file."

1. **Check for Overriding Styles**:
   * Review the report definition (`report.designer.cs`) and any external stylesheets to ensure no conflicting or default font settings override the intended style for Graph items.
   * Refer to [Styling Reports]({%slug telerikreporting/designing-reports/styling-reports/exporting-and-reusing-style-sheets%}) for more information.

1. **Reduce Extra Space in Office Exports**:
   * Office formats process layout and padding differently for Graph items, which may cause additional space.
   * Reduce margins, padding, or explicitly set the Graph size in the report definition to minimize extra space.

1. **Verify Server Font Availability**:
   * Ensure Calibri is installed on all servers used for rendering. Certain server environments may lack standard Windows fonts.

## See Also

* [Text Truncated after Exporting to PowerPoint](https://www.onepager.com/support/faq.php?id=104) 
* [Telerik Reporting Overview]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [Graph Item API Reference](/api/telerik.reporting.graph)
