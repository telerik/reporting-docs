---
title: .NET Core Support
page_title: .NET Core Support | for Telerik Reporting Documentation
description: .NET Core Support
slug: telerikreporting/using-reports-in-applications/dot-net-core-support
tags: .net,core,support
published: True
position: 7
---

# .NET Core Support



This article explains how to use reports in a .NET Core application for Windows, Linux, and macOS platforms.

Telerik Reporting provides a set of assemblies and NuGet packages designed for .NET Core projects.         The NuGets are available in the          [Telerik NuGet feed](https://docs.telerik.com/reporting/add-the-telerik-private-nuget-feed-to-visual-studio).         Additionally, thе assemblies are available in the Telerik Reporting installation directory         __\Bin\netstandard2.0\__  and          __\Bin\netcoreapp3.1\__  folders.         The assemblies target .NET Standard 2.0 and the desktop viewers target .NET Core 3.1, which ensures compatibility with a greater variety of frameworks and applications.         The NuGet packages resolve the external dependencies to provide better dependency management and code portability.       

## Requirements

* ASP.NET Core 2.1 or newer for web projects

* .NET Core 3.1 or newer for desktop projects

The following NuGet packages are required.           When using our *NuGet*  packages, the required dependencies are resolved automatically.           Otherwise, they need to be manually added to the project.         


| Package name | Version |
| ------ | ------ |
|Microsoft.Extensions.Configuration|2.1.2001|
|Microsoft.Extensions.Configuration.Binder|2.1.2001|
|Microsoft.Extensions.Configuration.Json|2.1.2001|
|System.Configuration.ConfigurationManager|4.5.2000|
|System.Data.Common|4.3.2000|
|System.Data.SqlClient|4.6.2000|
|System.Drawing.Common|4.5.2001|
|System.IO.Packaging|4.5.2000|
|System.Reflection.Emit|4.3.2000|
|System.Reflection.Emit.Lightweight|4.3.2000|
|System.Runtime.Loader|4.3.2000|
|System.Security.Cryptography.Pkcs|4.5.2001|
|System.Security.Permissions|4.5.2000|
|System.Text.Encoding.CodePages|4.5.2000|
|System.Threading.AccessControl|4.5.2000|
|sqlite-net-pcl|1.7.302-bet|




## Implemented Features and Limitations

On Windows, the reporting engine still relies on GDI+ library because it provides the fastest and most convenient way to process text, which is essential to the product.           In Windows environment .NET Core runtime manages to resolve the GDI+ calls natively, but for Linux and macOS a set of libraries should be installed (see below).           Most of the processing and rendering features that work on Windows using .NET Framework 4 or higher, are also supported in .NET Core projects with the new .NET Standard assemblies.         

As a down-side, the report item designers are not .NET Standard-compatible, hence no design-time support in Visual Studio is available and type reports are not supported.           Our recommendation is to [convert]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}) such reports to .trdx/.trdp definitions with the Standalone Report Designer            or these classes can be used as runtime-created report instances.           Report definitions, created in Visual Studio, can be used as report instances in            .NET Core applications, but their code must not include any calls to CodeDOM-specific classes like ResourceManager.         

Supported functionalities:

* All rendering extensions except MHTML (HTML archive), XPS (XML Paper Specification) and XLS (Microsoft Excel 97 - 2003).             

* HTML, PDF and OpenXML-based renderings are supported on __Linux/macOS__ .               Due to graphics library incompatibilities, in some cases, Graph-based items in the OpenXML renderings are incorrectly displayed.             

* All report items except the obsolete Chart item are supported.             

* The supported report definition types are TRDX, TRDP and report classes, created in Visual studio without the VS designer-specific code.             

* The supported Data Source components are               [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}),               [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}),               [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}),               [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}),               [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}).             

* [JSON-based reporting configuration]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}). For CLI projects the JSON configuration has precedence over the current XML-based reporting configuration.             

## Using Telerik Reporting in Applications on Linux Platform

When deploying to a Linux machine, make sure it has installed the library            [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/)            , which is a Mono implementation of GDI+ API for non-Windows operating systems. The following snippet performs an update and installs the necessary libraries on Ubuntu/Debian:         

	
````
            sudo apt-get update
            sudo apt-get install libc6-dev
            sudo apt-get install libgdiplus
````



Since __libgdiplus__  is not a perfect replacement for the Windows graphics library, the rendered reports may differ in terms of text positioning, word-wrapping and aligning.           These problems mostly affect the [Image rendering extension]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}) hence it is not recommended to be used.           The following JSON configuration snippet will hide it from the list of the available rendering extensions:         

	
````js
            "telerikReporting": {
              "extensions": [
                {
                  "name": "IMAGE",
                  "visible": "false"
                }
              ]
            }
````



The fonts used in the reports should be installed on the Linux machine, otherwise the font substitution algorithm will replace them with a system font.            When rendering a PDF document, the fonts get resolved only if they are listed in the [```<privateFonts>```]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%})            configuration element.         

## Using Telerik Reporting in Applications on macOS Platform

1. Install  [.NET Core for macOS](https://dotnet.microsoft.com/download) .

1. Install  [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/)  using  [Homebrew](https://brew.sh/) 

	
      ````
                brew install mono-libgdiplus
````



1. Create your .NET Core application (or copy an existing one from a Windows machine).

1. Add __nuget.config__  file with path to your NuGet repository.

1. Add a section in __appsettings.json__  for font fallback.

1. Build

	
      ````
                  dotnet build
````

and run the application. When running in debug mode Visual Studio Code will ask to add debug configuration to launch.json.

## Containerize Telerik Reporting

Telerik Reporting can be used in a Docker image if it meets the GDI+ requirements.            The __microsoft/windowsservercore__  images distributed by Microsoft contain the graphics library, but their size is significantly bigger compared to the size of the dotnet runtime in a Linux container.            Such container only needs the __libgdiplus__  and its accompanying libraries installed, which can be done through the following *dockerfile*  snippet:         

	
````
            FROM microsoft/dotnet:2.1-runtime AS base 
            RUN apt-get update \ 
                && apt-get install -y --allow-unauthenticated \ 
                    libc6-dev \ 
                    libgdiplus \ 
                    libx11-dev \ 
                && rm -rf /var/lib/apt/lists/*
````



Having these three libraries installed ensures that Telerik Reporting will run on the produced Docker image.         

If you need to use Telerik Reporting in a Windows container, you need to target a Windows base image that includes GDI support.            This is also the approach recommended by the Microsoft, see  [Container Base Images - Choosing a base image](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/container-base-images#choosing-a-base-image)  help article for additional reference.         

## Examples

Telerik Reporting ships with a ready-made .NET Core examples that demonstrate how to show the sample reports in an ASP.NET Core, WinForms Core and WPF Core application.            The ASP.NET Core demo also shows how to inject an __appsettings.json__  configuration file to the controller            and how to initialize a WebHostBuilder so it runs under Windows and Linux.                    

An example project is available in the Telerik Reporting installation directory            *\Examples\CSharp\Asp.NetCoreDemo*  subfolder.         

# See Also


 * [How to Use HTML5 Report Viewer in an ASP.NET Core 2.1 and 2.2 application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-2.1-and-2.2-application%})

 * [How to Add report viewer to a Windows Forms' .NET Core project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-core-project%})

 * [How to Add report viewer to a WPF .NET Core project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-core-project%})
