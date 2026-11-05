---
title: Restricting Access to Report Resources
page_title: Implementing a Strict Resource Resolver for Telerik Reporting
description: "Use the Strict Resource Resolver sample to allow approved local files and PNG images from a trusted HTTPS folder through a custom resource policy."
type: how-to
slug: implementing-strict-resource-resolver
tags: resource,resolver,path,image,configuration,dotnet
res_type: kb
---

## Environment

The sample uses the following product and targets:

| Item | Value |
| --- | --- |
| Product | Telerik Reporting |
| Library target | .NET Standard 2.0 |
| Intended hosts | .NET 10 and .NET Framework 4.6.2 on Windows |
| Interface availability | Telerik Reporting [2026 Q4 (20.3.26.1111)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q4-(20-3-26-1111)) and later |

## Description

How can I apply my own rules to external report resources, including images, through one resource resolver?

The `IStrictResourceResolver` interface extends `IResourceResolver` without additional members. Implement `Resolve(string resourceUri)` to validate each external reference and return approved content or a location.

Telerik Reporting introduced `IStrictResourceResolver` in the [2026 Q4 (20.3.26.1111)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q4-(20-3-26-1111)) release.

The existing interface handles selected references, including relative image paths. Absolute image locations and resources such as map tiles do not all pass through it. The strict interface extends resolution to external images, CSV/JSON sources, shapefiles, external stylesheets, and map resources. It covers relative paths, absolute paths, UNC paths, and URLs.

Implement the strict interface to apply your application's resource rules. Telerik Reporting does not supply a ready-to-use public implementation. Adapt the illustrative sample to your application's rules.

## Solution

Use the [Strict Resource Resolver sample in the reporting-samples repository](https://github.com/telerik/reporting-samples/tree/master/StrictResourceResolver) for the complete implementation and configuration files.

The `StrictResourceResolver.sln` solution contains two sibling projects:

* `StrictResourceResolver\StrictResourceResolver.csproj`: The .NET Standard 2.0 resolver library.
* `ViewerService\ViewerService.csproj`: The .NET 10 REST service and HTML5 Report Viewer, with a project reference to the library.

The separate `Tests` console project targets `net10.0` and `net462`; it is not part of the solution.

### Understanding the Resource Rules

Review [TrustedResourceResolver.cs](https://github.com/telerik/reporting-samples/blob/master/StrictResourceResolver/StrictResourceResolver/TrustedResourceResolver.cs) for the implementation.

The public constructor accepts two string arguments:

* `directory`: An existing absolute local directory. The resolver accepts relative paths, absolute paths, and local file URIs only beneath this directory.
* `trustedImageUrl`: An absolute HTTPS folder URL that ends in `/`. Only images directly in this folder are approved, not its subfolders.

The resolver normalizes local paths, checks the directory boundary, and rejects linked path components. URLs outside the trusted HTTPS folder, UNC/device paths, alternate data streams, and files outside the approved local directory are denied.

Approved resources return `byte[]`, not locations. Policy denials emit a trace warning and return `null`, without fallback to the original location. Invalid configuration, missing files, and download failures raise exceptions.

For each approved URL, the resolver downloads the content itself. The downloader disables redirects and cookies, sends no credentials, and applies a 15-second cancellation deadline and a 5 MiB limit.

The downloader checks the response's `image/png` media type and eight-byte PNG header, represented by `PngSignature`. Local files do not use these PNG checks. These limits and checks are sample choices, not Reporting defaults or complete image validation.

### Configuring the Host

Use the repository files rather than copy a separate implementation from this article. The sample provides these configuration and startup files:

* [ViewerService/appsettings.json](https://github.com/telerik/reporting-samples/blob/master/StrictResourceResolver/ViewerService/appsettings.json): The working service configuration with `Resources` and the trusted HTTPS image folder.
* [ViewerService/Program.cs](https://github.com/telerik/reporting-samples/blob/master/StrictResourceResolver/ViewerService/Program.cs): Directory normalization and REST service registration.
* [Examples/app.config](https://github.com/telerik/reporting-samples/blob/master/StrictResourceResolver/Examples/app.config): XML registration for a .NET Framework host.
* [Examples/appsettings.json](https://github.com/telerik/reporting-samples/blob/master/StrictResourceResolver/Examples/appsettings.json): JSON registration with an absolute resource directory for another .NET host.

Registration uses the existing `resourceResolver` element with the `custom` provider. Its `typeName` identifies `StrictResourceResolver.TrustedResourceResolver, StrictResourceResolver`. The examples also register the custom type in `typeReferences` so the engine can activate it with type validation enabled.

The provider excludes `typeName` and sorts the remaining parameter names. It passes their values as positional string arguments: `directory` first, then `trustedImageUrl`.

The library constructor requires an absolute directory. The service converts the relative `Resources` setting to an absolute path against the application's content root. It supplies the resulting configuration through `ReportServiceConfiguration.ReportingEngineConfiguration`. If you reuse the JSON without this startup logic, specify an absolute directory.

Set `trustedImageUrl` to `https://raw.githubusercontent.com/telerik/reporting-docs/master/report-items/images/`. The report can reference `Shape.png`, `Textbox.png`, or another PNG directly in that folder. Other hosts, sibling folders, subfolders, and traversal paths are denied.

The folder setting and requested URLs must omit credentials, query strings, fragments, and nondefault ports. Use direct PNG URLs; GitHub `blob` and `tree` pages return HTML.

The standalone console checks use `Textbox.png`; the viewer's TRDP uses `Shape.png`. Both images are in the same configured trusted HTTPS folder.

For another host, deploy `StrictResourceResolver.dll` beside its application assemblies and grant read access to the approved directory. Use the same Reporting release in all projects and retain the host's runtime dependencies and licensing configuration. The service's project reference copies the resolver library automatically.

Restart the application after configuration changes. For configuration details, refer to [Report Engine Configuration](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview).

### Running the Viewer and Report

Build and run the sample in Visual Studio, or with PowerShell from the folder that contains `StrictResourceResolver.sln`:

```PowerShell
dotnet build .\StrictResourceResolver.sln -c Release
dotnet run --project .\ViewerService\ViewerService.csproj
```

Open `http://localhost:5087`. The HTML5 viewer calls `/api/reports` on the same host and requests `TrustedImage.trdp`.

The service uses the built-in `UriReportSourceResolver` with `ViewerService\Reports` as its base directory. ReportSource resolution selects the TRDP; the strict resource resolver controls its external resources.

Open [ViewerService/Reports/TrustedImage.trdp](https://github.com/telerik/reporting-samples/blob/master/StrictResourceResolver/ViewerService/Reports/TrustedImage.trdp) in the Standalone Report Designer to edit the report. Its embedded `CsvDataSource` contains `ResourceKind` and `ImageUrl` columns. The `trustedImage` PictureBox uses `= Fields.ImageUrl`, so the resolver evaluates the image reference for each row.

The report contains these four cases:

| Resource kind | ImageUrl value | Expected result |
| --- | --- | --- |
| Allowed local image | `local-image.png` | Displays the PNG from `ViewerService\Resources`. |
| Allowed trusted HTTPS image | `https://raw.githubusercontent.com/telerik/reporting-docs/master/report-items/images/Shape.png` | Displays the PNG because it is directly in the configured trusted HTTPS folder. |
| Denied existing HTTPS image | `https://raw.githubusercontent.com/telerik/reporting-docs/master/report-items/graph/images/DataItems/Graph/BarLineChartStructure.png` | Displays the row without an image because the URL is not approved. |
| Denied existing local image | `..\DeniedResources\not-allowed-image.png` | Displays the row without an image because the existing file is outside `Resources`. |

Relative image paths resolve against the configured `Resources` directory, not the `Reports` directory. Only `Resources` is approved. The project copies `Reports`, `Resources`, and `DeniedResources` to build and publish output; file deployment does not grant resource access.

The viewer requires internet access for jQuery and the Kendo UI theme. The trusted image also requires internet access.

### Verifying the Behavior

In the viewer, confirm that all four report rows appear, both approved images display, and both denied images remain absent.

For console validation commands, refer to [Running Checks in the sample README](https://github.com/telerik/reporting-samples/tree/master/StrictResourceResolver#running-checks). The checks support `--public-image` for the configured public PNG and `--integration` for Reporting configuration and image resolution.

Run the console checks in both intended hosts before deployment. The `net462` checks require Windows and the .NET Framework 4.6.2 targeting pack.

## Notes

The strict result is authoritative: `byte[]` supplies content, `string` supplies an approved location, and `null` denies access. Existing `IResourceResolver` implementations remain supported; strict resolution is opt-in.

The interface does not supply path-validation logic. Your implementation defines its resource rules independently of `validateReportPaths` and `externalReportPaths`. Keep report-path validation enabled.

The resolver receives a resource identifier, not its report-item type. Approved image URLs are available to any resource consumer, not exclusively to image items. Arbitrary map tile URLs remain denied by this sample policy.

Inline data, image bytes, and assembly-embedded resources do not necessarily require an external lookup. Report-source selection and data-provider connections are separate responsibilities.

The sample checks linked file components before the read; these operations are separate. Keep the resource tree and its ancestors under administrator control. Do not allow concurrent replacement by untrusted users.

The public image URL refers to a mutable branch. Use a verified commit identifier instead if reproducible content is required.

.NET Standard 2.0 makes the library eligible for both intended hosts, but verify assembly loading and resource resolution in each application. The Framework host also needs compatible TLS settings and normal Reporting prerequisites.

## See Also

For related guidance, refer to these resources:

* [Strict Resource Resolver Sample](https://github.com/telerik/reporting-samples/tree/master/StrictResourceResolver)
* [Security Best Practices](slug:security-best-practices)
* [Processing Configuration](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element)
* [Type References Configuration](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element)
