---
title: Getting Started with the Visual Studio Report Designer for .NET
page_title: Setting Up the Visual Studio Report Designer for .NET
description: "Set up the NuGet-based Visual Studio Report Designer for .NET, configure your report project, and install, update, or remove the designer packages."
slug: vs-report-designer-net-getting-started
tags: visual,studio,report,designer,net,nuget,setup
published: True
position: 1
reportingArea: General
components: [general]
---

# Getting Started with the Visual Studio Report Designer for .NET

>note The Visual Studio Report Designer for .NET is available as a preview starting with Telerik Reporting 2026 Q3 (20.2.26.1007).

The Visual Studio Report Designer for .NET edits C# and VB coded report definitions in SDK-style .NET projects. The designer is distributed as the `Telerik.Reporting.VSDesigner` NuGet package, which you reference next to the `Telerik.Reporting` package of the same version. The designer does not require the Telerik Reporting Visual Studio extension, a VSIX, or the Telerik Reporting installer.

The [.NET Framework designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview#installing-the-net-framework-designer) uses a different installation workflow.

>important Use the `Telerik.Reporting.VSDesigner` package only with the `Telerik.Reporting` package of exactly the same version. The examples in this article use version `{{site.buildversion}}`. Replace it with the version of your packages.

## Prerequisites

To use the designer, you need the following:

* Windows with Visual Studio 2026 version 18.10 or later and the **.NET desktop development** workload. Visual Studio 2022 and earlier versions of Visual Studio 2026 cannot load the designer.
* An SDK-style project that targets `net8.0-windows` or later and sets `UseWindowsForms` to `true`.
* A .NET SDK that supports the target framework of the project. The .NET 10 SDK, which Visual Studio 2026 installs, supports projects that target .NET 8, .NET 9, and .NET 10.
* The .NET Desktop Runtime of the .NET version that the project targets. For example, a project that targets `net8.0-windows` requires the .NET 8 Desktop Runtime. You can download the runtimes from the [.NET download page](https://dotnet.microsoft.com/download/dotnet).
* Access to the `Telerik.Reporting` and `Telerik.Reporting.VSDesigner` packages through a NuGet package source, and access to [nuget.org](https://www.nuget.org/) for their dependencies.
* A [Telerik Reporting license key](slug:license-key).

The designer runs in a separate process on the target framework of the report project. The package contains the designer for .NET 8 and .NET 10. A project that targets .NET 9 uses the .NET 8 designer, and a project that targets .NET 10 or later uses the .NET 10 designer.

## Configuring Your Report Project

To use the designer in an existing report project:

1. Make the packages available through a NuGet package source. If you received the packages as a download, see [Installing the Packages from a Download](#installing-the-packages-from-a-download).
1. Set the target framework of the project to `net8.0-windows` or later, and set `UseWindowsForms` to `true`.
1. Add references to the `Telerik.Reporting` and `Telerik.Reporting.VSDesigner` packages of the same version. Set [PrivateAssets](https://learn.microsoft.com/en-us/nuget/consume-packages/package-references-in-project-files#controlling-dependency-assets) to `all` in the reference to the designer package.
1. If your reports use JSON, Web Service, or GraphQL data sources, add references to the matching data source packages of the same version.
1. [Activate your Telerik Reporting license](slug:license-key).
1. Restore the packages and build the project.
1. [Open an existing coded report](#opening-a-report).

The following project file configures a report library for the designer:

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net10.0-windows</TargetFramework>
    <UseWindowsForms>true</UseWindowsForms>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Telerik.Reporting" Version="{{site.buildversion}}" />
    <PackageReference Include="Telerik.Reporting.VSDesigner" Version="{{site.buildversion}}" PrivateAssets="all" />
    <!-- Add the data source packages only if your reports use these data sources. -->
    <PackageReference Include="Telerik.Reporting.WebServiceDataSource" Version="{{site.buildversion}}" />
    <PackageReference Include="Telerik.Reporting.GraphQLDataSource" Version="{{site.buildversion}}" />
  </ItemGroup>
</Project>
```

The following table describes the packages:

| Package | Purpose |
| ------ | ------ |
| `Telerik.Reporting` | Provides the report engine that your reports and the designer use. |
| `Telerik.Reporting.VSDesigner` | Provides the designer, which only Visual Studio uses. `PrivateAssets="all"` keeps the package out of the dependencies of projects and NuGet packages that consume your report project. |
| `Telerik.Reporting.WebServiceDataSource` | Provides the runtime of the JSON and Web Service data sources. Without it, the designer cannot read the data of these data source types. |
| `Telerik.Reporting.GraphQLDataSource` | Provides the runtime of the GraphQL data source. Without it, the designer cannot read the data of this data source type. |

Use the same version for all Telerik Reporting packages in the project. Do not mix them with another Telerik Reporting version.

>note When you add `Telerik.Reporting.VSDesigner` through the NuGet Package Manager, Visual Studio prompts you to accept the license agreement of the package.

The package does not supply Visual Studio project or item templates. The report templates of the Telerik Reporting Visual Studio extension are not part of this setup. To start, use an existing coded report or the [sample from the download](#trying-the-bundled-sample).

## Installing the Packages from a Download

If you received the designer as a download, the download contains the following folders:

* `packages` contains the `Telerik.Reporting`, `Telerik.Reporting.VSDesigner`, `Telerik.Reporting.WebServiceDataSource`, and `Telerik.Reporting.GraphQLDataSource` packages of the same version as `.nupkg` files.
* `Sample` contains a report project that uses these packages. For more information, see [Trying the Bundled Sample](#trying-the-bundled-sample).

To make the packages available to your projects, register a folder that contains them as a NuGet package source. For more details follow the KB article [Setup a Local NuGet Package Feed](slug:setup-local-nuget-feed), or the steps below:

1. Extract the download.
1. Create a permanent folder for the packages, for example, `%LOCALAPPDATA%\Telerik\VsDesigner\packages`. Copy the `.nupkg` files from the `packages` folder of the download into it.

	Your projects restore the packages from this folder. Keep the folder while your projects reference these packages.

1. Register the folder as a package source by using one of the following options:

	* In Visual Studio, select **Tools** > **NuGet Package Manager** > **Package Manager Settings** > **Package Sources**. Add a source, name it, for example, `Telerik Reporting VS Designer`, set its source to the package folder, and save the settings.
	* In PowerShell, run the following command:

		```powershell
		dotnet nuget add source "$env:LOCALAPPDATA\Telerik\VsDesigner\packages" --name "Telerik Reporting VS Designer"
		```

	* In the `nuget.config` file of your solution, add the package folder to the `packageSources` element:

		```xml
		<packageSources>
		<add key="Telerik Reporting VS Designer" value="%LOCALAPPDATA%\Telerik\VsDesigner\packages" />
		</packageSources>
		```

	The first two options store the source in your user-level `NuGet.Config` file, so all your projects can use it. A source in the `nuget.config` file of a solution applies only to the projects in the folder of that file and its subfolders.

1. [Configure your report project](#configuring-your-report-project) to reference the package version from the download.

If the `nuget.config` file of your solution clears the package sources with `<clear />`, add the package folder to that file. If the file uses package source mapping, map the four packages to the package folder and keep the existing mappings of your other sources:

```xml
<packageSourceMapping>
  <packageSource key="Telerik Reporting VS Designer">
    <package pattern="Telerik.Reporting" />
    <package pattern="Telerik.Reporting.VSDesigner" />
    <package pattern="Telerik.Reporting.WebServiceDataSource" />
    <package pattern="Telerik.Reporting.GraphQLDataSource" />
  </packageSource>
</packageSourceMapping>
```

NuGet uses the most specific matching pattern, so these package IDs take precedence over a broader pattern such as `Telerik.*`. The other dependencies of the packages, such as `Telerik.Licensing`, still require a source that provides them, for example, [nuget.org](https://www.nuget.org/).

## Trying the Bundled Sample

The sample does not require you to register a package source. Its `nuget.config` file restores the Telerik Reporting packages from the `packages` folder of the download and the other dependencies from [nuget.org](https://www.nuget.org/).

To open the sample:

1. Extract the whole download and keep the `Sample` and `packages` folders side by side.
1. Open `Sample\ReportDesignerSample.slnx` in Visual Studio 2026.
1. Build the solution. Visual Studio restores the packages before the build.
1. In **Solution Explorer**, double-click `Report1.cs`. You can also select the file and press `Shift+F7`.

The sample targets `net10.0-windows` and contains one coded report, `Report1`. Its project file marks `Report1.cs` as a component, so double-click opens the designer from the start.

## Updating the Designer Package

The designer version follows the `Telerik.Reporting.VSDesigner` package reference of your project, not the Telerik Reporting version that is installed on the machine.

To update to the packages from a newer download:

1. Close Visual Studio.
1. Copy the `.nupkg` files from the `packages` folder of the newer download into your package folder. You can delete the older packages that no project references.
1. Update all Telerik Reporting package references of your project to the new version. Use the same version for all of them.
1. Open the solution, build the project, and reopen the report in the designer.

>important If the newer download has the same version number as the previous one, Visual Studio continues to use the cached copies of the previous build. To load the new build, see [The Previous Designer Build Still Loads](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems#the-previous-designer-build-still-loads).

For packages from another package source, update all Telerik Reporting package references to the same newer version, and then restore and build the project. The [Upgrade Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard) does not upgrade .NET projects.

## Removing the Designer

To stop using the designer and remove the package folder:

1. Remove the `Telerik.Reporting.VSDesigner` package reference from your projects. If your projects restore the other Telerik Reporting packages from the package folder, update them to a version from another package source, or remove them.
1. Remove the package source by using the same option that you used to add it:

	* In Visual Studio, select **Tools** > **NuGet Package Manager** > **Package Manager Settings** > **Package Sources**. Remove the source and save the settings.
	* In PowerShell, run the following command:

		```powershell
		dotnet nuget remove source "Telerik Reporting VS Designer"
		```

	* In the `nuget.config` file of your solution, remove the source and its `packageSourceMapping` entries.

1. Close Visual Studio and delete the package folder.
1. (_Optional_) Delete the cached copies of the packages from the NuGet global packages folder, by default `%USERPROFILE%\.nuget\packages`. In that folder, delete the version subfolders of `telerik.reporting.vsdesigner` and of the other Telerik Reporting packages that came from the package folder.

Projects that still reference packages from the deleted folder cannot restore them.

## Opening a Report

By default, Visual Studio opens the files of SDK-style projects in the code editor when you double-click them. The first time you open a report in the designer, the designer changes a Visual Studio setting. After that, double-click opens component files in their designer. The designer changes the setting only if you have never chosen a default editor for component files.

### Open a Coded Report in the Designer from the Context Menu

1. In **Solution Explorer**, locate the report's main `.cs` file for C# or `.vb` file for VB, not its `.Designer.cs` or `.Designer.vb` file.
1. Right-click the file and select **View Designer**. You can also select the file and press `Shift+F7`.

The following animation shows the **View Designer** command and the report design surface:

![Visual Studio Solution Explorer shows the View Designer command that opens a coded report in the .NET designer.](images/Designer.NET/vs-designer-net-open-report.gif)

### Set Coded Reports to Open in the Designer with Double-Click

1. In **Solution Explorer**, right-click a report file and select **Open With**.
1. Select **Component (Windows Forms) Designer**, select **Set as Default**, and then select **OK**.

### Make Double-Click Open Component Files in the Code Editor

The setting is the same one that **Open With** > **Set as Default** changes. It applies to all component files in SDK-style projects, not only to reports.

1. In **Solution Explorer**, right-click a report file and select **Open With**.
1. Select **C# Editor** for a C# report or the Visual Basic code editor for a VB report.
1. Select **Set as Default**, and then select **OK**.

## Open Report/Data/Group Explorer

To open Report Explorer, Data Explorer, or Group Explorer, right-click the report design surface and select **View** > the explorer. For more information, see [Explorer Windows](slug:visual-studio-report-designer-structure#explorer-windows). To preview or export the report, see [Previewing Reports in the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-preview).

## Next Steps

* [Structure of the Visual Studio Report Designer](slug:visual-studio-report-designer-structure)
* [Previewing Reports in the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-preview)
* [Troubleshooting the Visual Studio Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems)
