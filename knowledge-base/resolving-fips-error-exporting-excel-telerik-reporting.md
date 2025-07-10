---
title: Resolving "This Implementation Is Not Part of the Windows Platform FIPS Validated Cryptographic Algorithms" Error When Exporting to Excel
description: Learn how to resolve the error encountered when exporting reports to Excel with FIPS mode enabled.
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

When exporting reports to Excel, the error message `'This implementation is not part of the Windows Platform FIPS validated cryptographic algorithms'` may appear. This issue occurs in environments with FIPS mode enabled, as the Excel 97-2003 (XLS) export renderer utilizes cryptographic algorithms that are not FIPS-compliant. Due to company policies, modifying Windows Registry entries or disabling FIPS is not an option.

## Solution

To resolve the issue, switch to the XLSX format for exporting reports. The XLSX renderer does not rely on the same cryptographic routines as the XLS renderer and is fully compatible with FIPS-enabled environments. Follow these steps:

1. Install the required dependencies for OpenXML formats (DOCX, XLSX, PPTX). Refer to the [OpenXML and XPS options missing]({%slug missing-docx-xlsx-pptx-xps-export-options%}) article for instructions on enabling OpenXML formats.

1. Configure the report export settings to use XLSX instead of XLS. Update the renderer settings to prioritize XLSX export.

1. Test the export functionality to ensure reports are successfully exported in the XLSX format without triggering FIPS-related errors.

## See Also

* [Excel Rendering Design Considerations]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations%})
* [OpenXML and XPS Options Not Visible]({%slug missing-docx-xlsx-pptx-xps-export-options%})
