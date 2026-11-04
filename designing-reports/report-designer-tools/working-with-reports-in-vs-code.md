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

The Web Report Designer in VS Code lets you change a report and inspect its output without leaving the editor. This walkthrough creates a report with a short message, previews the result, and exports a PDF. It does not require a database or an application project.

If you already have a report, open it instead of creating the example. Both paths use the same designer, save operations, and preview tools.

## Preparing the Workspace

Enable the Telerik Reporting extension and open a folder that you trust in VS Code. For extension prerequisites and licensing guidance, see [the VS Code integration overview](slug:integration-with-vs-code#preparing-vs-code).

For this example, create a folder named `ReportingPlayground` and open it with **File** > **Open Folder**. Store the report in this folder so its definition and exported output are together.

Open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` when a step names an extension command.

## Creating or Opening a Report

Choose the starting point that matches your task. A new report demonstrates the complete workflow without external data; an existing report lets you work with your own layout.

### Creating the Example Report

Create the report file before you add its contents:

1. Run **Telerik Reporting: Create New Report**.
2. Save the file as `HelloReporting.trdx` in `ReportingPlayground`.
3. Wait for the designer to open in a VS Code tab.

The command creates an empty XML report definition with a page header, detail section, and page footer. The extension starts its bundled backend automatically; you do not need to start a separate Reporting REST service.

### Opening an Existing Report

Open a `.trdp`, `.trdx`, or `.trdj` file from the VS Code Explorer. Alternatively, run **Telerik Reporting: Open Report Designer** and select the file. If another editor opens the file, use **Reopen Editor With** and select **Telerik Report Designer**.

Copy the report before you experiment if you need to preserve the original. Keep any referenced shared data sources and resources available as well. If the report requires a named database connection, follow [the data-connection example](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection) before you preview it.

## Making a Visible Change

In the example report, add a text box to the page header. A page header can display a fixed message without a data source, so this example separates report design from database setup.

To add the message and save the report:

1. Drag a **TextBox** from the **Components** panel to the page header.
2. Select the text box and set **Value** in the **Properties** panel to `Hello from Telerik Reporting`.
3. Widen the text box if the message does not fit.
4. Press `Ctrl`+`S` on Windows or Linux, or `Cmd`+`S` on macOS.

The report file now contains the text box definition, not a rendered document. Preview processes that definition to produce pages that you can read or export.

For other items and layout tools, see [the Web Report Designer user guide](slug:user-guide/overview). The VS Code editor hosts that designer; you do not need a different set of report items.

For an existing report, make a similarly visible change to a fixed heading and save it. A heading change lets you confirm that the next preview reflects your edit without changing the report's data query.

## Comparing the Preview Options

The designer's built-in preview and the separate Report Viewer both render report pages. Use the built-in preview to switch between layout and output, or open the viewer beside the designer to compare them.

### Previewing Inside the Designer

Select **Preview** in the designer. For the example, the rendered page displays `Hello from Telerik Reporting` in its header. Return to the design surface to change the text or its appearance.

If you preview an existing report, rendering can also execute its data-source queries. A connection error at this stage can indicate missing configuration rather than a problem with the layout.

### Keeping a Viewer Beside the Designer

Run **Telerik Reporting: View Report** with the report open in the designer. The command opens a viewer tab beside it. You can also right-click a report in the Explorer and select the same command.

The separate viewer renders the report saved on disk. If the designer has pending edits, choose **Save and View** to include them or **View Saved Version** to leave them unsaved.

For the example, change the text to `Hello again from Telerik Reporting` and save. An open viewer refreshes after the save when `telerik-reporting.liveViewerRefresh` is `true`, which is the default. The rendered heading changes to the new message.

For reports that define visible parameters, use the viewer's parameter controls to choose values and render the report. The empty example does not define parameters, so it has no parameter values to enter.

## Exporting the Result

Export creates a rendered document, such as a PDF, rather than a copy of the report definition. Use the viewer's export menu to create an output file:

1. Select **PDF** from the export options.
2. In the VS Code save dialog, choose a destination and select **Export**.
3. Select **Open File** in the completion notification to inspect the result.

The suggested file name is `HelloReporting.pdf`, beside the report definition. You can choose another name or folder. The PDF contains the message from the rendered report; the `.trdx` file remains available for further edits.

## Preserving or Discarding Changes

Use the VS Code **Save As** command to save a copy under another name. This operation first saves the current report, then copies it to the destination. To keep the original unchanged, copy it before you edit.

To undo all pending edits, run **File: Revert File** from the **Command Palette**. The designer reloads the last saved report. Revert does not undo changes that you already saved.

>important Save reports before you reload or close VS Code. The extension's recovery backup contains the last saved report, not pending edits in the designer.

## Continuing with Your Own Reports

The same edit, save, preview, and export cycle applies to data-bound reports. Connect a report to your data and add parameters when you need output beyond the fixed-message example.

Use [the configuration guide](slug:reporting-vs-code-configuration-and-reference) for named connections, shared resources, and licensing. Use [the extension overview](slug:integration-with-vs-code#creating-a-web-report-designer-application) when you are ready to generate an application that hosts the designer outside VS Code.

## See Also

For related guidance, see:

* [Report Designer Tools Overview](slug:telerikreporting/designing-reports/report-designer-tools/overview)
* [Report File Formats](slug:report-file-formats)
* [VS Code Extension Workflows](slug:integration-with-vs-code)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)
* [Adding and Configuring Report Items](slug:user-guide/components/report-items)