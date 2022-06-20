---
title: .NET Core Support
page_title: .NET Core Support 
description: "Learn how to use Telerik reports in .NET Core applications on Windows, Linux, and macOS platforms."
slug: telerikreporting/using-reports-in-applications/dot-net-core-support
previous_url: /using-reports-in-applications/dot-net-core-support
tags: telerik, reporting, dotnet, core, support, getting, started, download, and, installation
published: True
position: 7
---

# .NET Core Support

Telerik Reporting provides a set of assemblies and NuGet packages that are designed for .NET Core projects and enable you to use Telerik reports in .NET Core applications on Windows, Linux, and macOS platforms. 

The NuGet packages are available in the [Telerik NuGet feed]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}). Additionally, the assemblies are available in the `\Bin\netstandard2.0\` and `\Bin\netcoreapp3.1\` folders located in the Telerik Reporting installation directory. 

The assemblies target .NET Standard 2.0 and the desktop viewers target .NET Core 3.1, which ensures compatibility with a greater variety of frameworks and applications. Also, the NuGet packages resolve the external dependencies to provide better dependency management and code portability. 

## Requirements

* (For web projects) ASP.NET Core 2.1 or later.

* (For desktop projects) .NET Core 3.1 or later.

To use NuGet, you are required to provide the following NuGet packages. Note that when using the Telerik NuGet packages, the required dependencies are resolved automatically. Otherwise, you need to manually add them to the project. 

| Package Name | Version |
| ------ | ------ |
|`Microsoft.Extensions.Configuration`|2.1.2001|
|`Microsoft.Extensions.Configuration.Binder`|2.1.2001|
|`Microsoft.Extensions.Configuration.Json`|2.1.2001|
|`System.Configuration.ConfigurationManager`|4.5.2000|
|`System.Data.Common`|4.3.2000|
|`System.Data.SqlClient`|4.6.2000|
|`System.Drawing.Common`|4.5.2001|
|`System.IO.Packaging`|4.5.2000|
|`System.Reflection.Emit`|4.3.2000|
|`System.Reflection.Emit.Lightweight`|4.3.2000|
|`System.Runtime.Loader`|4.3.2000|
|`System.Security.Cryptography.Pkcs`|4.5.2001|
|`System.Security.Permissions`|4.5.2000|
|`System.Text.Encoding.CodePages`|4.5.2000|
|`System.Threading.AccessControl`|4.5.2000|
|`sqlite-net-pcl`|1.7.302-beta|

## Features and Limitations

On Windows, the reporting engine still relies on GDI+ library because it provides the fastest and most convenient way to process text, which is essential to the product. 

* For Windows, .NET Core runtime natively resolves the GDI+ calls. 
* For Linux and macOS, you need to install the set of libraries listed below. 

Most of the processing and rendering features that work on Windows and are using .NET Framework 4 or later are also supported in .NET Core projects with the new .NET Standard assemblies. 

As a down-side, the report item designers are not .NET Standard-compatible. As a result, no design-time support in Visual Studio is available and type reports are not supported. Therefore, you are recommended to [convert]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}) such reports to `.trdx` or `.trdp` definitions with the Standalone Report Designer. 

Also, you can use these classes as runtime-created report instances. You can use report definitions that are created in Visual Studio as report instances in .NET Core applications, but their code must not include any calls to CodeDOM-specific classes like `ResourceManager`. 

Telerik Reporting supports the following functionalities:

* All rendering extensions except MHTML (HTML archive), XPS (XML Paper Specification), and XLS (Microsoft Excel 97 - 2003). 

* HTML, PDF, and OpenXML-based renderings are supported on Linux and macOS. Due to graphics library incompatibilities, in some cases, Graph-based items in the OpenXML renderings are incorrectly displayed. 

* Except for the obsolete Chart report item, all report items are supported. 

* The supported report definition types are `TRDX`, `TRDP`, and report classes that are created in Visual studio without the VS designer-specific code. 

* Telerik Reporting supports the following Data Source components: 
	
	+ [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) 
	
	+ [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}) 
	
	+ [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) 
	
	+ [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) 
	
	+ [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) 

* The [JSON-based reporting configuration]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) is also supported. For CLI projects, the JSON configuration has precedence over the current XML-based reporting configuration. 

## Deploying on Linux

When deploying to a Linux machine, make sure you have the [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) library installed. The library is a Mono implementation of GDI+ API for non-Windows operating systems. 

The following snippet demonstrates how to update and install the necessary libraries on Ubuntu or Debian: 
    
````
sudo apt-get update
sudo apt-get install libc6-dev
sudo apt-get install libgdiplus
````

Since the libgdiplus library is not a perfect replacement for the Windows graphics library, the rendered reports may differ in terms of text positioning, word-wrapping, and aligning. These problems mostly affect the [Image rendering extension]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}) and, therefore, it is not recommended to use it. 

The following JSON configuration snippet hides the Image rendering extension from the list of the available rendering extensions:
    
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

On the Linux machine, you also need to install the fonts you use in the reports. Otherwise, the font substitution algorithm will replace them with a system font. When rendering a PDF document, the fonts get resolved only if they are listed in the [`<privateFonts>`]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%}) configuration element. 

## Deploying on macOS

To use .NET Core on mascOS:

1. Install [.NET Core for macOS](https://dotnet.microsoft.com/download).

1. Install [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) by using [Homebrew](https://brew.sh/).
    
	````
brew install mono-libgdiplus
````

1. Create your .NET Core application or copy an existing one from a Windows machine.

1. Add the `nuget.config` file with a path to your NuGet repository.

1. Add a section in the `appsettings.json` file for any font fallback.

1. Run the following command to build the project and run the application. If you run the project in the debug mode, Visual Studio Code will ask you to add the debug configuration to the `launch.json` file. 
    
	````
dotnet build
````


## Using Container Platforms 

You can use Telerik Reporting in a Docker image if it meets the GDI+ requirements. The Microsoft-distributed `microsoft/windowsservercore` images contain the graphics library. However, their size is significantly bigger compared to the size of the .NET runtime in a Linux container. Such a container requires you to install only the libgdiplus library and its accompanying libraries. 

The following `dockerfile` snippet demonstrates how to achieve the desired outcome. When these three libraries are installed, Telerik Reporting will run on the produced Docker image.  
    
````
FROM microsoft/dotnet:2.1-runtime AS base
RUN apt-get update \
    && apt-get install -y --allow-unauthenticated \
        libc6-dev \
        libgdiplus \
        libx11-dev \
    && rm -rf /var/lib/apt/lists/*
````


To use Telerik Reporting in a Windows container, target a Windows base image that includes GDI support. The same approach is [recommended by Microsoft](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/container-base-images#choosing-a-base-image).

## Sample Projects

Telerik Reporting ships with ready-made .NET Core examples that demonstrate how to show the sample reports in an ASP.NET Core, WinForms Core, and WPF Core application. The ASP.NET Core demo also shows how to inject an `appsettings.json` configuration file to the controller and how to initialize a WebHostBuilder so it runs under Windows and Linux. 

A sample project is available in the `\Examples\CSharp\Asp.NetCoreDemo` subfolder of the Telerik Reporting installation directory. 

## See Also

* [ASP.NET Core Web API Implementation Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/overview%})

* [Using HTML5 Report Viewer in ASP.NET Core 3.1 Applications]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-3.1-application%})

* [Adding Report Viewers to Windows Forms .NET Core Projects]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-core-project%})

* [Adding Report Viewers to WPF .NET Core Projects]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-core-project%})
