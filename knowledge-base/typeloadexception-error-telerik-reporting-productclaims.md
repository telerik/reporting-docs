---
title: TypeLoadException for Method get_ProductClaims
description: "Learn how to resolve the `TypeLoadException` error caused by a missing method - 'get_ProductClaims', due to old Telerik Reporting and Telerik.Licensing NuGet package versions."
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

I encountered an error during runtime, and the Reporting service stopped working, when using Telerik Reporting **v20.0.26.211** with [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing) NuGet package **v1.7.0**.

## Error Messages

```JSON
{
    "message": "An error has occurred.",
    "exceptionMessage": "Method 'get_ProductClaims' in type 'RuntimeInvalidLicenseStatus' from assembly 'Telerik.Reporting, Version=20.0.26.211, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' does not have an implementation.",
    "exceptionType": "TypeLoadException",
    "stackTrace": null
}
```

## Cause

The error occurs because Telerik Reporting version **20.0.26.211** is incompatible with the Telerik.Licensing NuGet package version **1.7.0**. 

A newer version of Telerik Reporting is required for compatibility.

## Solution

To resolve the issue, update the Reporting packages/assemblies in the project to **Progress® Telerik® Reporting 2026 Q1 (20.0.26.211)**, which is compatible with Telerik.Licensing version **1.7.0**. Ensure that all relevant dependencies are updated to avoid compatibility issues.

If you do not wish to update the Reporting dependencies right now, revert to using version 1.6.40 of the [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing) NuGet package.
