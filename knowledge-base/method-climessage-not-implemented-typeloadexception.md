---
title: Method CLIMessage in type RuntimeInvalidLicenseStatus does not have an implementation
description: "Resolving the Method CLIMessage in type RuntimeInvalidLicenseStatus does not have an implementation error when using Telerik Reporting and Telerik.Licensing."
type: troubleshooting
page_title: Resolving TypeLoadException in Telerik Reporting Related to Telerik.Licensing
meta_title: Resolving TypeLoadException in Telerik Reporting Related to Telerik.Licensing
slug: method-climessage-not-implemented-typeloadexception
tags: reporting, licensing, telerik, typeerror, typeloadexception
res_type: kb
ticketid: 1708840
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Reporting</td>
        </tr>
        <tr>
            <td>Version</td>
            <td>19.3.26.121 or older</td>
        </tr>
    </tbody>
</table>

## Description

I encountered a [500 Internal Server Error](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status/500) on the [/configuration]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-configuration%}) endpoint after deploying changes to production. 

## Error Messages

The response to the [/configuration]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-configuration%}) endpoint is the following:

````json
{
    "message": "An error has occurred.",
    "exceptionMessage": "Method 'CLIMessage' in type 'RuntimeInvalidLicenseStatus' from assembly 'Telerik.Reporting, Version=19.3.26.121, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.",
    "exceptionType": "TypeLoadException",
    "stackTrace": null
}
````

In the trace, additional errors may be seen, such as:

````
Method 'get_BrowserMessageTitle' in type 'RuntimeMessage' from assembly 'Telerik.Reporting, Version=19.3.26.121, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.
Method 'CLIMessage' in type 'RuntimeLicenseStatus' from assembly 'Telerik.Reporting, Version=19.3.26.121, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.
Method 'CLIMessage' in type 'RuntimeValidLicenseStatus' from assembly 'Telerik.Reporting, Version=19.3.26.121, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.
Method 'CLIMessage' in type 'RuntimeInvalidLicenseStatus' from assembly 'Telerik.Reporting, Version=19.3.26.121, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.
Method 'get_BrowserMessageTitle' in type 'VoidRuntimeMessage' from assembly 'Telerik.Reporting, Version=19.3.26.121, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.
````

## Cause

Changes to the licensing implementation in the [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing/1.6.40) NuGet package version `1.6.40` is causing the issues when using **Telerik Reporting 2025 Q4 or older**. 

## Solution

To resolve the issue, revert to the previous version of **Telerik.Licensing** until a new version of Telerik Reporting is released. Follow these steps:

1. Downgrade for [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing) package in your project to version `1.6.36`.
2. Ensure the version is explicitly defined in your project file or dependency manager to avoid automatic updates to `1.6.40`.
3. Rebuild and redeploy your application.

Alternatively, remove any explicit Telerik.Licensing dependency from your project. The `Telerik.Reporting` NuGet package has an internal dependency on `Telerik.Licensing`, ensuring compatibility with a tested version. Example of specifying version in the `csproj` file:

```xml
<PackageReference Include="Telerik.Licensing" Version="1.6.36" />
```

## See Also

* [Telerik.Licensing NuGet Package](https://www.nuget.org/packages/Telerik.Licensing/1.6.40)
* [NuGet Package Management](https://learn.microsoft.com/en-us/nuget/)
