---
title: Method 'CLIMessage' in type 'RuntimeInvalidLicenseStatus' does not have an implementation
description: Resolving the "Method 'CLIMessage' in type 'RuntimeInvalidLicenseStatus' does not have an implementation" error when using Telerik Reporting and Telerik.Licensing.
type: troubleshooting
page_title: Resolving TypeLoadException in Telerik Reporting Related to Telerik.Licensing
meta_title: Resolving TypeLoadException in Telerik Reporting Related to Telerik.Licensing
slug: method-climessage-not-implemented-typeloadexception
tags: reporting,telerik.reporting,licensing,telerik.licensing,typeerror,typeloadexception
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

I encountered a 500 error when accessing the `/configuration` endpoint after deploying changes to production. The error response includes the following:

```
{
    "message": "An error has occurred.",
    "exceptionMessage": "Method 'CLIMessage' in type 'RuntimeInvalidLicenseStatus' from assembly 'Telerik.Reporting, Version=19.2.25.1001, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.",
    "exceptionType": "TypeLoadException",
    "stackTrace": null
}
```

The error seems related to licensing issues, although the license appears valid. Investigating further, I identify that Telerik.Licensing NuGet package version `1.6.40`, released recently, is causing the issue.

## Cause

The issue arises due to incompatibility in Telerik.Licensing version `1.6.40`. This version introduces changes that lead to the `TypeLoadException` observed when using the Telerik.Reporting package.

## Solution

To resolve the issue, revert to the previous version of Telerik.Licensing and avoid using `1.6.40`. Follow these steps:

1. Update the dependency for Telerik.Licensing in your project to version `1.6.36`.
2. Ensure the version is explicitly defined in your project file or dependency manager to avoid automatic updates to `1.6.40`.
3. Rebuild and redeploy your application.

Alternatively, remove any explicit Telerik.Licensing dependency from your project. Telerik.Reporting has an internal dependency on Telerik.Licensing, ensuring compatibility with a tested version.

Example of specifying version in `PackageReference`:

```xml
<PackageReference Include="Telerik.Licensing" Version="1.6.36" />
```

## See Also

- [Telerik.Licensing NuGet Package](https://www.nuget.org/packages/Telerik.Licensing/1.6.40)
- [NuGet Package Management](https://learn.microsoft.com/en-us/nuget/)
