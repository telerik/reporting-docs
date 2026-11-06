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

Use this workflow when an existing Telerik Reporting application or source repository already contains the report you want to change. You might correct an invoice heading, adjust a dashboard layout, or check a report change before committing it.

Open the report definition in the hosted Web Report Designer without changing the application code that normally hosts it. The extension previews reports with its own local Reporting service. A report can open even when that service lacks dependencies from the original application.

The report definition remains a file in your repository. If the file is shared, saved changes affect every application that uses it. Create a separate copy before editing when you need to preserve the repository version.

## Opening the Existing Workspace

Open the folder that contains the report as a trusted VS Code workspace. The workspace gives the extension access to local configuration, shared data sources, and resources that the report may need.

Open a `.trdp`, `.trdx`, or `.trdj` file from the Explorer. If another editor opens it, select **Reopen Editor With** and choose **Telerik Report Designer**. You can also run **Telerik Reporting: Open Report Designer** from the **Command Palette**.

## Resolving Report Dependencies

Suppose an invoice report opens in the designer, but preview fails. The local Reporting service may not have access to the SQL connection available to the original application. The report can still be valid because opening its definition does not require every connection or runtime type needed to process it.

The extension uses its own local Reporting service. It does not inherit the original application's connections, credentials, assemblies, or runtime configuration. Before previewing, check whether the report depends on configuration you can reproduce locally:

* A named connection from [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection).
* Shared data sources and resources from [Organizing Reports and Resources](slug:reporting-vs-code-configuration-and-reference#organizing-reports-and-resources).
* Credentials stored outside configuration files that you commit to source control.

Some applications also use custom report resolvers or assemblies that define runtime types. A custom resolver determines how the service maps a report name or identifier to a report definition. An application can replace default file lookup with custom logic. The extension does not load these application components automatically, so local preview may not reproduce the complete application behavior.

The effective reports root determines where the local Reporting service looks for report files and relative resources. See [Organizing Reports and Resources](slug:reporting-vs-code-configuration-and-reference#organizing-reports-and-resources) to configure it.

If preview shows a missing or invalid license, follow [the license setup instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) before judging the output. A license issue can produce warnings or watermarks that are separate from the report's design. Keep personal license files out of the repository.

## Editing and Previewing the Report

Before changing the report, preview its current version. This baseline helps you separate a missing local dependency from a problem introduced by your edit.

If the original version does not render, identify the missing dependency before changing the definition. Configure dependencies the local Reporting service supports, such as connections and resources. Use the original application for complete verification when the report depends on application-specific behavior that the extension cannot reproduce.

To establish the baseline in the local viewer, follow these steps:

1. Open the report in the designer.
2. Run **Telerik Reporting: View Report**.
3. Select values for any visible report parameters.
4. Confirm that the rendered report matches the expected output.
5. Return to the designer and make a focused change.
6. Save the report and verify the updated rendering.

The separate viewer renders the report saved on disk. If the designer has pending edits, select **Save and View** to include them or **View Saved Version** to leave them unsaved. When `telerik-reporting.liveViewerRefresh` is enabled, the viewer refreshes after you save.

Before committing, preview the saved change in the original application. Its configuration, assemblies, permissions, and data can differ from the extension's local service, so this check confirms the report in its actual hosting environment.

## Saving or Reverting Changes

To work on a copy, use **File** > **Save As** before your first edit. The extension saves the open report before copying it, so a copy made after editing does not preserve the repository version.

To discard pending designer changes, run **File: Revert File** from the **Command Palette**. The designer reloads the last saved report. Revert does not undo changes that you already saved, and the extension's recovery backup also contains only the last saved report.

Use source control to review the report definition and any intentional supporting-file changes before you commit them.

## Using AI with an Existing Report

Use AI-assisted design when you want to add or revise report content from a prompt. It changes the same report definition as manual editing, so you can inspect, edit, preview, save, and version the result in the usual way. For example, request a focused change such as the following:

```text
Add an overdue-payment section below the invoice totals. Include a heading,
explanatory text, and a warning style that appears only when the outstanding
amount is greater than zero.
```

Before you generate content, make the required Telerik Reporting license available to the local Reporting service and select a model that Visual Studio Code exposes. Review the provider's data-handling and usage terms before you send report content.

Treat generated content as a starting point rather than a finished report. Check that expressions reference the expected fields, then preview the report with representative data. Also review any generated layout, styling, localization, and accessibility changes that matter to the report.

The [AI-assisted design article](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) explains model access, licensing, and review steps in detail.

## Next Steps

To try the complete report-authoring cycle without existing dependencies, see [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code). Use [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference) when you need connection, path, credential, command, or setting details.