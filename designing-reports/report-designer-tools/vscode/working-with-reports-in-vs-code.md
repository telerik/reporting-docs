---
title: Getting Started with Reports in VS Code
page_title: Getting Started with Telerik Reports in VS Code
description: Create a static Telerik report in Visual Studio Code, preview the result, and export it without an application project or database.
slug: telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code
tags: reporting, vscode, report, tutorial
published: True
position: 1
reportingArea: General
components: [general]
---

# Getting Started with Reports in VS Code

This tutorial shows how to create, edit, preview, and export a Telerik report in Visual Studio Code without installing the Telerik Reporting MSI. The example uses static content, so you do not need a database, a Reporting REST service, or an existing application.

If you already use Telerik Reporting, continue with [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).

## Preparing the Workspace

Enable the Telerik Reporting extension and open a folder that you trust in VS Code. For extension requirements and licensing, see [Telerik Reporting in Visual Studio Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode).

For this example, create a folder named `ReportingPlayground` and open it with **File** > **Open Folder**. Keeping the report and exported document in this folder gives you a workspace for the complete workflow without an existing application.

Open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` when a step names an extension command.

## Creating a Report

Create an empty report in the current workspace:

1. Run **Telerik Reporting: Create New Report**.
2. Save the file as `HelloReporting.trdx` in `ReportingPlayground`.
3. Wait for the designer to open in a VS Code tab.

The command creates an empty XML report definition with a page header, detail section, and page footer. The extension also starts its bundled local Reporting service, so you do not need to start a separate Reporting REST service.

## Adding Report Content

Add a **TextBox** to the report's page header. A page header can display a fixed message without a data source, which keeps this first example focused on report design.

To add the message:

1. Drag a **TextBox** from the **Components** panel to the page header.
2. Select the text box and set **Value** in the **Properties** panel to `Hello from Telerik Reporting`.
3. Resize the text box so that the complete value is visible.

For other items and layout tools, see [the Web Report Designer user guide](slug:user-guide/overview).

## Saving the Report

Save the report from the designer with `Ctrl`+`S` on Windows or Linux, or `Cmd`+`S` on macOS. Confirm that `HelloReporting.trdx` exists in `ReportingPlayground` before you continue.

The report file contains the text box definition, not a rendered document. Preview processes that definition to produce pages that you can read or export.

## Previewing the Report

Use the designer's built-in preview when you want to switch quickly between the design surface and rendered output. Confirm that the rendered page displays `Hello from Telerik Reporting` in its header.

To keep the rendered report visible while you continue working in the designer, run **Telerik Reporting: View Report**. The separate viewer also provides parameter, paging, and export controls. It renders the report saved on disk, so if the designer has pending edits, select **Save and View** to include them or **View Saved Version** to leave them unsaved.

If the preview displays a licensing watermark, follow [the license setup instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-license). You do not need to install the MSI to configure a license.

## Verifying a Report Change

Change the text to verify that the viewer displays saved changes:

1. Change the **TextBox** value to `My first Telerik report`.
2. Save the report.
3. Refresh the built-in preview or inspect the separate viewer. Confirm that the rendered document displays the updated value.

When `telerik-reporting.liveViewerRefresh` is `true`, which is the default, an open separate viewer refreshes after you save. This step verifies the complete edit, save, and render cycle without introducing a data-source dependency.

## Exporting the Result

Export creates a rendered document, such as a PDF, rather than a copy of the report definition. Use the viewer's export menu to create an output file:

1. Select **PDF** from the export options.
2. In the VS Code save dialog, choose a destination and select **Export**.
3. Select **Open File** in the completion notification to inspect the result.

The suggested file name is `HelloReporting.pdf`, beside the report definition. You can choose another name or folder. Confirm that the exported file contains `My first Telerik report`. The `.trdx` file remains available for further edits.

## Reopening the Report

Close the designer tab, then reopen `HelloReporting.trdx` from the workspace. Confirm that the latest **TextBox** value is preserved. The report definition contains your saved changes, so you can continue editing it after you export a document.

## Next Steps

Continue with the article that matches your next task:

* To configure and edit a report from an existing solution, see [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).
* To generate report content with a Visual Studio Code language model, see [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai).
* To configure connections, paths, licensing, commands, and settings, see [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference).

## See Also

The following articles provide related report-design guidance:

* [Report Designer Tools Overview](slug:telerikreporting/designing-reports/report-designer-tools/overview)
* [Report File Formats](slug:report-file-formats)
* [Adding and Configuring Report Items](slug:user-guide/components/report-items)