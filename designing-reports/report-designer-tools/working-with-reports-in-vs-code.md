---
title: Working with Reports in VS Code
page_title: Create and Edit Reports in VS Code | Telerik Reporting
description: Learn how to create, edit, preview, and export Telerik Reporting reports in Visual Studio Code with the Web Report Designer extension.
slug: telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code
tags: reporting, vscode, report, designer
published: True
position: 2
reportingArea: General
components: [general]
---

# Working with Reports in VS Code

This tutorial shows how to create or open a report in Visual Studio Code. You add content, save the report, preview it, and export the rendered document.

You do not need a database for this walkthrough. The example uses static report content so that the first preview does not depend on a connection string, credentials, or database access. If you already have a report, open it instead of creating the example.

## Preparing the Workspace

Complete the setup in [Integration with VS Code](slug:integration-with-vs-code#preparing-vs-code), then open a workspace folder that you trust in VS Code.

For this example, create a folder named `ReportingPlayground` and open it with **File** > **Open Folder**. Store the report in this folder so its definition and exported output are together.

Open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` when a step names an extension command.

## Creating or Opening a Report

Choose one of the following entry points: create a report from scratch or open an existing report. Both paths open the Web Report Designer hosted by Visual Studio Code.

### Creating the Example Report

Create the report file before you add its contents:

1. Run **Telerik Reporting: Create New Report**.
2. Save the file as `HelloReporting.trdx` in `ReportingPlayground`.
3. Wait for the designer to open in a VS Code tab.

The command creates an empty XML report definition with a page header, detail section, and page footer. The extension starts its bundled local Reporting service automatically.

### Opening an Existing Report

Open a `.trdp`, `.trdx`, or `.trdj` file from the VS Code Explorer. Alternatively, run **Telerik Reporting: Open Report Designer** and select the file. If another editor opens the file, use **Reopen Editor With** and select **Telerik Report Designer**.

Copy the report before you experiment if you need to preserve the original. Keep any referenced shared data sources and resources available as well. If the report requires a named database connection, follow [the data-connection example](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection) before you preview it.

## Adding Report Content

Add a **TextBox** to the report's page header. A page header can display a fixed message without a data source.

To add the message:

1. Drag a **TextBox** from the **Components** panel to the page header.
2. Select the text box and set **Value** in the **Properties** panel to `Hello from Telerik Reporting`.
3. Resize the text box so that the complete value is visible.

For other items and layout tools, see [the Web Report Designer user guide](slug:user-guide/overview).

For an existing report, make a visible change to a fixed heading. This change lets you verify the next preview without changing the report's data query.

## Saving the Report

Save the report from the designer with `Ctrl`+`S` on Windows or Linux, or `Cmd`+`S` on macOS. Confirm that `HelloReporting.trdx` exists in `ReportingPlayground` before you continue.

The report file contains the text box definition, not a rendered document. Preview processes that definition to produce pages that you can read or export.

## Previewing the Report

Design-time preview renders the report so that you can verify layout and content. Use the designer's built-in preview, or open a separate Report Viewer beside the designer.

Preview does not add a report viewer to your application. To generate a separate Web Report Designer application, follow [the application-generation example](slug:integration-with-vs-code#creating-a-web-report-designer-application).

### Previewing Inside the Designer

Select **Preview** in the designer. Confirm that the rendered page displays `Hello from Telerik Reporting` in its header.

If you preview an existing report, rendering can also execute its data-source queries. A connection error at this stage can indicate missing configuration rather than a problem with the layout.

### Keeping a Viewer Beside the Designer

Run **Telerik Reporting: View Report** with the report open in the designer. The command opens a viewer tab beside it. You can also right-click a report in the Explorer and select the same command.

The separate viewer renders the report saved on disk. If the designer has pending edits, choose **Save and View** to include them or **View Saved Version** to leave them unsaved.

For reports that define visible parameters, use the viewer's parameter controls to choose values and render the report. The empty example does not define parameters, so it has no parameter values to enter.

## Verifying a Report Change

Return to the designer and update the report:

1. Change the **TextBox** value to `My first Telerik report`.
2. Save the report.
3. Select **Preview** again or inspect the separate viewer. Confirm that the rendered document displays the updated value.

An open viewer refreshes after the save when `telerik-reporting.liveViewerRefresh` is `true`, which is the default. This example verifies the complete edit, save, and render cycle without introducing a data-source dependency.

## Exporting the Result

Export creates a rendered document, such as a PDF, rather than a copy of the report definition. Use the viewer's export menu to create an output file:

1. Select **PDF** from the export options.
2. In the VS Code save dialog, choose a destination and select **Export**.
3. Select **Open File** in the completion notification to inspect the result.

The suggested file name is `HelloReporting.pdf`, beside the report definition. You can choose another name or folder. Confirm that the exported file contains `My first Telerik report`. The `.trdx` file remains available for further edits.

## Reopening the Report

Close the designer tab, then reopen `HelloReporting.trdx` from the workspace. Confirm that the latest **TextBox** value is preserved. The report definition contains your saved changes, so you can continue to edit it after you export a document.

## Preserving or Discarding Changes

Use the VS Code **Save As** command to save a copy under another name. This operation first saves the current report, then copies it to the destination. To keep the original unchanged, copy it before you edit.

To undo all pending edits, run **File: Revert File** from the **Command Palette**. The designer reloads the last saved report. Revert does not undo changes that you already saved.

>important Save reports before you reload or close VS Code. The extension's recovery backup contains the last saved report, not pending edits in the designer.

## Next Steps

To continue beyond the database-free workflow, use [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference). It explains how to configure a named connection, change report paths, provide a license, and use the extension's commands and settings.

To host the designer outside VS Code, return to [the application-generation example](slug:integration-with-vs-code#creating-a-web-report-designer-application).

## See Also

For related guidance, see:

* [Report Designer Tools Overview](slug:telerikreporting/designing-reports/report-designer-tools/overview)
* [Report File Formats](slug:report-file-formats)
* [VS Code Extension Workflows](slug:integration-with-vs-code)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)
* [Adding and Configuring Report Items](slug:user-guide/components/report-items)