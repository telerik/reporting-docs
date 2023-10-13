---
title: Could not load file or assembly 'System.Resources.NetStandard' in R3 2023
page_title: Telerik Reporting depends on System.Resources.NetStandard.dll from R3 2023
description: "Learn why you may receive an exception stating that the assembly 'System.Resources.NetStandard' cannot be found in R3 2023 (17.2.23.1010)."
type: troubleshooting
slug: r3-2023-could-not-load-system-resources-netstandard
tags: telerik,reporting,system,resources,netstandard
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Product Version</td>
			<td>R3 2023 (17.2.23.1010)+</td>
		</tr>
	</tbody>
</table>

## Description

I receive the error message `Could not load file or assembly 'System.Resources.NetStandard'` in [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010).

## Error

````
Telerik.Reporting.Processing.CancelProcessingException: 'An error occurred while evaluating the report parameters. Report source cannot be processed. Check the InnerException for more information.'

Inner Exception:

FileNotFoundException: Could not load file or assembly 'System.Resources.NetStandard, Version=1.1.0.0, Culture=neutral, PublicKeyToken=null'. The system cannot find the file specified.
````

## Solution

We use a _ResXResourceReader_ implementation for reading the embedded assembly resources. This class is not supported in .NET Standard and is not a part of .NET runtime, so we used a NuGet package to obtain this functionality. The name of the package is [ResXResourceReader.NetStandard](https://www.nuget.org/packages/ResXResourceReader.NetStandard), it uses an MIT license and has a strong-name variant.

This package is added as a dependency in Telerik.Reporting `.nuspec` file, so if you reference Telerik Reporting as a nuget package, you'll also automatically get the `System.Resources.NetStandard.dll` assembly.

You will get the above runtime exception if in your project Telerik Reporting is referenced as an assembly, i.e.:

````XML
<ItemGroup>
	<Reference Include="Telerik.Reporting">
		<HintPath>..\..\..\Bin\netstandard2.0\Telerik.Reporting.dll</HintPath>
	</Reference>
</ItemGroup>
````

The solution is to add a NuGet package reference to [ResXResourceReader.NetStandard](https://www.nuget.org/packages/ResXResourceReader.NetStandard) in your project, or download its contents, extract it, and reference the `System.Resources.NetStandard.dll` directly.

## See Also

* [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010)
* [ResXResourceReader.NetStandard](https://www.nuget.org/packages/ResXResourceReader.NetStandard)
