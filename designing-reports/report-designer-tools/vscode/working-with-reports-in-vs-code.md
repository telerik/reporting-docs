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

This tutorial walks through the report-authoring cycle in Visual Studio Code. You will create a static report with a heading, change it, preview the rendered pages, and export a PDF.

The example uses static content so you can learn the design, save, preview, and export workflow without configuring a database or application first. The same workflow applies to data-bound reports after you configure their connections.

If you already use Telerik Reporting, continue with [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).

## Preparing the Workspace

Enable the Telerik Reporting extension and open a folder from a source you trust. Preview can access local files and run data-source queries, so workspace trust matters even when this example uses static content. For extension requirements and licensing, see [Telerik Reporting in Visual Studio Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode).

For this example, create a folder named `ReportingPlayground` and open it with **File** > **Open Folder**. Use it for the report definition, and choose it as the PDF destination when you want to keep both files together.

Open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS. Search for `Telerik Reporting:` when a step names an extension command.

## Creating a Report

Create an empty report in the current workspace:

1. Run **Telerik Reporting: Create New Report**.
2. Save the file as `HelloReporting.trdx` in `ReportingPlayground`.
3. Wait for the designer to open in a VS Code tab.

The command creates an empty XML report definition with a page header, detail section, and page footer. The definition describes the report structure; it is not the rendered document. Add content in the designer, then preview the report to see its rendered pages. The extension also starts its bundled local Reporting service, so you do not need a separate Reporting REST service.

## Adding Report Content

Add a **TextBox** to the report's page header. A page header can display a fixed message without a data source, which keeps this first example focused on report design.

The **Components** panel lists items you can add to a report. When you select an item on the design surface, the **Properties** panel shows the settings you can change.

To add the message:

1. Drag a **TextBox** from the **Components** panel to the page header.
2. Select the text box and set **Value** in the **Properties** panel to `Hello from Telerik Reporting`.
3. Resize the text box so that the complete value is visible.

For other items and layout tools, see [the Web Report Designer user guide](slug:user-guide/overview).

## Saving the Report

Save the report before you open the separate viewer; the viewer renders the definition saved on disk. Use `Ctrl`+`S` on Windows or Linux, or `Cmd`+`S` on macOS. Check that `HelloReporting.trdx` exists in `ReportingPlayground` before you continue.

## Previewing the Report

Use the designer's built-in preview when you want to check the current report as you work. It displays the report state in the designer, so you do not need to save first. For this tutorial, verify that the rendered page displays `Hello from Telerik Reporting` in its header.

Open **Telerik Reporting: View Report** when you want the rendered report to remain visible beside the designer or need its parameter, paging, and export controls. The separate viewer renders the report saved on disk. If the designer has pending edits, select **Save and View** to include them or **View Saved Version** to leave them unsaved.

If the preview displays a licensing watermark, follow [the license setup instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-license). You do not need to install the MSI to configure a license.

## Verifying a Report Change

After the original report renders, change the text. Comparing the next preview with that baseline shows whether your saved edit changed the output:

1. Change the **TextBox** value to `My first Telerik report`.
2. Save the report.
3. Refresh the built-in preview or inspect the separate viewer. Verify that the rendered document displays the updated value.

When `telerik-reporting.liveViewerRefresh` is `true`, which is the default, an open separate viewer refreshes after you save. This step verifies the complete edit, save, and render cycle without introducing a data-source dependency.

## Exporting the Result

Export a PDF when you need a portable copy of the rendered report. The PDF contains rendered pages; the `.trdx` file remains editable. Use the viewer's export menu to create the output file:

1. Select **PDF** from the export options.
2. In the VS Code save dialog, choose a destination and select **Export**.
3. Select **Open File** in the completion notification to inspect the result.

The dialog may suggest `HelloReporting.pdf` beside the report definition; the suggested name or location can vary. Choose a destination, then check that the exported file contains `My first Telerik report`. The `.trdx` file remains available for further edits.

## Reopening the Report

Close the designer tab, then reopen `HelloReporting.trdx` from the workspace to verify that the saved **TextBox** value persists. The `.trdx` file remains ready for further edits after you export the PDF.

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