---
title: Embedding Telerik Reporting License to Remove Watermark from PDF Files in ASP.NET WebForms Websites
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

## Solution

To resolve the invalid license watermark issue in Telerik Reporting PDF files:

1. Ensure the Telerik Reporting license is correctly embedded in the backend/server project during build time. Refer to the [Adding a License Key to Projects without NuGet References]({%slug license-key%}) section.

1. Add a `TelerikLicense.vb` file to your project. For ASP.NET WebForms Website projects, place the `TelerikLicense.vb` file in the `App_Code` folder.

1. Use the `EvidenceAttribute` for each Telerik product requiring licensing. Add the Reporting script key downloaded from your [Telerik account's License Keys page](https://www.telerik.com/account/your-licenses/license-keys).

1. Verify that the license key includes all purchased Telerik licenses. Use the Telerik.Licensing NuGet package and provide the license key either through an environmental variable or the `telerik-license.txt` file.

1. Rebuild the project and test generating a PDF file to confirm the license watermark is removed.

## See Also

* [Fixing License Errors in Telerik Reporting Runtime]({%slug resolving-invalid-license-telerik-reporting%})
* [Adding a License Key to Projects without NuGet References]({%slug license-key%})
* [Telerik Reporting Overview]({%slug telerikreporting/welcome-to-telerik-reporting!%})
