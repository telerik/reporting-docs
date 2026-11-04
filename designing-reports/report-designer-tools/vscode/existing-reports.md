---
title: Working with Existing Reports in VS Code
page_title: Working with Existing Telerik Reports in VS Code
description: Open an existing Telerik report in Visual Studio Code, configure supported dependencies, preview changes, and verify the result in its original application.
slug: telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports
tags: reporting, vscode, report, designer
published: True
position: 2
reportingArea: General
components: [general]
---

# Working with Existing Reports in VS Code

Use the Web Report Designer hosted in Visual Studio Code to edit reports from an existing Telerik Reporting application or repository. You can preview and change a report definition without changing the application code that normally hosts it.

The report definition is still a file in your repository. If you edit a shared copy, your saved changes affect every application that uses that file. Copy the report first when you need to preserve the original.

## Opening the Existing Workspace

Open the folder that contains the report as a trusted VS Code workspace. The workspace provides the base for report discovery, configuration, shared data sources, and resources.

Open a `.trdp`, `.trdx`, or `.trdj` file from the Explorer. If another editor opens it, select **Reopen Editor With** and choose **Telerik Report Designer**. You can also run **Telerik Reporting: Open Report Designer** from the Command Palette.

## Resolving Report Dependencies

An existing report can rely on data connections, shared data sources, resources, or application-specific code. The extension starts its own local backend; it does not automatically reuse the resolver, assemblies, credentials, or runtime configuration from your application.

Configure the dependencies supported by the extension before you preview the report:

* Add a named connection in [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection).
* Set the reports, shared data sources, and resources directories in [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#organizing-reports-and-resources).
* Keep credentials outside configuration files that you commit to source control.

The bundled backend uses a report resolver rooted at its effective reports directory. It does not automatically load a custom resolver or user assemblies from the original application. If a report depends on custom runtime types or a custom resolver, verify it in the original application as well.

## Adding a License

A missing or invalid license can produce warnings and watermarks when the backend processes a report. Follow [the license setup instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) to use a per-user license or an explicit license path. Do not commit a personal license file to the report repository.

AI-assisted report generation requires a valid Telerik Reporting Subscription or Trial license. The language model provider has separate authentication and usage requirements. See [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai).

## Editing and Previewing the Report

Preview the report before you change it. This confirms which connections, resources, and report parameters the local backend can resolve:

1. Open the report in the designer.
2. Run **Telerik Reporting: View Report**.
3. Select values for any visible report parameters.
4. Confirm that the rendered report matches the expected output.
5. Return to the designer and make a focused change.
6. Save the report and verify the updated rendering.

The separate viewer renders the report saved on disk. If the designer has pending edits, select **Save and View** to include them or **View Saved Version** to leave them unsaved. When `telerik-reporting.liveViewerRefresh` is enabled, the viewer refreshes after you save.

The extension backend can use different configuration, assemblies, permissions, and data from your application. Run the report in its original application before you commit a report change.

## Saving or Reverting Changes

Use **File** > **Save As** to create a copy before you experiment. The extension saves the current report before it copies the file. To keep the original unchanged, make the copy before editing.

To discard pending designer changes, run **File: Revert File** from the Command Palette. The designer reloads the last saved report; Revert does not undo changes you already saved. The extension's recovery backup also contains only the last saved report.

Use source control to review the report-definition changes and any intentional supporting-file changes before you commit them.

## Using AI with an Existing Report

AI-assisted design can help you extend an existing layout. For example, you can ask the selected model to add an overdue-payment section below an invoice's totals, with a warning that appears only when the outstanding amount is greater than zero.

Before you generate content, make a valid Telerik Reporting Subscription or Trial license available to the backend and select a model that Visual Studio Code exposes. Review the provider's data-handling and usage terms before you send report content. The [AI-assisted design article](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) explains model access, licensing, and review steps.

## Next Steps

For a complete report example, see [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code). For connections, paths, credentials, and all extension settings, see [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference).