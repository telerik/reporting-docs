---
title: Resolving Missing Static Assets in the Native Blazor Report Viewer
page_title: Missing CSS Source Map and SVG Icons in Native Blazor Report Viewer on .NET 9 or Later
description: "Resolve CSS source map build errors and missing SVG export icons in Native Blazor Report Viewer 20.2.26.1007 by excluding the map or supplying replacement assets."
type: troubleshooting
slug: native-blazor-report-viewer-missing-css-source-map
tags: Blazor, NativeBlazorViewer, StaticWebAssets, SourceMap, SVG, ExportIcons
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
    </tbody>
</table>

## Description

On .NET 9 or later, an application that references `Telerik.ReportViewer.BlazorNative` version `20.2.26.1007` can fail to build with a missing static asset error. The diagnostic references a compressed output and a missing CSS source map, as in the following example:

```text
The asset 'C:\Projects\BlazorApp\obj\Debug\net10.0\compressed\14jp1i84hx-{0}-2x8nbomfaf-2x8nbomfaf.gz' can not be found at any of the searched locations 'C:\Users\<user>\.nuget\packages\telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css\reporting-blazor-viewer.css.map' and 'C:\Users\<user>\.nuget\packages\telerik.reportviewer.blazornative\20.2.26.1007\staticwebassets\css\reporting-blazor-viewer.css.map'.
```

The SDK may report the error from `Microsoft.NET.Sdk.StaticWebAssets.Compression.targets`. The missing input is `reporting-blazor-viewer.css.map`.

Separately, version `20.2.26.1007` lacks SVG export icons. The viewer displays missing icons, and requests to `_content/Telerik.ReportViewer.BlazorNative/icons/export/`, such as `pdf.svg`, return HTTP 404 responses. These missing SVGs do not cause build errors.

## Cause

Version `20.2.26.1007` declares `reporting-blazor-viewer.css.map` as a static web asset but does not include the file.

.NET 9+ SDKs enable compression for static web assets by default, including source maps. This build step attempts to read the declared file and exposes the package mismatch.

Version `20.2.26.1007` does not declare the missing SVG files as package assets, so the SDK does not report an SVG build error. The viewer still requests the icons at runtime. The application must serve the SVG files at the expected URLs.

## CSS Source Map Workarounds

The packaging issues will be fixed in the upcoming Telerik Reporting release. Until that release is available, apply **one** of the following temporary workarounds for the CSS source map. For missing SVG icons, apply the [SVG icon workaround](#svg-icon-workaround) separately.

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

If you prefer to keep the asset, you can supply the source map file at the location that the package metadata expects. This workaround satisfies the existing asset declaration before the build processes static assets.

1. Download `css/reporting-blazor-viewer.css.map` from the [NativeBlazorViewerAssets folder](https://github.com/telerik/reporting-samples/tree/master/NativeBlazorViewerAssets). Place the file at `wwwroot/css/reporting-blazor-viewer.css.map` in the application.

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

## SVG Icon Workaround

Keep replacement SVGs in the application rather than the shared NuGet cache. The application serves its own files at the URLs that the viewer expects. No project-file changes are required for the icons in version `20.2.26.1007`.

To restore the export icons:

1. Download the `icons` folder from the [NativeBlazorViewerAssets folder](https://github.com/telerik/reporting-samples/tree/master/NativeBlazorViewerAssets).

1. Copy that folder to `wwwroot/_content/Telerik.ReportViewer.BlazorNative/icons` in the application. Preserve the `export` subfolder and the SVG file names. The resulting structure is:

        ```text
        wwwroot/
            _content/
                Telerik.ReportViewer.BlazorNative/
                    icons/
                        export/
                            csv.svg
                            docx.svg
                            image.svg
                            options.svg
                            pdf.svg
                            pptx.svg
                            rtf.svg
                            xlsx.svg
        ```

1. Clean the application and rebuild.
