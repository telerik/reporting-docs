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

The Telerik Reporting extension lets you try report design directly in Visual Studio Code without installing the Telerik Reporting MSI. Create a report, change an existing layout, and preview or export its output in the editor. You do not need to create an application first.

For example, you can build a small report to explore the designer before you choose how to integrate Reporting into your application. If you already have report files, open them in the same environment instead.

The extension also generates standalone Web Report Designer applications and connects the designer's AI features to a language model available in VS Code. Angular viewer scaffolding remains a separate, supported workflow, described at the end of this article.

## Preparing VS Code

With the Telerik Reporting extension enabled, open a folder in VS Code and trust it only if you trust its contents. The extension requires a file-system workspace; it does not activate in untrusted or virtual workspaces.

When you open a report, the extension starts a bundled local backend that runs the Web Report Designer and processes report previews. You do not need to install a separate .NET runtime or SDK for this packaged backend. Report previews can access files and execute data-source queries, so workspace trust matters even when you do not build an application.

Requirements depend on the task:

| Task | Additional setup |
|---|---|
| Design and preview report files in VS Code | No separate Reporting REST service, application project, or .NET SDK is required. Configure data access if the report uses external data. |
| Generate and build a Web Report Designer application | Install the .NET 10 SDK and authenticate to the Telerik NuGet feed. |
| Use AI-assisted report authoring | Provide an available VS Code chat model and any account access or permissions required by its provider. |

The extension does not replace Telerik Reporting licensing. Configure your trial or subscription license as described in [the extension's license setup](slug:reporting-vs-code-configuration-and-reference#configuring-a-license). You do not need to install the MSI to supply a license file.

To run an extension command, open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` and select the command.

## Trying Report Design

Choose a starting point based on whether you already have a report. Both paths lead to a designer tab in VS Code:

* To start without a database, run **Telerik Reporting: Create New Report** and save a `.trdx` file in your workspace. Add a fixed message, save, and preview it.
* To work with an existing report, open a `.trdp`, `.trdx`, or `.trdj` file from the Explorer. Alternatively, run **Telerik Reporting: Open Report Designer** and choose the file.

Follow [the report-authoring walkthrough](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code) for a complete example that ends with a PDF. It also explains the built-in preview, a side-by-side viewer, save behavior, and changes to existing reports.

You can leave directory and connection settings at their defaults for the fixed-message example. For a report that uses a named database connection, follow [the configuration example](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection) before you preview it.

## Creating a Web Report Designer Application

After you try the designer in VS Code, you may want to host the same design experience in your own web application. **Telerik Reporting: Create Project** generates a separate ASP.NET Core application with a Web Report Designer page and its built-in preview.

This command does not add a viewer component to an existing application. It creates a new .NET 10 project from the Telerik Reporting Web Report Designer template. Unlike local report design, its build needs the .NET 10 SDK and access to the Telerik NuGet feed.

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

## Using AI-Assisted Authoring

The designer's AI report generator uses a chat model supplied through VS Code. For example, you can ask it to add a heading, then review and adjust the generated items on the design surface.

To choose the provider and model:

1. Sign in to a provider such as GitHub Copilot, or enable another VS Code extension that supplies chat models.
2. Run **Telerik Reporting: Select AI Language Model** and select an available model.
3. Use the designer's AI report generator, review its changes, and preview the report before you save the result.

The extension remembers the selection in `telerik-reporting.ai.model`. If you have not selected a model, the first AI request prompts you to choose one. Run the selection command again to change it.

>important AI requests, including report content supplied to the AI generator, go to the selected model provider. Review its data-handling terms before you use sensitive reports or data.

Model access is optional for manual report design. For all available extension commands, settings, and recovery steps, see [the configuration and reference guide](slug:reporting-vs-code-configuration-and-reference).

## Adding the Native Angular Report Viewer

Use the Angular project item generator to add the Native Angular Report Viewer to an Angular application. To create an Angular application, run Angular CLI:

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

* [Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)
* [Adding the Native Angular Report Viewer with the Project Item Generator](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/integrating-with-project-item-generator)
