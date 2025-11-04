---
title: Only invariant culture is supported in globalization-invariant mode
description: "Learn how to resolve the error message 'Only invariant culture is supported in globalization-invariant mode'."
type: troubleshooting
page_title: Only invariant culture is supported in globalization-invariant mode
slug: only-invariant-culture-is-supported-in-globalization-invariant-mode-error
tags: .NET 7, .NET 8, .NET 9, and .NET 10
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
			<td>Project Type</td>
			<td>ASP.NET Core Web API</td>
		</tr>
		<tr>
			<td>Target Framework</td>
			<td>.NET 6+</td>
		</tr>
	</tbody>
</table>


## Description

I have created a new ASP.NET Core project using the Visual Studio project templates targetting `.NET 8+` and upon integrating the HTML5 Report [Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})/[Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) on one of the pages of the web application, the below error is displayed on the page instead of the specified report.

## Steps to Reproduce

Run the ASP.NET Core application in [.NET Core Globalization Invariant Mode](https://github.com/dotnet/runtime/blob/main/docs/design/features/globalization-invariant-mode.md). Projects created with Visual Studio's ASP.NET Core Web API that target .NET 6+ use this setting by default.

The `Invariant Mode` can be turned on in multiple ways with the most common being the project `.csproj` file:

````XML
<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<InvariantGlobalization>true</InvariantGlobalization>
	</PropertyGroup>
</Project>
````

## Error Message

- For product version **<= 17.0.23.315**:

	`Unable to get report parameters. An error has occurred. The type initializer for 'Telerik.Reporting.Interfaces.LocalizationContext' threw an exception.`

- For newer versions:

	`Unable to get report parameters. An error has occurred. Only the invariant culture is supported in the globalization-invariant mode. See https://aka.ms/GlobalizationInvariantMode for more information. (Parameter 'culture') 1033 (0x0409) is an invalid culture identifier.`

## Cause

The `InvariantGlobalization` property causes the runtime to throw a [`CultureNotFound`](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.culturenotfoundexception) exception when a new instance of [`CultureInfo`](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo) is created. In the `LocalizationContext` class, we create a default `CultureInfo` instance, using the "en" culture as default which causes the exception.

## Suggested Workarounds

### Workaround 1

Disable the *Invariant* globalization setting from the project file:

````XML
<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<InvariantGlobalization>false</InvariantGlobalization>
	</PropertyGroup>
</Project>
````

### Workaround 2

Disable the *Invariant* globalization setting from the `runtimeconfig.json` file:

````JSON
{
	"runtimeOptions": {
		"configProperties": {
			"System.Globalization.Invariant": false
		}
	}
}
````

### Workaround 3

Use the `DOTNET_SYSTEM_GLOBALIZATION_INVARIANT` environment variable whose values can be:

* `0` - Access to cultural data
* `1` - Run in invariant mode

## See Also

* [.NET Core Globalization Invariant Mode](https://github.com/dotnet/runtime/blob/main/docs/design/features/globalization-invariant-mode.md)
* [Runtime configuration options for globalization](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization)
