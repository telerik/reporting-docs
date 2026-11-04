---
title: Integration with VS Code
page_title: Integration with VS Code
description: Use Telerik Reporting in Visual Studio Code to design reports with the Web Report Designer and scaffold the Native Angular Report Viewer.
slug: integration-with-vs-code
tags: integration, vscode, report, viewer, angular
published: True
position: 1
reportingArea: General
components: [general]
---

# Integration with VS Code

The Telerik Reporting extension for Visual Studio Code provides a quick way to create, open, design, preview, and export Telerik reports without installing the Telerik Reporting MSI. You can begin with a new report, work with an existing report definition, or generate an application that you can continue developing.

## Choose a Starting Point

The following table lists the available starting points:

| Goal | Start here |
|---|---|
| Try Telerik Reporting with a new report | Follow [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code). |
| Edit an existing report definition | Follow [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports). |
| Continue with a complete application | [Generate a Web Report Designer application](#creating-a-web-report-designer-application) as a starting point for further development. |
| Generate report content with a language model | Follow [AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai). |
| Add Reporting to an Angular application | Follow the [Native Angular Report Viewer workflow](#adding-the-native-angular-report-viewer) later in this article. |

## Preparing VS Code

With the Telerik Reporting extension enabled, open a folder in VS Code and trust it only if you trust its contents. The extension requires a file-system workspace; it does not activate in untrusted or virtual workspaces.

The extension hosts the Web Report Designer in Visual Studio Code. It connects the designer to a bundled local Reporting service that supports design and preview operations. The service starts when you open a report and does not require a separate .NET runtime or SDK installation.

Report previews can access files and execute data-source queries. Open and preview reports only from sources that you trust.

Requirements depend on the task:

| Task | Additional setup |
|---|---|
| Design and preview report files in VS Code | No separate Reporting REST service, application project, or .NET SDK is required. Configure data access if the report uses external data. |
| Generate and build a Web Report Designer application | Install the .NET 10 SDK and authenticate to the Telerik NuGet feed. |
| Use AI-assisted report authoring | Provide an available VS Code chat model and any account access or permissions required by its provider. |

The extension does not replace Telerik Reporting licensing. Configure your trial or subscription license as described in [the extension's license setup](slug:reporting-vs-code-configuration-and-reference#configuring-a-license). You do not need to install the MSI to supply a license file.

To run an extension command, open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` and select the command.

## Creating a Web Report Designer Application

The local design experience is sufficient when you want to try Reporting or make a focused change to a report. To create a complete project that you can continue developing, run **Telerik Reporting: Create Project**. The command generates a separate ASP.NET Core application with a Web Report Designer page and its built-in preview.

The generated application is optional. You do not need to generate it before you can create or open a report in the extension. The command creates a new .NET 10 project from the Telerik Reporting Web Report Designer template; it does not add a viewer component to an existing application. Its build requires the .NET 10 SDK and access to the Telerik NuGet feed.

For example, to bring the walkthrough report into a new application:

1. Save `HelloReporting.trdx` in the designer. The generator copies report files from disk, not pending designer edits.
2. Run **Telerik Reporting: Create Project**.
3. If the report selection appears, select `HelloReporting.trdx`. Leave the selection empty to use a sample report instead.
4. Enter `MyReportingApp` as the project name.
5. Choose the parent folder. The command creates `MyReportingApp` inside it; that target folder must be empty or not yet exist.
6. Wait for the build check. On success, select **Open Folder** to open the generated project in a new VS Code window.

Selected reports appear in the generated project's `Reports` folder. The first selected report becomes the page's default report. If you select no reports, the project contains `SampleReport.trdp` instead.

The generator also copies files from the reports' shared-data-source and resource folders into `Reports/Shared Data Sources` and `Reports/Resources`. It does not copy your VS Code settings or Reporting configuration file. Configure connection strings and licensing for the generated application separately.

From a terminal in `MyReportingApp`, start the application:

```bash
dotnet run
```

Open `http://localhost:5294` to use the Web Report Designer in a browser. This application runs independently of the extension's local backend.

If the build check fails, the generated files remain in the target folder. Select **Show Logs** to inspect the cause. Correct the SDK or NuGet access issue, then run `dotnet build` in the generated project; you do not need to generate it again.

## Adding the Native Angular Report Viewer

You can also use the Angular project item generator to add the Native Angular Report Viewer to an Angular application. This workflow is separate from report design in the Web Report Designer. To create an Angular application, run Angular CLI:

```bash
ng new ReportingAngularApp
```

> note The Telerik CLI also includes a complete-app template for the Native Angular Report Viewer. See the [Telerik CLI article](slug:reporting-telerik-cli) for details.

To add the report viewer to your Angular application:

1. In the VS Code Explorer, right-click the target folder and select **New Telerik Reporting Angular Project Item**:

	![VS Code Explorer context menu with the New Telerik Reporting Angular Project Item command.](images/vscode-reporting-angular-new-project.png)

2. If VS Code reports that `@progress/telerik-reporting-schematics` is missing, select **npm i ...** in the prompt:

	![VS Code prompt to install the Telerik Reporting schematics package.](images/telerik-reporting-schematics.png)

3. In the scaffolding wizard, select the Angular component options:

	![Telerik Reporting Angular scaffolding wizard with component options.](images/telerik-reporting-angular-scaffolding-wizard.png)

4. Select **Create** to generate an Angular component with a configured Native Angular Report Viewer:

	![Generated Telerik Reporting Native Angular Report Viewer component in an Angular project.](images/telerik-reporting-angular-report-viewer.png)

5. Add the new component to your routing or to the HTML of an existing component.

## See Also

For related workflows, see:

* [Telerik Reporting in Visual Studio Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode)
* [AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)
* [Adding the Native Angular Report Viewer with the Project Item Generator](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/integrating-with-project-item-generator)
