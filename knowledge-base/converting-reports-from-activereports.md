---
title: Converting from ActiveReports
description: "Learn how to convert ActiveReports into Telerik Reporting reports with the built-in converter."
type: how-to
page_title: Converting Report Definitions from ActiveReports to Telerik Reporting
slug: converting-reports-from-activereports
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Designer</td>
		<td>Visual Studio/Standalone Report Designer</td>
	</tr>
</table>

## Description

Telerik Reporting includes a built-in converter that allows you to import existing ActiveReports report definitions. The converter is built against `ActiveReports3` (build `5.2.1013.2`).

> The converter is only compatible with `ActiveReports3`.

If you are using a version of ActiveReports newer than `5.2.1013.2`, you will need to add a binding redirect to your configuration file to enable the converter to work properly. This is explained in the Solution section below.

## Solution

### Step 1: Check Your ActiveReports Version

Before starting the conversion, determine which version of ActiveReports you have installed. Examine the [`Global Assembly Cache`](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac) at `C:\WINDOWS\assembly`.

### Step 2: Add a Binding Redirect (if needed)

If your ActiveReports version is newer than `5.2.1013.2` (the version the converter was built against), you need to add a binding redirect to your configuration file.

To do this, open the configuration file for your designer and add or modify the `<runtime>` section:

Configuration file locations:
- Visual Studio 2019: `C:\Program Files\Microsoft Visual Studio\2019\<Edition>\Common7\IDE\devenv.exe.config`
- Visual Studio 2022: `C:\Program Files\Microsoft Visual Studio\2022\<Edition>\Common7\IDE\devenv.exe.config`
- Visual Studio 2026: `C:\Program Files\Microsoft Visual Studio\2026\<Edition>\Common7\IDE\devenv.exe.config`
- Standalone Report Designer: `C:\Program Files (x86)\Progress\Telerik Reporting <Version>\Report Designer\Telerik.ReportDesigner.exe.config`

(For Visual Studio, replace `<Edition>` with `Community`, `Professional`, or `Enterprise`. For Standalone Report Designer, replace `<Version>` with your Telerik Reporting release, for example, `2025 Q4`.)

Add or modify the `<runtime>` section to include these binding redirects:

````XML
<runtime>
	<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
		<dependentAssembly>
			<assemblyIdentity name="ActiveReports3" publicKeyToken="cc4967777c49a3ff" culture="neutral" />
			<bindingRedirect newVersion="x.x.x.x" oldVersion="5.2.1013.2" />
		</dependentAssembly>
		<dependentAssembly>
			<assemblyIdentity name="ActiveReports.Viewer3" publicKeyToken="cc4967777c49a3ff" culture="neutral" />
			<bindingRedirect newVersion="x.x.x.x" oldVersion="5.2.1013.2" />
		</dependentAssembly>
	</assemblyBinding>
</runtime>
````

Here, replace `newVersion` with the ActiveReports version you found in [step 1](#step-1-check-your-activereports-version).

Then, save the configuration file and restart your report designer.

### Step 3: Convert Your ActiveReports

Use the [Import Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/import-report-wizard%}) and select **ActiveReports** from the list of available converters to start the converter.

> "ActiveReports" is a trademark of **Data Dynamics**.
