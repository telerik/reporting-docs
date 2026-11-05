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

The Telerik Reporting extension lets you design and preview reports directly in Visual Studio Code without installing the Telerik Reporting MSI. You can also generate a standalone Web Report Designer application or add the Native Angular Report Viewer to an Angular application.

## Designing Reports in VS Code

Use the hosted Web Report Designer when you want to create a report, continue working with an existing report definition, or use AI-assisted report authoring. The extension starts a bundled local Reporting service for design and preview, so you do not need to create an application or configure a separate Reporting REST service first.

Start with [Telerik Reporting in Visual Studio Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode) to choose between the getting-started, existing-report, AI-assisted, and configuration workflows.

## Preparing VS Code

With the Telerik Reporting extension enabled, open a folder in VS Code and trust it only if you trust its contents. The extension requires a file-system workspace; it does not activate in untrusted or virtual workspaces.

When you open a report, the extension starts its bundled local Reporting service. The packaged service does not require a separate .NET runtime or SDK installation. Because report preview can access files and execute data-source queries, open and preview reports only from sources that you trust.

Requirements depend on the task:

* Local report design and preview use the backend included with the extension. You do not need a separate Reporting REST service, application project, or .NET SDK. Configure data access if the report uses external data.
* Creating a standalone Web Report Designer application requires the .NET 10 SDK and access to the Telerik NuGet feed.
* AI-assisted report generation requires a valid Telerik Reporting Subscription or Trial license and a compatible language model available through Visual Studio Code.
* The Native Angular Report Viewer workflow requires supported Angular tooling and a Reporting REST service.

The extension does not replace Telerik Reporting licensing. Configure your trial or subscription license for the local backend as described in [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license).

To run an extension command, open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` and select the command.

## Creating a Web Report Designer Application

The local design experience is sufficient when you want to try Reporting or make a focused report change. When you need a complete project that you can continue developing, run **Telerik Reporting: Create Project**. The command generates a separate ASP.NET Core application with a Web Report Designer page and its built-in preview.

The generated application is optional. You do not need it before you can create or open a report in the extension. The command creates a new .NET 10 project from the Telerik Reporting Web Report Designer template; it does not add a viewer component to an existing application. Building the generated project requires the .NET 10 SDK and access to the Telerik NuGet feed.

For example, to bring the getting-started report into a new application:

1. Save `HelloReporting.trdx` in the designer. The generator copies report files from disk, not pending designer edits.
2. Open the **Command Palette** and run **Telerik Reporting: Create Project**.
3. If the report selection appears, select `HelloReporting.trdx`. Leave the selection empty to use a sample report instead.
4. Enter `MyReportingApp` as the project name.
5. Choose the parent folder. The command creates `MyReportingApp` inside it. The target folder must be empty or not exist.
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

You can also use the Angular project item generator to add the Native Angular Report Viewer to an Angular application. This workflow is separate from report design in the Web Report Designer.

To create an Angular application, run Angular CLI:

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

Continue with the documentation for the workflow you selected:

* [Telerik Reporting in Visual Studio Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)
* [Adding the Native Angular Report Viewer with the Project Item Generator](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/integrating-with-project-item-generator)
