---
title: Converting .cs Reports to .trdp Format in Telerik Reporting
description: Learn how to transition from .cs report files to the .trdp format in Telerik Reporting, enabling easier report management and distribution.
type: how-to
page_title: How to Convert CSharp Report Files to TRDP Format in Telerik Reporting
slug: convert-cs-reports-to-trdp-telerik-reporting
tags: reporting, convert, import, trdp, conversion, objectdatasource
res_type: kb
ticketid: 1669949
---

## Environment

| Version | Product | Author |  

| --- | --- | ---- |  

| 18.1.24.514| Telerik Web Report Designer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

A common requirement is to convert Telerik.Reporting.Report objects created with the Visual Studio Report Designer to `.trdp` format for various reasons, such as ease of use or distribution. This KB article also answers the following questions:
- How can I manage .cs reports in the Standalone Report Designer?
- Is it possible to convert code-based reports to the TRDP format?
- What steps should I follow to transition from .cs report files to .trdp in Telerik Reporting?

## Solution

To convert a `.cs` report to a `.trdp` report, use the [Standalone Report Designer](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview). This tool allows for importing `.dll` files produced from projects containing `Telerik.Reporting.Report` objects, facilitating the conversion process.

### Steps for Conversion

1. **Compile the Project**: Ensure your project containing the `.cs` report files is compiled successfully, generating a `.dll` file which includes the `Telerik.Reporting.Report` objects.

2. **Open Standalone Report Designer**: Launch the Telerik Standalone Report Designer.

3. **Import the DLL**: From the Report Designer, select to import reports, and navigate to the `.dll` file produced by your project. The Standalone Report Designer will list all reports available in the `.dll` for import.

4. **Save as TRDP**: After successfully importing the `.cs` reports, save them in the `.trdp` format using the Standalone Report Designer's save functionality.

For more details on importing reports and using the Standalone Report Designer, refer to the documentation on [Importing reports created with the VS Report Designer](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer).

If challenges arise during this process, consider providing a sample runnable project demonstrating the issue for further support.

## See Also

- [Standalone Report Designer Overview](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview)
- [How to Import Reports Created with the VS Report Designer](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer)
