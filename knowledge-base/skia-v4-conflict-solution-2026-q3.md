---
title: Telerik Reporting Conflicts with SkiaSharp v4
description: Resolving conflicts between Telerik Reporting and SkiaSharp v4
type: troubleshooting
page_title: Fix MethodAccessException with SkiaSharp.HarfBuzz in Telerik Reporting
meta_title: Fix MethodAccessException with SkiaSharp.HarfBuzz in Telerik Reporting
slug: telerik-reporting-skia-conflict-solution
tags: telerik reporting, skia, skiasharp, harfbuzz, dependencies, methodaccessexception
res_type: kb
ticketid: 1719632
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
<td>20.2.26.1007</td>
</tr>
</tbody>
</table>

## Description

I encounter a `System.MethodAccessException` when rendering reports in Telerik Reporting after upgrading to version 20.2.26.1007. The error states:

```text
System.MethodAccessException: Attempt by method 'SkiaSharp.HarfBuzz.SKShaper.Shape(System.String, SkiaSharp.SKPaint)' to access method 'SkiaSharp.SKPaint.GetFont()' failed.
```

This issue does not occur in earlier versions of Telerik Reporting (e.g., 20.2.26.812) and appears to be related to a mismatch in the version of the `SkiaSharp.HarfBuzz` package.

## Cause

The issue arises due to version mismatches between the `SkiaSharp` and `SkiaSharp.HarfBuzz` NuGet packages. Telerik.Reporting.Drawing.Skia relies on a compatible version of these dependencies for rendering.

## Solution

To resolve the issue, synchronize the versions of the `SkiaSharp` and `SkiaSharp.HarfBuzz` packages. Follow these steps:

1. Update the `SkiaSharp.HarfBuzz` NuGet package to match the version of the `SkiaSharp` package. For example, if using `SkiaSharp v4.153.1`, update `SkiaSharp.HarfBuzz` to `v4.153.1` as well.

2. If your application runs on Linux, update the "NativeAssets" dependencies for consistency. Update the following packages:

   ```xml
   <PackageReference Include="SkiaSharp.HarfBuzz" Version="4.153.1" />
   <PackageReference Include="SkiaSharp.NativeAssets.Linux" Version="4.153.1" />
   <PackageReference Include="SkiaSharp.NativeAssets.Win32" Version="4.153.1" />
   ```

3. If your application uses HarfBuzz, ensure the correct versions of the following packages:

   ```xml
   <PackageReference Include="HarfBuzzSharp" Version="14.2.1.301" />
   <PackageReference Include="HarfBuzzSharp.NativeAssets.Linux" Version="14.2.1.301" />
   <PackageReference Include="HarfBuzzSharp.NativeAssets.Win32" Version="14.2.1.301" />
   ```

4. After updating the packages, rebuild your application to apply the changes.

## See Also

- [SkiaSharp.HarfBuzz NuGet Package](https://www.nuget.org/packages/SkiaSharp.HarfBuzz) 
- [SkiaSharp Native Assets for Linux](https://www.nuget.org/packages/SkiaSharp.NativeAssets.Linux) 
- [SkiaSharp Native Assets for Windows](https://www.nuget.org/packages/SkiaSharp.NativeAssets.Win32) 
- [HarfBuzzSharp Documentation](https://www.nuget.org/packages/HarfBuzzSharp) 
- [Telerik Reporting Overview](https://docs.telerik.com/reporting/introduction) 
