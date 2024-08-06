---
title: Resolving PDF Rendering Format Not Available in ASP.NET Core Applications
description: "Learn how to fix the 'PDF rendering format is not available' error in Telerik Reporting when upgrading to .NET 8 and using ASP.NET Core applications."
type: troubleshooting
page_title: Fixing PDF Rendering Format Unavailability in Telerik Reporting for ASP.NET Core
slug: pdf-rendering-not-available-telerik-reporting
tags: telerik, reporting, pdf, rendering, asp.net core, .net 8, troubleshooting
res_type: kb
ticketid: 1659555
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Target Framework</td>
			<td>.NET 8+</td>
		</tr>
	</tbody>
</table>

## Description

After upgrading an ASP.NET Core application to .NET 8  the PDF rendering format becomes unavailable.  The error message encountered is `Telerik.Reporting.Processing.RendererNotAvailableException: PDF rendering format is not available`.

## Cause

The root cause of the issue is missing or incorrect references to Telerik Reporting assemblies, necessary for PDF rendering. This problem may arise from using assembly references directly instead of NuGet packages, using .NET Framework assemblies in a .NET project, or missing sub-dependencies. Additionally, conflicts with certain NuGet package versions, such as [System.Configuration.ConfigurationManager](https://www.nuget.org/packages/System.Configuration.ConfigurationManager/8.0.0) version **8.0.0**, can trigger this error.

## Solution

1. **Use Telerik Reporting NuGet Packages:** Instead of directly referencing assemblies, install the `Telerik.Reporting` NuGet packages which includes the PDF rendering extension. For instructions on setting up the Telerik private NuGet feed, refer to [Adding Telerik NuGet Feed to VS with Package Manager or CLI - Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. **Correct Assembly Locations:** If using assembly references, ensure that the Telerik Reporting assemblies are sourced from the appropriate directory for .NET applications, typically found in `C:\Program Files (x86)\Progress\Telerik Reporting 2024 Q1\Bin\netstandard2.0`.
1. **Include All Sub-Dependencies/Packages:** Manually verify that all necessary sub-dependencies are included in the project. Detailed requirements can be found in the [Using Telerik Reporting with .NET 6+ or Standard]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}#requirements) article.
1. **Address Dependency Conflicts:** If the `System.Configuration.ConfigurationManager` package version **8.0.0** is present, downgrade it to version 7.0.0 as it is known to cause the aforementioned error. This package may have been installed as a sub-dependency by other packages, such as `Microsoft.Data.SqlClient`.

## See Also

- [Adding Telerik NuGet Feed to VS with Package Manager or CLI - Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%})
- [Using Telerik Reporting with .NET 6+ or Standard]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}#requirements)
