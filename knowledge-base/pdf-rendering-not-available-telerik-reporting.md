---
title: Resolving PDF Rendering Format Not Available in ASP.NET Core Applications
description: Learn how to fix the "PDF rendering format is not available" error in Telerik Reporting when upgrading to .NET 8 and using ASP.NET Core applications.
type: troubleshooting
page_title: Fixing PDF Rendering Format Unavailability in Telerik Reporting for ASP.NET Core
slug: pdf-rendering-not-available-telerik-reporting
tags: telerik, reporting, pdf, rendering, asp.net core, .net 8, troubleshooting
res_type: kb
ticketid: 1659555
---

## Environment

| Product | Progress® Telerik® Reporting |
| --- | --- |
| Version | 18.0.24.130 |

## Description

After upgrading an ASP.NET Core application to .NET 8 and Telerik Reporting to version 18.0.24.130, the PDF rendering format becomes unavailable.  The error message encountered is `Telerik.Reporting.Processing.RendererNotAvailableException: PDF rendering format is not available`.

## Cause

The root cause of the issue is missing or incorrect references to Telerik Reporting assemblies, necessary for PDF rendering. This problem may arise from using assembly references directly instead of NuGet packages, using .NET Framework assemblies in a .NET 8 project, or missing sub-dependencies. Additionally, conflicts with certain NuGet package versions, such as `System.Configuration.ConfigurationManager` version 8.0.0, can trigger this error.

## Solution

To resolve the "PDF rendering format is not available" error, follow these steps:

1. **Use Telerik Reporting NuGet Packages:** Instead of directly referencing assemblies, utilize the Telerik Reporting NuGet packages that include the PDF rendering extension. For instructions on setting up the Telerik private NuGet feed, refer to [Adding Telerik NuGet Feed to VS with Package Manager or CLI - Telerik Reporting](https://docs.telerik.com/reporting/getting-started/installation/adding-private-nuget-feed).

2. **Correct Assembly Locations:** If using assembly references, ensure that the Telerik Reporting assemblies are sourced from the appropriate directory for .NET applications, typically found in `C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q1\Bin\netstandard2.0`.

3. **Include All Sub-Dependencies:** Manually verify that all necessary sub-dependencies are included in the project. Detailed requirements can be found in the [Using Telerik Reporting with .NET 6+ or Standard](https://docs.telerik.com/reporting/getting-started/installation/dot-net-core-support#requirements) documentation.

4. **Address Dependency Conflicts:** If the `System.Configuration.ConfigurationManager` package version 8.0.0 is present, downgrade it to version 7.0.0 as it is known to cause the aforementioned error. This package may be installed as a sub-dependency by other packages, such as `Microsoft.Data.SqlClient`.

5. **Add Missing Package:** In some cases, adding the `System.Security.Permissions` package version 8.0.0 to the project resolves the issue. Add the following package reference to your project file:

```xml
<PackageReference Include="System.Security.Permissions" Version="8.0.0" />
```

Implementing these steps should resolve the issue with PDF rendering in ASP.NET Core applications using Telerik Reporting.

## See Also

- [Adding Telerik NuGet Feed to VS with Package Manager or CLI - Telerik Reporting](https://docs.telerik.com/reporting/getting-started/installation/adding-private-nuget-feed)
- [Using Telerik Reporting with .NET 6+ or Standard](https://docs.telerik.com/reporting/getting-started/installation/dot-net-core-support#requirements)
- [System.Configuration.ConfigurationManager NuGet Package](https://www.nuget.org/packages/System.Configuration.ConfigurationManager/)
- [Microsoft.Data.SqlClient NuGet Package](https://www.nuget.org/packages/Microsoft.Data.SqlClient)
- [System.Security.Permissions NuGet Package](https://www.nuget.org/packages/System.Security.Permissions/)
