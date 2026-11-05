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

The report definition remains a file in your repository. If you edit a shared copy, your saved changes affect every application that uses that file. Copy the report before you start when you need to preserve the original.

## Opening the Existing Workspace

Open the folder that contains the report as a trusted VS Code workspace. The workspace provides the base for report discovery, configuration, shared data sources, and resources.

Open a `.trdp`, `.trdx`, or `.trdj` file from the Explorer. If another editor opens it, select **Reopen Editor With** and choose **Telerik Report Designer**. You can also run **Telerik Reporting: Open Report Designer** from the **Command Palette**.

## Resolving Report Dependencies

Suppose an existing invoice report opens correctly in the designer, but preview fails because the SQL connection used by the original application is not available to the VS Code backend. The report itself can still be valid; the backend needs access to dependencies that the application normally provides.

The extension starts its own local backend. It does not automatically reuse the original application's resolver, assemblies, credentials, or runtime configuration. Depending on the report, you might need to provide the following dependencies:

* A named connection from [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection).
* The reports, shared data sources, and resources directories described in [Organizing Reports and Resources](slug:reporting-vs-code-configuration-and-reference#organizing-reports-and-resources).
* Credentials stored outside configuration files that you commit to source control.

The bundled backend uses a report resolver rooted at its effective reports directory. It does not automatically load a custom resolver or user assemblies from the original application. If the report depends on custom runtime types or a custom resolver, use the VS Code preview for the parts that the bundled backend supports and verify the complete report in the original application.

## Adding a License

A missing or invalid license can produce warnings and watermarks when the backend processes a report. Follow [the license setup instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) to use a per-user license or an explicit license path. Do not commit a personal license file to the report repository.

AI-assisted report generation requires a valid Telerik Reporting Subscription or Trial license. The language model provider has separate authentication and usage requirements, which are explained in [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai).

## Editing and Previewing the Report

Preview the report before you change it. This check establishes which connections, resources, and report parameters the local backend can resolve:

1. Open the report in the designer.
2. Run **Telerik Reporting: View Report**.
3. Select values for any visible report parameters.
4. Confirm that the rendered report matches the expected output.
5. Return to the designer and make a focused change.
6. Save the report and verify the updated rendering.

The separate viewer renders the report saved on disk. If the designer has pending edits, select **Save and View** to include them or **View Saved Version** to leave them unsaved. When `telerik-reporting.liveViewerRefresh` is enabled, the viewer refreshes after you save.

Because the extension backend can use different configuration, assemblies, permissions, and data from your application, run the report in its original application before you commit the change.

## Saving or Reverting Changes

Use **File** > **Save As** to create a copy before you experiment. The extension saves the current report before it copies the file. To keep the original unchanged, make the copy before editing.

To discard pending designer changes, run **File: Revert File** from the **Command Palette**. The designer reloads the last saved report. Revert does not undo changes that you already saved, and the extension's recovery backup also contains only the last saved report.

Use source control to review the report definition and any intentional supporting-file changes before you commit them.

## Using AI with an Existing Report

AI-assisted design can help you extend an existing layout. For example, submit a focused request such as the following:

```text
Add an overdue-payment section below the invoice totals. Include a heading,
explanatory text, and a warning style that appears only when the outstanding
amount is greater than zero.
```

Before you generate content, make a valid Telerik Reporting Subscription or Trial license available to the backend and select a model that Visual Studio Code exposes. Review the provider's data-handling and usage terms before you send report content.

Treat generated content as a starting point rather than a finished report. Check that expressions reference the expected fields, then preview the report with representative data. Also review any generated layout, styling, localization, and accessibility changes that matter to the report.

The [AI-assisted design article](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) explains model access, licensing, and review steps in detail.

## Next Steps

To try the complete report-authoring cycle without existing dependencies, see [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code). Use [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference) when you need connection, path, credential, command, or setting details.