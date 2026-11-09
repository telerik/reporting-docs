---
title: Resolving Invalid License Watermark When Using Telerik Reporting in Website Projects
description: "Resolve invalid license watermarks in ASP.NET Website projects by adding the Telerik licensing assembly and script key to App_Code."
type: how-to
page_title: Fixing Invalid License Watermark in Website Projects
meta_title: Fixing Invalid License Watermark in Website Projects
slug: aspnet-webforms-website-resolving-invalid-license-watermark
tags: licensing, reporting, license-key, watermark, aspnet, webforms, telerik-reporting
res_type: kb
ticketid: 1704846
---
<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

## Environment

| Property | Value |
|---|---|
| Area | Licensing |
| Version | 19.0.25.211+ |

## Description

An older ASP.NET Website project uses Telerik Reporting to generate reports. Despite following all licensing documentation, downloading the license key, using NuGet packages, and VB script files, the reports display an invalid license watermark.

Other Telerik controls, such as grids, work without issues. Re-running the Reporting Upgrade Wizard completes without errors, and all files in the `bin` directory are updated to the latest versions.

## Solution

To resolve the invalid license watermark issue:

1. In the Website project, add a reference to the `Telerik.Licensing.Runtime.dll` assembly. A copy is available in the **Bin** subfolder of the Telerik Reporting installation directory (for example, `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Bin`).
1. Navigate to the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your **Telerik** account.
1. Scroll down the page until you reach the Progress® Telerik® Reporting product. Open and copy the **Script key**.
1. Add a `TelerikLicense.vb` or `TelerikLicense.cs` file to your project with the content of the copied **Script key**. Place this file in the **App_Code** folder.

	The following image shows the location of the `TelerikLicense.vb` or `TelerikLicense.cs` file in the **App_Code** folder.

	![Location of the TelerikLicense.vb or TelerikLicense.cs file in the App_Code folder](images/TelerikLicenseFile.png)

1. Rebuild the project and run it again to verify that the license has been applied correctly.

## Notes

Verify that the script key includes all purchased Telerik licenses. If other Telerik products are used in the project, add their **Script keys** to the same `TelerikLicense.vb` or `TelerikLicense.cs` file.

If issues persist, refer to the [article about resolving invalid Telerik Reporting license errors]({%slug resolving-invalid-license-telerik-reporting%}).

## See Also

* [Resolving invalid Telerik Reporting license errors]({%slug resolving-invalid-license-telerik-reporting%})
* [Adding license keys to projects without NuGet references]({%slug license-key%})
* [Telerik Reporting overview]({%slug telerikreporting/welcome-to-telerik-reporting!%})
