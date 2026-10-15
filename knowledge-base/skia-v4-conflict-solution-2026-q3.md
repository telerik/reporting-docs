---
title: Telerik Reporting Conflicts with SkiaSharp v4
description: "Troubleshooting conflicts between Telerik Reporting and SkiaSharp v4 in the 2026 Q3 release."
type: troubleshooting
page_title: Fix MethodAccessException with SkiaSharp.HarfBuzz
meta_title: Fix MethodAccessException with SkiaSharp.HarfBuzz
slug: telerik-reporting-skia-harfbuzz-conflict-solution
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

I have updated the [SkiaSharp]()https://www.nuget.org/packages/SkiaSharp package in my project to **v4.153.1**. When I use the Skia graphics engine for previewing the report, I encounter a `System.MethodAccessException` when rendering reports in Telerik Reporting after upgrading to version **20.2.26.1007**. 

## Error Message

```error
System.MethodAccessException: Attempt by method 'SkiaSharp.HarfBuzz.SKShaper.Shape(System.String, SkiaSharp.SKPaint)' to access method 'SkiaSharp.SKPaint.GetFont()' failed.
```

## Cause

The issue arises due to version mismatches between the `SkiaSharp` and `SkiaSharp.HarfBuzz` NuGet packages. When updating one, the other package should also be updated to the same version to ensure compatibility.

## Solution

To resolve the issue, synchronize the versions of the `SkiaSharp` and `SkiaSharp.HarfBuzz` packages. Follow these steps:

1. Update the `SkiaSharp.HarfBuzz` NuGet package to match the version of the `SkiaSharp` package. For example, if using `SkiaSharp v4.153.1`, update `SkiaSharp.HarfBuzz` to `v4.153.1` as well.
2. If your application runs on Linux, update the "NativeAssets" dependencies for consistency. Update the following packages:

   ```xml
   <PackageReference Include="SkiaSharp.HarfBuzz" Version="4.153.1" />
   <PackageReference Include="SkiaSharp.NativeAssets.Linux" Version="4.153.1" />
   <PackageReference Include="SkiaSharp.NativeAssets.Win32" Version="4.153.1" />
   ```

3. After updating the packages, rebuild your application to apply the changes.

## See Also

- [SkiaSharp.HarfBuzz NuGet Package](https://www.nuget.org/packages/SkiaSharp.HarfBuzz) 
- [SkiaSharp Native Assets for Linux](https://www.nuget.org/packages/SkiaSharp.NativeAssets.Linux) 
- [SkiaSharp Native Assets for Windows](https://www.nuget.org/packages/SkiaSharp.NativeAssets.Win32) 
