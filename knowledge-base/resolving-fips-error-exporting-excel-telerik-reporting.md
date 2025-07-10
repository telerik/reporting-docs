---
title: Resolving "This Implementation Is Not Part of the Windows Platform FIPS Validated Cryptographic Algorithms" Error When Exporting to Excel
description: Learn how to resolve the error encountered when exporting reports to Excel in Telerik Reporting with FIPS mode enabled.
type: how-to
page_title: Fixing FIPS Error When Exporting Reports to Excel in Telerik Reporting
meta_title: Fixing FIPS Error When Exporting Reports to Excel in Telerik Reporting
slug: resolving-fips-error-exporting-excel-telerik-reporting
tags: fips,error,excel,telerik-reporting,export,xlsx,xls
res_type: kb
ticketid: 1692320
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Progress® Telerik® Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.0.25.313 </td>
</tr>
</tbody>
</table>

## Description

I encounter the error message "This implementation is not part of the Windows Platform FIPS validated cryptographic algorithms" when exporting reports to Excel in Telerik Reporting. This issue arises in environments where FIPS mode is enabled, and the Excel 97-2003 (XLS) export renderer uses cryptographic algorithms that are not FIPS-compliant. Modifying Windows Registry entries or disabling FIPS is not feasible due to company policies.

This knowledge base article also answers the following questions:
- How to fix FIPS-related issues with Excel export in Telerik Reporting?
- Why does Excel 97-2003 export fail in FIPS-enabled environments?
- How to switch from XLS to XLSX format in Telerik Reporting?

## Solution

To resolve the issue, switch to the XLSX format for exporting reports. The XLSX renderer does not rely on the same cryptographic routines as the XLS renderer and is fully compatible with FIPS-enabled environments. Follow these steps:

1. Install the required dependencies for OpenXML formats (DOCX, XLSX, PPTX). Refer to the [OpenXML and XPS options missing](https://docs.telerik.com/reporting/knowledge-base/missing-docx-xlsx-pptx-xps-export-options?_gl=1*d3g6i8*_gcl_au*MTMxNTczNjkyMy4xNzUxOTY5MTM4*_ga*MTYwMTU2MjA5LjE3NTE5NjkxMzc.*_ga_9JSNBCSF54*czE3NTE5NTc0NDUkbzMkZzEkdDE3NTE5NzI5MjgkajE0JGwwJGgw) article for instructions on enabling OpenXML formats.

2. Configure the report export settings to use XLSX instead of XLS. Update the renderer settings to prioritize XLSX export.

3. Test the export functionality to ensure reports are successfully exported in the XLSX format without triggering FIPS-related errors.

## See Also

- [Excel Rendering Design Considerations](https://docs.telerik.com/reporting/styling/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations#excel-97-2003)
- [OpenXML and XPS Options Not Visible](https://docs.telerik.com/reporting/knowledge-base/missing-docx-xlsx-pptx-xps-export-options?_gl=1*d3g6i8*_gcl_au*MTMxNTczNjkyMy4xNzUxOTY5MTM4*_ga*MTYwMTU2MjA5LjE3NTE5NjkxMzc.*_ga_9JSNBCSF54*czE3NTE5NTc0NDUkbzMkZzEkdDE3NTE5NzI5MjgkajE0JGwwJGgw)
- [Telerik Reporting Overview](https://docs.telerik.com/reporting/)
