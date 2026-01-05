---
title: Resolving Invalid License Watermark When Using Telerik Reporting in Website Projects
description: "Learn how to resolve the invalid license watermark issue when using Telerik Reporting in Website projects, even after following licensing steps such as downloading the license key, using NuGet packages, and VB/CS script files."
type: how-to
page_title: Fixing Invalid License Watermark in Website Projects
meta_title: Fixing Invalid License Watermark in Website Projects
slug: resolving-invalid-license-watermark-telerik-reporting
tags: licensing, reporting, license-key, watermark, telerik-reporting
res_type: kb
ticketid: 1704846
---
<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

## Environment

<table>
	<tbody>
		<tr>
			<td> Area </td>
			<td> Licensing </td>
		</tr>
		<tr>
			<td> Version </td>
			<td> 19.0.25.211+ </td>
		</tr>
	</tbody>
</table>

## Description

I have an older ASP.NET Website project that uses Telerik Reporting to generate reports. Despite following all licensing documentation, downloading the license key, using NuGet packages, and VB script files, the reports display an invalid license watermark. 

Other Telerik controls, such as grids, work without issues. Re-running the Reporting Upgrade Wizard completes without errors, and all files in the bin directory are updated to the latest versions.

## Solution

To resolve the invalid license watermark issue:

1. In the Website project, add a reference to the `Telerik.Licensing.Runtime.dll` assembly. A copy of it can be found in the **Bin** subfolder of the Telerik Reporting installation directory(e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Bin`).
1. Navigate to the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your **Telerik** account.
1. Scroll down the page until you reach the Progress® Telerik® Reporting product. Open and copy the **Script key**.
1. Add a `TelerikLicense.vb`/`TelerikLicense.cs` file to your project with the content of the copied **Script key**. This file must be placed in the **App_Code** folder.

	![The TelerikLicense.vb/Telerik.License.cs file's location in the Website project><](images/TelerikLicenseFile.png)

	> The image shows where the **TelerikLicense** file (`TelerikLicense.vb` or `TelerikLicense.cs`) should be located in the Website project.

1. Rebuild the project and run it again to verify that the license has been applied correctly.

## Notes

Please verify that the script key includes all purchased Telerik licenses. If other Telerik products are used in the project, their **Script keys** must also be added to the same `TelerikLicense.vb`/`TelerikLicense.cs` file.

If there are further issues, please refer to the [Fixing License Errors in Telerik Reporting Runtime]({%slug resolving-invalid-license-telerik-reporting%}) article.

## See Also

* [Fixing License Errors in Telerik Reporting Runtime]({%slug resolving-invalid-license-telerik-reporting%})
* [Adding a License Key to Projects without NuGet References]({%slug license-key%})
* [Telerik Reporting Overview]({%slug telerikreporting/welcome-to-telerik-reporting!%})
