---
title: Working with Type Reports
page_title: Using the Standalone Report Designer for .NET for Type Reports
description: "Learn how to use the Standalone Report Designer for .NET to load, design and preview Type(.CS/.VB) Reports."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/srd-net-working-with-type-report-definitions
tags: designing,using,loading,importing,previewing,type,reports,standalone,report,designer,for,net
published: True
position: 6
---

# Type Reports in the Standalone Report Designer for .NET

Starting with the [Progress® Telerik® Reporting 2025 Q2 (19.1.25.521)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q2-19-1-25-521) release, the [Standalone Report Designer for .NET]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#starting-the-standalone-report-designer-for-net) now supports loading, designing and preview type report definitions, previously supported only by the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}#visual-studio-report-designer).

>note The feature is in **Preview** state and will be further developed in the coming releases.

In this article, we will explain and visually demonstrate how the Standalone Report Designer for .NET can be used to open, edit and preview .NET type(.CS/.VB) reports, and will also share what the designer does behind-the-scenes to handle the previously unsupported format.

## Import Code File Wizard

Just as one would open a **TRDP/TRDX** file, now the **.CS/.VB** files will also be openable from the standard open file menu of the Standalone Report Designer for .NET.

1. Upon selecting a .NET type report to open, the `Import Cide File Wizard` will start and it will automatically populate the necessary inputs:

	![An image of the first step of the Import Code File Wizard where the paths to the report files are shown](./images/srd-net-type-reports/srd-net-open-type-report.png)

	> At this step, it is important to ensure that the .NET project that will be used to build the report is one that targets `.NET`. A project that targeted `.NET Framework` would produce an assembly that is not compatible with the Standalone Report Designer for .NET.

1. The next step is building the project. This step will create a new folder in the same directory as the executable file of the Standalone Report Designer for .NET whose name will be the *name of type report*.

![An image of the second step of the Import Code File Wizard where the project is built and the build information is outputed to the GUI](./images/srd-net-type-reports/srd-net-build-type-report-project.png)


## Working with the .NET Type Report in the Report Designer

Once the **Import Code File Wizard** is complete, the imported report will be automatically opened in a new tab in the Standalone Report Designer for .NET application.

When a.NET Type Report is opened in the application, and this is the currently focused tab, a new tab will appear in the toolbar menu - `.NET Report Tools`.

![An image of the .NET Report Tools tab in the Standalone Report Designer for .NET's toolbar](./images/srd-net-type-reports/srd-net-preview-options.png)

- `Rebuild` - This button will trigger a rebuild of the project that was initially used to import the report. The newly generated assemblies of the built project(s) will be copied to the specifically created directory for the type report in the folder with the Standalone Report Designer for .NET executable.
- `Preview with code begind` - This button will trigger a preview of the .NET Type Report with any custom code in its behind included. For example, custom code written in [report events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}) should be respected when previewing through this button.

> Be advised that our algorithm mimics the Visual Studio one only semantically. This means that the initial report modification will introduce significant changes in the serialized code, but the component tree will be preserved. Please use versioning for your reports in order to have clear tracking of the changes. The non-designer partial class files stay intact, so custom code is preserved and ready to work alongside the generated design logic.

## Internal Logic for .NET Type Reports in the Report Designer

While it will appear that the .NET Type Report is being rendered by the Standalone Report Designer for .NET, internally we read and display the report definition as a `TRDP` file.

When the .NET Type Report is initially imported, a dedicated folder for it based on the type name of the report class is created, this folder contains the following files and subfolders:

![An image of the impoted .NET Type Report's automatically created folder with its contents](./images/srd-net-type-reports/srd-net-preview-options.png)

- `bin` - Contains the assembly of the built project of the report and all of its dependant assemblies.
- `{ReportName}.Designer.cs|.vb` - A backup of the `.designer` file that can be used in case our logic fails and the original file is wrongly edited by the application.
- `{ReportName}.json` - A `JSON` file whose contains are the report's type name, the loaded full type, paths to the project file, the designer file, etc.
- `{ReportName}.trdp` - The actual report definition file loaded and displayed by the Standalone Report Designer for .NET. When editing the .NET Type Report from the tab in the designer application, behind-the-scenes, this is the actual file that is being changed, and its contents are later serialized from `XML` to `C#/VB` code in the `.designer` file through the [CodeDOM APIs](https://learn.microsoft.com/en-us/dotnet/api/system.codedom?view=windowsdesktop-9.0). Our code keeps the two files - the original `.designer` and the `TRDP` files in live-sync.

## See Also

* [.NET Coded Report Design, No IDE Strings Attached](https://www.telerik.com/blogs/net-coded-report-design-no-ide-strings-attached
* [How to use Visual Studio Report Designer to edit CS/VB Reports in .NET Projects]({%slug how-to-use-vs-designer-in-dotnet-core%})