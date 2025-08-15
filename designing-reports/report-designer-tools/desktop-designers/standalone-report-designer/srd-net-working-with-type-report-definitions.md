---
title: Coded Report Definition
page_title: Using the Standalone Report Designer for .NET for Coded Reports
description: "Learn how to use the Standalone Report Designer for .NET to load, design, and preview Coded(.CS) Reports."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/srd-net-working-with-type-report-definitions
tags: designing,using,loading,importing,previewing,type,reports,standalone,report,designer,for,net
published: True
position: 5
---

# Coded Reports in the Standalone Report Designer for .NET

Starting with the [Progress® Telerik® Reporting 2025 Q3 (19.2.25.813)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q3-19-2-25-813) release, the [Standalone Report Designer for .NET]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#starting-the-standalone-report-designer-for-net) supports loading, designing, and previewing Coded Report definitions hosted in CS projects targeting .NET.

> The feature is available only for CS reports due to specifics in the CodeDOM Serialization in VB.NET.

In this article, we will explain and visually demonstrate how the Standalone Report Designer for .NET can be used to open, edit, and preview .NET coded (.CS) reports, and we will also share what the designer does behind the scenes to handle the previously unsupported format.

## Prerequisites
 
The designer's functionality for working with Coded Reports relies on [MSBuild](https://github.com/dotnet/msbuild) version 15 or higher. If you have Visual Studio 2017 or newer installed, the required MSBuild version will be available out of the box.

## Opening Coded Reports

Just as one would open a **TRDP/TRDX** file, now the **.CS** files will also be openable from the standard open file menu of the Standalone Report Designer for .NET.

1. Upon selecting a .NET type report to open, the `Open Code File Wizard` will start, and it will automatically populate the necessary inputs:

	![The first step of the Import Code File Wizard where the paths to the report files are shown.](./images/srd-net-type-reports/srd-net-open-type-report.png)

	> At this step, it is important to ensure that the project that will be used to build the report targets `.NET`. A project that targets the older `.NET Framework` would produce an assembly that is not compatible with the Standalone Report Designer for .NET.

1. The next step is building the project. This step will create a new folder in the same directory as the executable file of the Standalone Report Designer for .NET, whose name will be the *name of the Coded Report*.

	![The second step of the Open Code File Wizard where the project is built and the build information is outputted to the GUI.](./images/srd-net-type-reports/srd-net-build-type-report-project.png)

## Working with the .NET Coded Report in the Report Designer

Once the **Open Code File Wizard** is completed, the report will be automatically opened in a new tab in the Standalone Report Designer for .NET application.

When a .NET Coded Report is opened in the application, and this is the currently focused tab, a new tab will appear in the toolbar menu - `.NET Report Tools`.

![The .NET Report Tools tab in the Standalone Report Designer for .NET's toolbar.](./images/srd-net-type-reports/srd-net-preview-options.png)

- `Build & Preview` - This button will trigger a build of the project (like the button 'Build') and a preview of the .NET Coded Report with any custom code behind included. For example, custom code written in [report events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}) should be respected when previewing through this button.
- `Build` - This button will trigger a new build of the project that was used to import the report. The generated assemblies of the built project(s) will be copied to the dedicated directory for the type report. The dependencies already added to the folder by a previous build will be reused, making the process faster.

	The report project will be rebuilt entirely from the modified code. If there is a problem, you will see the build errors, as shown below:

	![Error thrown by a failing build in the .NET Report Tools tab in the Standalone Report Designer for .NET.](./images/srd-net-type-reports/srd-net-build-error.png)

- `Clean Up` - Cleans all the assets generated and copied with the build process of the opened CS report from the Standalone Report Designer for .NET and *closes* the report. This includes all the assemblies and resources, all meta files, and the cached XML report definition. If you open the report again after cleanup, the build logic will initiate, and a new set of assets will be created.

	![The warning message in the .NET Report Tools tab in the Standalone Report Designer for .NET's when clicking on the Clean Up button.](./images/srd-net-type-reports/srd-net-clean-up.png)

> Be advised that our algorithm mimics the Visual Studio one only semantically. This means that the initial report modification will introduce significant changes in the serialized code, but the component tree will be preserved. Please use versioning for your reports to have clear tracking of the changes. The non-designer partial class files stay intact, so custom code is preserved and ready to work alongside the generated design logic.

## Internal Logic for .NET Coded Reports in the Report Designer

While it will appear that the .NET Coded Report is being rendered by the Standalone Report Designer for .NET, internally, we read and display the report definition as a `TRDP` file.

When the .NET Coded Report is initially opened, the designer creates a dedicated folder based on the type name of the report class. This folder contains the following files and subfolders:

![The imported .NET Coded Report's automatically created folder with its contents.](./images/srd-net-type-reports/srd-net-type-report-folder.png)

- `bin` - Contains the assembly of the built project of the report and all of its dependent assemblies.
- `{ReportName}.Designer.cs` - A backup of the `.designer` file that can be used in case our logic fails and the original file is wrongly edited by the application.
- `{ReportName}.json` - A `JSON` file containing the report's type name, the loaded full type, paths to the project file, the designer file, etc.
- `{ReportName}.trdp` - The actual report definition file loaded and displayed by the Standalone Report Designer for .NET. When editing the .NET Coded Report from the tab in the designer application, behind-the-scenes, this is the actual file that is being changed, and its contents are later serialized from `XML` to `CS` code in the `.designer` file through the [CodeDOM APIs](https://learn.microsoft.com/en-us/dotnet/api/system.codedom?view=windowsdesktop-9.0). Our code keeps the two files - the original `.designer` and the `TRDP` files in live-sync.

## See Also

* [.NET Coded Report Design, No IDE Strings Attached](https://www.telerik.com/blogs/net-coded-report-design-no-ide-strings-attached)
* [How to use Visual Studio Report Designer to edit CS/VB Reports in .NET Projects]({%slug how-to-use-vs-designer-in-dotnet-core%})
