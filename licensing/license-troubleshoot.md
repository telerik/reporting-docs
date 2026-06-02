---
title: Troubleshooting
page_title: "Learn how to troubleshoot problems with Licensing in Telerik Reporting."
description: "Learn about Troubleshooting License problems in Telerik Reporting after the 2025 Q1 (19.0.25.211) release."
slug: license-troubleshoot
tags: license, telerik, reporting, problems, troubleshoot
tag: updated
published: True
position: 8
reportingArea: General
---

# Troubleshoot License Problems

In rare scenarios, clients keep getting Licensing watermarks in some environments, while when building the project, everything has been verified to work correctly:

- There is a proper `telerik-license.txt` file.
- Build logs show our product has been detected.
- At runtime, the Report Viewers still show a Licensing watermark.

## Telerik Licensing Diagnostics

### Build Diagnostics

Use the `TelerikLicensingVerbosity` configuration in your project file to enable detailed licensing diagnostics during build. A sample configuration of the proj file is shown below:

{{source=CodeSnippets\MvcCS\XmlConfiguration\LicenseConfiguration.xml region=LicenseConfiguration}}
Here are the possible values for `TelerikLicensingVerbosity`:
* `quiet` / `q` - the lowest verbosity level;
* `verbose` / `v` - the normal/middle verbosity level;
* `diagnostics` / `diagnostic` / `diag` / `d` - the highest verbosity level;

The default value, when not explicitly set, generates logs with verbosity between 'quiet' and 'verbose'.

### Runtime Diagnostics

Starting with **Telerik.Licensing** version 1.6.24, we provide a utility that does runtime diagnostics.

1. Install `Telerik.Licensing` library **1.6.24** or later from [NuGet](https://www.nuget.org/packages/Telerik.Licensing). We recommend the latest version of the package.

	> If your project targets the `.NET Framework`, you may need to add a binding redirect to your configuration file. If you use a newer version, change the code accordingly:
	{{source=CodeSnippets\\MvcCS\\XmlConfiguration\\Troubleshooting.xml region=RuntimeDiagnostics}}

1. To enable the runtime diagnostics, please call the method `Telerik.Licensing.TelerikLicensing.EnableDiagnostics()` as early as possible before loading your Telerik Report Viewers:

	For example, you may add the code in the _startup file_ of the project. In ASP.NET projects, you may use the `Application_Start` event handler in the `Global.asax` file.

	Here is a sample code:

	{{source=CodeSnippets\MvcCS\Global.asax.cs region=Runtime_Diagnostics}}

	The above code will add the Licensing validation logs to the file 'TelerikLicensing.log' in your application's main folder.

1. (_optional_) If you make a call to the method `TelerikLicensing.Register()`, do this after enabling diagnostics with the above code line.
1. Set up the Reporting Engine, then collect the content of the aggregated licensing log in `Telerik.Licensing.TelerikLicensing.Diagnostics`:

	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=Runtime_Diagnostics_2}}

	For example, if you use a Report Viewer with [REST Service in .NET with Minimal API](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api), you can collect the log after creating the [Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview) in the _Program.cs_ file:

	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=Runtime_Diagnostics_3}}

1. Read the Licensing validation logs in the file 'TelerikLicensing.log' in your application's main folder.

## See Also

- [License Activation Errors and Warnings](slug:license-errors-and-warnings)
- [Setting Up Your License Key](slug:license-key)
- [Frequently Asked Questions about Your Telerik Reporting License Key](slug:license-frequently-asked-questions)
- [Adding the License Key to CI Services](slug:license-key-ci-services)
- [License Agreement](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)
