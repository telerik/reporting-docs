---
title: Troubleshooting
page_title: Troubleshooting Visual Studio Report Designer Problems
description: "Learn how to troubleshoot Visual Studio-related problems, what are the most common Visual Studio Report Designer issues, and how to fix them."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems
tags: visual,studio,report,designer,problems
published: True
position: 41
previous_url: /troubleshooting-visual-studio-problems
reportingArea: General
components: [general]
---

# Troubleshooting Visual Studio Report Designer

>note The Visual Studio Report Designer for .NET is available as a preview starting with Telerik Reporting 2026 Q3 (20.2.26.1007).

Use the section for your designer. The Visual Studio Report Designer for .NET is installed through NuGet packages. Its problems differ from the problems of the Telerik Reporting Visual Studio extension and its .NET Framework designer.

## Troubleshooting the .NET Designer

Start with [Getting Started with the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-getting-started) to verify the prerequisites, the packages, and the project configuration.

### The Designer Does Not Open

Check the following requirements:

* Visual Studio 2026 version 18.10 or later with the **.NET desktop development** workload is installed. To check your version, select **Help** > **About Microsoft Visual Studio**. Visual Studio 2022 and earlier versions of Visual Studio 2026 cannot load the designer.
* The report project is an SDK-style project that targets `net8.0-windows` or later and sets `UseWindowsForms` to `true`.
* The .NET Desktop Runtime of the .NET version that the project targets is installed. For example, a project that targets `net8.0-windows` requires the .NET 8 Desktop Runtime.
* The project references the `Telerik.Reporting.VSDesigner` and `Telerik.Reporting` packages of exactly the same version.
* A configured package source provides that version. If the `nuget.config` file of your solution clears or maps the package sources, it must include and map that source.
* The packages restore without errors, and the project builds.
* You open the report's main `.cs` file for C# or `.vb` file for VB, not its `.Designer.cs` or `.Designer.vb` file, with **View Designer** or `Shift+F7`.

If double-click opens the code editor, use **View Designer**. For details about the double-click behavior, see [Opening a Report](slug:vs-report-designer-net-getting-started#opening-a-report).

### The Previous Designer Build Still Loads

NuGet caches every package version that it restores, and Visual Studio keeps shadow copies of the designer assemblies. If you install a different build that has the same version number, Visual Studio can continue to load the previous build.

To load the new build:

1. Close all instances of Visual Studio.
1. Find the NuGet global packages folder by running the following command. By default, the folder is `%USERPROFILE%\.nuget\packages`.

   ```powershell
   dotnet nuget locals global-packages --list
   ```

1. In the global packages folder, delete the version subfolder of each Telerik Reporting package that the project references, for example, `telerik.reporting\{{site.buildversion}}` and `telerik.reporting.vsdesigner\{{site.buildversion}}`.
1. Delete the contents of the `%LOCALAPPDATA%\Microsoft\VisualStudio\18.0_<ID>\WinFormsDesigner` folder, where `<ID>` identifies your Visual Studio 2026 installation. If you have more than one `18.0_<ID>` folder, clear the `WinFormsDesigner` folder in each of them.

   This folder contains the shadow copies of all WinForms designers. Visual Studio creates them again when you open a designer.

1. Open the solution, build the project, and open the report in the designer.

If the new build has a different version number, you do not need to clear the caches. Close Visual Studio, and then follow the steps in [Updating the Designer Package](slug:vs-report-designer-net-getting-started#updating-the-designer-package).

### The Preview Build Fails

To preview a report, the designer builds the report project. Fix the build errors of the project before you retry the preview. If the designer reports that the preview build failed, select **View** > **Output** in Visual Studio. In **Show output from**, select **Telerik Reporting Preview** to see the detailed build output.

For more information about previewing reports, setting report parameters, and exporting, see [Previewing Reports in the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-preview).

### Expected Differences from the .NET Framework Designer

The following differences are by design and are not installation problems:

* The `Telerik.Reporting.VSDesigner` package does not supply Visual Studio project, item, or report templates. Start with an existing coded report.
* The package does not install the **Telerik** menu of the Visual Studio extension. To open Report Explorer, Data Explorer, or Group Explorer, right-click the report design surface and select **View** > the explorer.
* The designer does not provide an **Html Preview** tab. The **Preview** tab does not provide a document map.
* The **Preview** tab opens the report parameters and the export options in the **Report Parameters** and **Export Report** dialogs.
* The [Upgrade Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard) does not upgrade .NET projects. Update the package references instead.

For a comparison of the supported features and workflows, see [Comparing the Designers](slug:visual-studio-report-designer-structure#comparing-the-designers).

### Collecting Designer Diagnostics

To collect a trace of a .NET designer issue:

1. Close all instances of Visual Studio.
1. Open PowerShell and enable the trace by running the following command:

   ```powershell
   $env:TELERIK_REPORTING_DESIGNER_DEBUG = 'trace'
   ```

1. Start Visual Studio from the same PowerShell window by running the following command:

   ```powershell
   & (& "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -version '[18.10,19.0)' -latest -property productPath)
   ```

1. Open the project and reproduce the issue.
1. Close Visual Studio and collect the `%TEMP%\TelerikReportDesigner.log` and `%TEMP%\TelerikReportDesigner.client.log` files.

To write the logs to another location, set the `TELERIK_REPORTING_DESIGNER_LOG` environment variable to the full path of the log file before you start Visual Studio. The designer writes the second log to the same folder and adds `.client` before the file extension. The folder (`C:\Logs\` in the example below) must exist, and the designer won't create it if it does not.

```powershell
$env:TELERIK_REPORTING_DESIGNER_LOG = 'C:\Logs\TelerikReportDesigner.log'
```

The variables apply only to the Visual Studio instance that you start from that PowerShell window. To stop tracing, close the window and start Visual Studio as usual.

The logs can contain report data and file paths. Review the logs before you attach them to a support ticket. In the ticket, include the Visual Studio version, the package version, the target framework of the project, and the steps to reproduce the issue.

## Troubleshooting the .NET Framework Designer

The following sections apply to the installed Telerik Reporting Visual Studio extension and its .NET Framework designer.

### Visual Studio Crashes

When Visual Studio crashes while working with Telerik Reporting, for example, when opening a Report in the [Visual Studio Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview). The way to determine what has caused the problem is described in the following steps:

- Upgrade to the latest version of the product in case the reason for the crash has been fixed.
- Try to reproduce the crash on another machine to exclude machine-specific problems e.g., corrupted Telerik Reporting installation.
- Provide us with a log file containing detailed information about the Visual Studio crash. To create the log file, turn on tracing for the Visual Studio IDE and perform the actions that caused the crash. Below is the XML you need to add to the `devenv.exe.config` file to enable tracing:

	{{source=CodeSnippets\MvcCS\XmlConfiguration\TroubleshootingVisualStudioReportDesigner.xml region=VisualStudioCrashes}}

	The `devenv.exe.config` file resides in `C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE` by default (it is recommended to create a backup copy before modifying it).

- Start Visual Studio with the log switch: [/Log (devenv.exe)](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2015/ide/reference/log-devenv-exe?view=vs-2015) which could also provide more info on the error.
- Check the event viewer logs for any logs that could provide more info about the problem.
- Attach to the `devenv.exe` running process with another Visual Studio instance, to pinpoint where the error occurs.

After you generate the log files from the above steps, archive them and attach them to a support ticket. Include the steps which have to be followed to reproduce the issue.

### The Report Cannot Be Built and Opened in Visual Studio Report Designer

Please refer to the information from the following KB article: [The report cannot be built and opened in Visual Studio Report Designer](slug:report-cannot-be-built-and-opened-in-vs-report-designer)

### The Visual Studio Report Designer Is Blank

Please refer to the information from the following KB article: [The Visual Studio Report Designer is blank](slug:vs-report-designer-is-blank)

### Missing Telerik Menu in Visual Studio

Please refer to the information from the following KB article: [Missing Telerik menu in Visual Studio](slug:missing-telerik-menu-in-visual-studio)

### Visual Studio Missing Telerik Reporting Toolbox Items

Please refer to the information from the following KB article: [Telerik Reporting Toolbox items are missing.](slug:telerik-reporting-toolbox-items-are-missing)

### Visual Studio Missing Telerik Reporting Item Template

Please refer to the information from the following KB article: [Telerik Reporting Item Template is missing.](slug:telerik-reporting-missing-in-visual-studio)

## See Also

* [Getting Started with the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-getting-started)
* [Previewing Reports in the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-preview)
* [Structure of the Visual Studio Report Designer](slug:visual-studio-report-designer-structure)
