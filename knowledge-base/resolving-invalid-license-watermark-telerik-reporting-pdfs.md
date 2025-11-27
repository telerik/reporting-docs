---
title: Resolving Invalid License Watermark in Telerik Reporting PDF Files
description: Learn how to address the invalid license watermark in Telerik Reporting PDF files despite following licensing documentation and using NuGet packages and VB script files.
type: how-to
page_title: Fixing Invalid License Watermark in Telerik Reporting Output
meta_title: Fixing Invalid License Watermark in Telerik Reporting Output
slug: resolving-invalid-license-watermark-telerik-reporting-pdfs
tags: licensing, reporting, license-key, watermark, telerik-reporting
res_type: kb
ticketid: 1704846
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td>
Licensing/Reporting
</td>
</tr>
<tr>
<td> Version </td>
<td> 
19.3.25.1111
</td>
</tr>
</tbody>
</table>

## Description

I have an older ASP.NET web application using Telerik Reporting to generate PDF files. Despite following all licensing documentation, including downloading the license key, using NuGet packages, and VB script files, the PDFs display an invalid license watermark. Grids and other controls in the application work without issues. Re-running the Reporting Upgrade Wizard completes without errors, and all files in the bin directory are updated to the latest versions.

This knowledge base article also answers the following questions:
- Why do Telerik Reporting PDFs show an invalid license watermark?
- How do I correctly apply a Telerik Reporting license key in an ASP.NET WebForms website?
- What steps resolve license issues in Telerik Reporting runtime?

## Solution

To resolve the invalid license watermark issue in Telerik Reporting PDF files:

1. Ensure the Telerik Reporting license is correctly embedded in the backend/server project during build time. Refer to the [Adding a License Key to Projects without NuGet References](https://docs.telerik.com/reporting/licensing/setting-up-your-telerik-reporting-license-key#adding-a-license-key-to-projects-without-nuget-references) section.

2. Add a `TelerikLicense.vb` file to your project. For ASP.NET WebForms Website projects, place the `TelerikLicense.vb` file in the `App_Code` folder.

3. Use the `EvidenceAttribute` for each Telerik product requiring licensing. Add the Reporting script key downloaded from your [Telerik account's License Keys page](https://www.telerik.com/account/your-licenses/license-keys). For example:

```vb
Imports Telerik.Reporting
Imports System.Reflection

<Assembly: Evidence("REPORTING", "YOUR_REPORTING_LICENSE_KEY")>
```

4. Verify that the license key includes all purchased Telerik licenses. Use the Telerik.Licensing NuGet package and provide the license key either through an environmental variable or the `telerik-license.txt` file.

5. Rebuild the project and test generating a PDF file to confirm the license watermark is removed.

## See Also

- [Fixing License Errors in Telerik Reporting Runtime](https://docs.telerik.com/reporting/knowledge-base/resolving-invalid-license-runtime-telerik-reporting?_gl=1*1hcg8n2*_gcl_au*MTU4NjM3Mzg5MS4xNzUwMzI4MTUx*_ga*OTM5MDM4NDA4LjE3NTAzMjgxNTA.*_ga_9JSNBCSF54*czE3NTA0MDA3NjgkbzUkZzEkdDE3NTA0MjU2MjkkajExJGwwJGgw)
- [Adding a License Key to Projects without NuGet References](https://docs.telerik.com/reporting/licensing/setting-up-your-telerik-reporting-license-key#adding-a-license-key-to-projects-without-nuget-references)
- [Telerik Reporting Overview](https://docs.telerik.com/reporting/overview)
