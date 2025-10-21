---
title: Troubleshooting
page_title: "Learn how to Troubleshoot problems with Licensing in Telerik Reporting."
description: "Learn about Troubleshooting License problems in Telerik Reporting after the 2025 Q1 (19.0.25.211) release."
slug: license-troubleshoot
tags: license, telerik, reporting, problems, troubleshoot
published: True
position: 8
---

# Troubleshoot License Problems

In rare scenarios clients keep getting Licensing watermarks in some environments, while when build the project everything has been verified to work correctly:

 - There is a proper `telerik-license.txt` file.
 - Build logs show our product has been detected.
 - At runtime the Report Viewers still show a Licensing watermark.

## Telerik Licensing Diagnostics

Starting with __Telerik.Licensing__ version 1.6.24, we provide a utility that does runtime diagnostics.


1. Install Telerik.Licensing library 1.6.24 or later from NuGet. We recommend the latest version of the package.

	>If your project targets the `.NET Framework` you may need to add a BindingRedirect to your configuration file. If you use a newer version, change the code accordingly:
	>
	>````XML
<dependentAssembly>
	<assemblyIdentity name="Telerik.Licensing.Runtime" publicKeyToken="98BB5B04E55C09EF" culture="neutral"/>
	<bindingRedirect oldVersion="0.0.0.0-1.6.24.0" newVersion="1.6.24.0"/>
</dependentAssembly>
````


1. To enable the runtime diagnostics, please add the following line of code as early as possible before loading your Telerik Report Viewers:

	````CSharp
Telerik.Licensing.TelerikLicensing.EnableDiagnostics();
````

	For example, you may add the code in the startup file of the project. In ASP.NET projects, you may use the `Application_Start` event handler in the `Global.asax` file.
	
1. (_optional_) If you make a call to the method `TelerikLicensing.Register()`, do this after enabling diagnostics with the above code line.
1. Load a page with Telerik Report Viewer, then collect the content of the aggregated licensing log in Telerik.Licensing.TelerikLicensing.Diagnostics.

## See Also

* [License Activation Errors and Warnings]({%slug license-errors-and-warnings%})
* [Setting Up Your License Key]({%slug license-key%})
* [Frequently Asked Questions about Your Telerik Reporting License Key]({%slug license-frequently-asked-questions%})
* [Adding the License Key to CI Services]({%slug license-key-ci-services%})
* [License Agreement](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)
