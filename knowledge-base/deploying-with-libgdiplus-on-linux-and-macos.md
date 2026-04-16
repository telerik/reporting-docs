---
title: Deploying Telerik Reporting with libgdiplus on Linux and macOS
description: "Learn how to deploy Telerik Reporting applications using libgdiplus (System.Drawing) on Linux, macOS, and Linux Docker containers for .NET 6 and earlier."
type: how-to
page_title: How to Deploy Telerik Reporting with libgdiplus on Linux and macOS
slug: deploying-with-libgdiplus-on-linux-and-macos
tags: libgdiplus,Linux,macOS,Docker,.NET 6,System.Drawing,2025 Q1 (19.0.25.313)
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
			<td>Product Version</td>
			<td>Up to and including 2025 Q1 (19.0.25.313)</td>
		</tr>
		<tr>
			<td>Framework</td>
			<td>Up to .NET 6</td>
		</tr>
	</tbody>
</table>

## Description

When deploying Telerik Reporting applications on Linux or macOS using the System.Drawing graphics engine, the [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) library is required. The library is a Mono implementation of the GDI+ API for non-Windows operating systems.

> System.Drawing for .NET 8+ is not supported on non-Windows platforms (Linux and macOS) due to a breaking change introduced by Microsoft, as explained in [System.Drawing.Common is not supported on non-Windows platforms](slug:system-drawing-common-is-not-supported-on-non-windows-platforms). For .NET 8+, use the [SkiaSharp graphics engine](slug:telerikreporting/using-reports-in-applications/dot-net-core-support) instead.

## Solution

### Deploying on Linux with libgdiplus

When deploying to a Linux machine, make sure you have the [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) library installed. The library is a Mono implementation of the GDI+ API for non-Windows operating systems.

The following snippet demonstrates how to update and install the necessary libraries on Ubuntu or Debian:

```bash
sudo apt-get update
sudo apt-get install libc6-dev
sudo apt-get install libgdiplus
```

> note The library [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) returns as a Family Font Name the `Preferred Family` rather than the `Family` name from the font meta information. Details may be found in [Font.Name returns incorrect results on Linux](https://github.com/mono/libgdiplus/issues/617). The two names may be different in the general case. In such a scenario, the font should be referenced with its `Family` name for Windows and `Preferred Family` name for Linux.
>
> In the rare case when the `Preferred Family` name of two fonts coincide and the `Family` names are different, on Linux, only the second font registered as private would be respected, as it will override the first one.

Since the `libgdiplus` library is not a perfect replacement for the Windows graphics library, the rendered reports may differ in terms of text positioning, word-wrapping, and alignment. These problems mostly affect the [Image rendering extension](slug:telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations) and, therefore, it is not recommended to use it.

The following JSON configuration snippet hides the Image rendering extension from the list of available rendering extensions:

```JSON
"telerikReporting": {
	"extensions": [
		{
		 "name": "IMAGE",
		 "visible": "false"
		}
	]
}
```

On the Linux machine, you also need to install the fonts you use in the reports. Otherwise, the font substitution algorithm will replace them with a system font. When rendering a PDF document, the fonts get resolved only if they are listed in the [`<privateFonts>`](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element) configuration element.

### Deploying on macOS with libgdiplus

To use .NET on macOS:

1. Install [.NET for macOS](https://learn.microsoft.com/en-us/dotnet/core/install/macos).
1. Install [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) by using [Homebrew](https://brew.sh/).

   ```zsh
   brew install mono-libgdiplus
   ```

1. Create your .NET application or copy an existing one from a Windows machine.
1. Add the `nuget.config` file with a path to your NuGet repository and [set up the Telerik NuGet Feed](slug:telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio).
1. Add a section in the `appsettings.json` file for any font fallback.
1. Run the following command to build the project and run the application. If you run the project in debug mode, Visual Studio Code will ask you to add the debug configuration to the `launch.json` file.

   ```zsh
   dotnet build
   ```

### Linux Docker Container with libgdiplus

The following `dockerfile` snippet demonstrates how to achieve the desired outcome. When these three libraries are installed, Telerik Reporting will run on the produced Docker image.

```DOCKERFILE
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
RUN apt-get update \
	&& apt-get install -y --allow-unauthenticated \
		libc6-dev \
		libgdiplus \
		libx11-dev \
	&& rm -rf /var/lib/apt/lists/*
```

## See Also

* [.NET Support](slug:telerikreporting/using-reports-in-applications/dot-net-core-support)
* [How to Build and Install Latest libgdiplus Library on Linux](slug:how-to-build-and-Install-libgdiplus-linux)
* [System.Drawing.Common is not supported on non-Windows platforms](slug:system-drawing-common-is-not-supported-on-non-windows-platforms)
* [libgdiplus Docs](https://www.mono-project.com/docs/gui/libgdiplus/)
