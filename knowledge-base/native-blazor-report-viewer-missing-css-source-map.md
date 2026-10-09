---
title: Resolving a Missing CSS Source Map in the Native Blazor Report Viewer
page_title: Missing CSS Source Map Build Error in Native Blazor Report Viewer on .NET 9 and .NET 10
description: "Resolve the missing CSS source map build error in Native Blazor Report Viewer 20.2.26.1007 by excluding the asset or copying the version-matched map into the NuGet cache."
type: troubleshooting
slug: native-blazor-report-viewer-missing-css-source-map
tags: Blazor, NativeBlazorViewer, StaticWebAssets, SourceMap
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
            <td>Report Viewer</td>
            <td>Native Blazor Report Viewer</td>
        </tr>
        <tr>
            <td>Version</td>
            <td>20.2.26.1007</td>
        </tr>
        <tr>
            <td>Target Framework</td>
            <td>.NET 9 or .NET 10</td>
        </tr>
    </tbody>
</table>

## Description

An application that references `Telerik.ReportViewer.BlazorNative` version `20.2.26.1007` fails to build with a missing static asset error. The diagnostic references a compressed output and a missing CSS source map, as in the following example:

```text
The asset 'C:\Projects\BlazorApp\obj\Debug\net10.0\compressed\14jp1i84hx-{0}-2x8nbomfaf-2x8nbomfaf.gz' can not be found at any of the searched locations 'C:\Users\<user>\.nuget\packages\telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css\reporting-blazor-viewer.css.map' and 'C:\Users\<user>\.nuget\packages\telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css\reporting-blazor-viewer.css.map'.
```

The SDK may report the error from `Microsoft.NET.Sdk.StaticWebAssets.Compression.targets`. The missing input is `reporting-blazor-viewer.css.map`.

## Cause

The NuGet package declares `reporting-blazor-viewer.css.map` as a static web asset but does not include the file.

The .NET 9 and .NET 10 SDKs enable compression for static web assets by default, including source maps. This build step attempts to read the declared file and exposes the package mismatch.

## Workarounds

This issue will be fixed in the upcoming Telerik Reporting release. Until that release is available, you may apply **one** of the following temporary workarounds to the project that fails to build.

### Workaround 1: Excluding the Source Map

This workaround removes the missing map from static web asset processing for the host application. It leaves the NuGet package cache unchanged.

1. Add the following item group directly inside the `<Project>` element of the application project file. Keep the existing package references and other settings unchanged:

    ```xml
    <ItemGroup>
      <StaticWebAsset Remove="$(NuGetPackageRoot)telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css\reporting-blazor-viewer.css.map" />
      <StaticWebAssetEndpoint Remove="_content/Telerik.ReportViewer.BlazorNative/css/reporting-blazor-viewer.css*.map" />
    </ItemGroup>
    ```

1. Clean the application, rebuild it, and publish it again. Do not reuse previous build outputs for the first publish after this change.

In this case, the viewer CSS and JavaScript remain available. The map is not required for viewer functionality.

### Workaround 2: Adding the Source Map

If you prefer not to exclude the asset, you can supply the version-matched file at the location that the package metadata expects. This workaround satisfies the existing asset declaration before the build processes static assets.

1. Create the file `wwwroot/css/reporting-blazor-viewer.css.map` in the application and copy the following JSON into it:

    ```json
    {"version":3,"sourceRoot":"","sources":["../../../sass/src/reporting-blazor-viewer.scss"],"names":[],"mappings":"AACA;EACI;EACA;EACA;EACA;EACA;EACA;EACA;EACA;;AAEA;EACI;;AAGJ;AAAA;EAEI;;;AAIR;EACI;EACA;EACA;EACA;EACA;EACA;EACA;;AAEA;EACI;EACA;EACA;;AAGJ;EACI;;;AAMR;EACI;;;AAKJ;EACI;EACA;EACA;;AAEA;EACI;;AAGJ;EACI;;AAEA;EACI;;AAIR;EACI;;AAGJ;EACI;;AAEA;EACI;;AAEA;EACI;EACA;EACA;EACA;;AAKZ;EACI;;;AAKR;EACI;;;AAIJ;EACI;EACA;EACA;EACA;EACA;EACA;;AAMI;AAAA;EAEI;;AAMJ;AAAA;EAEI;;;AAOZ;EACI;;;AAGJ;EACI;EACA;;;AAGJ;EACI;;;AAKJ;EACI;;;AAGJ;EACI;EACA;;;AAGJ;EACI;EACA;EACA;EACA;EACA;EACA;;;AAGJ;EACI;EACA;;;AAGJ;AAAA;EAEI;;;AAGJ;EACI;EACA;;;AAKJ;EACI;EACA;;AAIA;EACI;;AAGJ;EACI;EACA;;AAKJ;EACI;EACA;EACA;EACA;EACA;EACA;;AAEA;EACI;EACA;EACA;;;AAKZ;EACI;EACA;EACA;EACA;EACA;;;AAGJ;EACI;;AAEH;EACO;;AAEA;EACI;;;AAKZ;EACI;;AAEA;EACI;;AAEA;EACI;;;AAKZ;EACI;EACA;EACA;EACA;;;AAKJ;EACI;EACA;EACA;;;AAGJ;EACI;EACA;EACA;;;AAGJ;EACI;EACA;EACA;;;AAGJ;AAAA;EAEI;EACA;EACA;EACA;EACA;EACA;EACA;;;AAGJ;EACI;EACA;EACA;;;AAGJ;EACI;EACA;EACA;EACA;;AAEA;EACI;;AAGJ;EACI;EACA;EACA;EACA;;;AAIR;EACI;IACI;AAAA;AAAA;;;AAMR;EACI;EACA;EACA;EACA;EACA;EACA;;;AAGJ;EACI;EACA;;AAEA;AAAA;AAAA;EAGI;EACA;EACA;;AAGJ;EACI;;AAGJ;EACI;EACA;EACA;;;AAIR;AAAA;EAEI;EACA;;AAEA;AAAA;EACI;EACA;;AAGJ;AAAA;AAAA;EAEI;;AAGJ;AAAA;EACI;EACA;;;AAIR;EACI;EACA;EACA;EACA;EACA;;AAEA;EACI;EACA;EACA;EACA;EACA;EACA;EACA;EACA;EACA;EACA;EACA;;AAGJ;EACI;EACA;EACA;EACA;EACA;EACA;;AAGJ;EACI;EACA;EACA;EACA;;AAGJ;EACI;;AAGJ;AAAA;EAEI;;AAGJ;EACI;;AAEA;EACI;;AAGJ;EACI;;AAGJ;EACI;;AAGJ;EACI;;AAIR;EACI;EACA;EACA;EACA;EACA;;AAGJ;EACI;EACA;EACA;EACA;;AAGJ;EACI;EACA;EACA;EACA;;AAGJ;EACI;;AAGJ;EACI;EACA;EACA;EACA;EACA;EACA;;AAGJ;EACI;;;AAIR;EACI;EACA;EACA;EACA;EACA;EACA;EACA;;;AAGJ;EACI;EACA;EACA;;AAEA;AAAA;EAEI;;;AAIR;EACI;IACI;IACA;IACA;IACA;IACA;IACA;IACA;IACA;IACA;IACA;IACA;IACA;;EAIA;IACI;IACA;;EAGJ;IACI;IACA;IACA;IACA;IACA;IACA;;EAKJ;AAAA;IAEI;;EAGJ;IACI;;EAGJ;AAAA;AAAA;IAGI;;EAIA;IACI;;EAKZ;IACI;;;AAIR;EACI;AAAA;IAEI;;;AAKJ;EACI;EACA;EACA;;AAGJ;EACI;;AAGJ;EACI;;AAGJ;EACI;EACA;;AAGJ;EACI;EACA;;AAGJ;EACI;EACA;;;AAMR;EACI;;;AAGJ;EACI;;;AAGJ;EACI;;;AAKJ;EACI;EACA;EACA;EACA;EACA;;AAEA;EACI;EACA;;AAGJ;EACI;EACA;EACA;EACA;EACA;;AAGJ;EACI;EACA;EACA;EACA;;AAGJ;EACI;;AAGJ;EACI;;AAGJ;EACI;EACA;;AAGJ;EACI;;;AAIR;EACI;EACA;;;AAGJ;EACI;EACA;EACA;EACA;EACA;EACA;EACA","file":"reporting-blazor-viewer.css"}
    ```

1. Add the following item group and target directly inside the `<Project>` element of the application project file:

    ```xml
    <ItemGroup>
      <None Include="wwwroot\css\reporting-blazor-viewer.css.map" />
    </ItemGroup>

    <Target Name="CopyReportingBlazorViewerCssMap" BeforeTargets="PreBuildEvent">
      <MakeDir Directories="$(NuGetPackageRoot)telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css" />
      <Copy
        SourceFiles="$(MSBuildProjectDirectory)\wwwroot\css\reporting-blazor-viewer.css.map"
        DestinationFolder="$(NuGetPackageRoot)telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css"
        SkipUnchangedFiles="true" />
    </Target>
    ```

    The target uses `NuGetPackageRoot` rather than a hard-coded user profile. Ensure the build account can write to that directory.

1. Clean the application and rebuild it.

The source map now exists at the path that the package declares.