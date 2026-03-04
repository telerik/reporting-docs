---
title: TypeLoadException for Method get_ProductClaims
description: Resolve the `TypeLoadException` error caused by outdated Telerik Reporting and Telerik.Licensing NuGet package versions.
type: troubleshooting
page_title: TypeLoadException Error in Telerik Reporting with ProductClaims Issue
meta_title: TypeLoadException Error in Telerik Reporting with ProductClaims Issue
slug: typeloadexception-error-telerik-reporting-productclaims
tags: reporting, typeloadexception, productclaims, error, nuget
res_type: kb
ticketid: 1710658
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 20.0.26.211 </td>
</tr>
</tbody>
</table>

## Description

I encountered the following error when using Telerik Reporting Version 20.0.26.211 with Telerik.Licensing NuGet package v1.7.0:

```
{
    "message": "An error has occurred.",
    "exceptionMessage": "Method 'get_ProductClaims' in type 'RuntimeInvalidLicenseStatus' from assembly 'Telerik.Reporting, Version=20.0.26.211, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.",
    "exceptionType": "TypeLoadException",
    "stackTrace": null
}
```

I updated the Telerik.Licensing NuGet package to v1.7.0 but the issue persisted.

## Cause

The error occurs because Telerik Reporting Version 20.0.26.211 is incompatible with Telerik.Licensing NuGet package v1.7.0. A newer version of Telerik Reporting is required for compatibility.

## Solution

To resolve the issue, update Telerik Reporting to the latest version, which is compatible with Telerik.Licensing v1.7.0.

1. Download the latest installer (Version 20.0.26.304) from your Telerik account.
2. Install the updated version of Telerik Reporting.
3. Update the Telerik Reporting packages in your project.

Ensure that all relevant dependencies are updated to avoid compatibility issues.

## See Also

- [Telerik Reporting Documentation](https://docs.telerik.com/reporting/overview)
- [NuGet Package: Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing)
