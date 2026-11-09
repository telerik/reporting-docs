---
title: Resolving "Invalid License" Issue during runtime in Telerik Reporting
description: Resolve the "Invalid license" message in Telerik Reporting at runtime by referencing the licensing package from the application startup project.
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
| Progress® Telerik® Reporting | 19.1.25.521+ |

## Description

When Telerik Reporting generates a report, the output can display an "Invalid license" message even when the build detects a valid license. This issue can occur when the application startup project does not directly reference `Telerik.Licensing`.

The `Telerik.Reporting` NuGet package normally brings the required licensing dependencies. Add a direct `Telerik.Licensing` reference when the startup project does not receive that dependency or runtime activation still fails.

## Solution

### General Instructions for .NET and .NET Framework Projects

To resolve this issue, add a direct reference to the [Telerik.Licensing NuGet package](https://www.nuget.org/packages/Telerik.Licensing) in the startup project when the transitive reference from `Telerik.Reporting` does not activate the license. Follow these steps:

1. Identify the startup project that serves as the application entry point.
2. Add the `Telerik.Licensing` NuGet package to the startup project by using the NuGet Package Manager or Package Manager Console.

   For Package Manager Console, run `Install-Package Telerik.Licensing`. Use a package version compatible with the Telerik Reporting release in your application.
3. Clean and rebuild the solution to resolve the package dependencies.
4. Run the application and verify that reports no longer display the "Invalid license" message.

### .NET Framework-Specific Instructions

For .NET Framework startup projects that do not use the [SDK-style project](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview) structure, ensure that the project references at least one `Telerik.Reporting` NuGet package or assembly.

If the startup project contains no `Telerik.Reporting` reference and instead references another project that contains the reporting code, the licensing build task cannot determine that the application uses Telerik Reporting. The runtime license check then returns `False`.

In this scenario, add a reference to `Telerik.Reporting.dll` in the startup project. This reference lets the licensing build task identify Telerik Reporting and generate the files required at runtime.

## See Also

* [Telerik Reporting license key setup]({%slug license-key%})
* [SDK-style project structure](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview)
