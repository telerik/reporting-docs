---
title: Resolving "Invalid License" Issue during runtime in Telerik Reporting
description: Resolve Telerik Reporting runtime license warnings and watermarks by installing a valid license key and configuring Telerik.Licensing correctly.
type: how-to
page_title: Fixing License Errors in Telerik Reporting Runtime
slug: resolving-invalid-license-telerik-reporting
tags: telerik reporting, license, nuget, runtime, invalid license
res_type: kb
ticketid: 1688629
---

## Environment

| Product | Version |
|---|---|
| Progress® Telerik® Reporting | 2025 Q1 (19.0.25.211) and later |

## Description

Starting with Telerik Reporting 2025 Q1 (19.0.25.211), an invalid or missing license can add a watermark to report pages and produce licensing warnings during build or runtime. A common cause is that the startup project does not directly reference `Telerik.Licensing`, or that the application cannot access a current `telerik-license.txt` file.

## Solution

### General Instructions for .NET and .NET Framework Projects

Use the current [Telerik.Reporting NuGet package](https://www.nuget.org/packages/Telerik.Reporting) whenever possible. It adds the required dependencies, including `Telerik.Licensing`. If automatic activation fails, follow these steps to configure the startup project:

1. Install a valid license key. Follow the [Telerik Reporting license key setup]({%slug license-key%}) instructions. Store `telerik-license.txt` in a location that the application can access, or configure the `TELERIK_LICENSE` environment variable.
1. Identify the startup project. Determine which project serves as the application entry point.
1. Add `Telerik.Licensing`. Add the [Telerik.Licensing NuGet package](https://www.nuget.org/packages/Telerik.Licensing) directly to the startup project. You can use the NuGet Package Manager or the Package Manager Console.

   Use the following command in the Package Manager Console:

   ````powershell
   Install-Package Telerik.Licensing
   ````

1. Clean and rebuild the solution. Perform a clean build so the project resolves all dependencies.
1. Test the application. Run the application and verify that report pages no longer contain a licensing watermark and that the build and runtime logs contain no licensing warnings.

### .NET Framework-Specific Instructions

For .NET Framework startup projects that do not use the [SDK-style project](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview) structure, verify that the project references at least one Telerik Reporting NuGet package or assembly.

If the startup project references only other projects that contain the reporting code, the licensing build task might not detect Telerik Reporting usage. In that case, add the `Telerik.Licensing` package and `Telerik.Reporting.dll` reference to the startup project.

If the project uses a binding redirect, add one to the startup project's `App.config` or `Web.config`. Replace the placeholder versions with the version of the installed `Telerik.Licensing.Runtime` assembly:

````xml
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Telerik.Licensing.Runtime" publicKeyToken="98bb5b04e55c09ef" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-X.Y.Z.0" newVersion="X.Y.Z.0" />
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
````

If the issue persists, review the [Telerik Reporting license activation errors and warnings]({%slug license-errors-and-warnings%}) and [runtime licensing troubleshooting guidance]({%slug license-troubleshoot%}).

## See Also

* [Telerik Reporting license key setup]({%slug license-key%})
* [Telerik Reporting license activation errors and warnings]({%slug license-errors-and-warnings%})
* [Runtime licensing troubleshooting guidance]({%slug license-troubleshoot%})
* [SDK-style project documentation](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview)
