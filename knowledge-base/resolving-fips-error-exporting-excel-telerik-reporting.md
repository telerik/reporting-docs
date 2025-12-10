---
title: FIPS Implementation Error When Exporting to Excel(XLS)
description: "Learn how to resolve the error encountered when exporting reports to Excel(97-2003) with FIPS mode enabled."
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
            <td> Rendering Format </td>
            <td> Excel 97-2003(XLS) </td>
        </tr>
    </tbody>
</table>

## Description

When exporting reports to Excel 97-2003(XLS), the error message `'This implementation is not part of the Windows Platform FIPS validated cryptographic algorithms'` may appear. This issue occurs in environments with `FIPS` mode enabled, as the Excel 97-2003(XLS) export renderer utilizes cryptographic algorithms that are not FIPS-compliant. 

## Solution

To resolve the issue, render the reports into the Excel 2007(XLSX) format instead. The `XLSX` renderer does not rely on the same cryptographic routines as the `XLS` renderer and is fully compatible with **FIPS-enabled environments**. Follow these steps to enable the `XLSX` export format in your application:

1. Install the required dependencies for **OpenXML** formats (DOCX, XLSX, PPTX). Refer to the [OpenXML and XPS options missing]({%slug missing-docx-xlsx-pptx-xps-export-options%}) article for instructions on enabling **OpenXML** formats.
1. (*Optional*) Configure the report export settings to hide the **XLS** format through the [extension element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}) so that users cannot trigger an export in that format.

    ````XML
<configuration>
    <configSections>
        <section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
    </configSections>
    <Telerik.Reporting>
        <extensions>
            <render>
                <extension name="XLS" visible="false">
                </extension>
            </render>
        </extensions>
    </Telerik.Reporting>
</configuration>
````


## See Also

* [Excel Rendering Design Considerations]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations%})
* [OpenXML and XPS Options Not Visible]({%slug missing-docx-xlsx-pptx-xps-export-options%})
