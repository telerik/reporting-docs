---
title: Getting Started with Reports in VS Code
page_title: Getting Started with Telerik Reports in VS Code
description: Create your first Telerik report in Visual Studio Code, add content, preview it, and export a PDF without an application project or database.
slug: telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code
tags: reporting, vscode, report, tutorial
published: True
position: 2
reportingArea: General
components: [general]
---

# Getting Started with Reports in VS Code

This tutorial introduces the basic report-authoring workflow in Visual Studio Code by walking you through the creation of a simple Telerik report from scratch. You will create a report definition, add text to its layout, preview the rendered report, and export the result as a PDF.

The tutorial uses static content so that you can focus on working with the report designer before introducing data sources or application-specific configuration. You do not need the Windows MSI installer, a database, connection strings, or an application project to follow along. The Telerik Reporting extension provides the local Reporting service needed to design and preview the report, so there is no separate service to set up.

If you already have a report that you want to edit in VS Code, see [the existing-report workflow](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).

## Preparing the Workspace

Before creating the report, make sure that the Telerik Reporting Productivity Tools extension is installed and prepare a VS Code workspace for the tutorial. The extension provides the Telerik Reporting commands and designer, while the workspace gives you a location for the report definition and the files you create as you follow along.

To get started:

1. Install [Telerik Reporting Productivity Tools](https://marketplace.visualstudio.com/items?itemName=TelerikInc.telerik-reporting-productivity-tools) in VS Code if you have not already installed it.
2. Create a folder named `ReportingPlayground` and open it with **File** > **Open Folder**.

The Telerik Reporting commands used throughout the tutorial are available from the VS Code **Command Palette**. When a step asks you to run an extension command, open the **Command Palette** with `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS, and search for `Telerik Reporting:`.

## Creating a Report

With the workspace ready, you can create the report that you will use throughout the rest of the tutorial. The **Create Report** command creates new reports as `.trdx` files, which contain the report's content, layout, and settings and can be edited independently of an application project.

To create the report:

1. Run **Telerik Reporting: Create Report**.
2. Save the file as `HelloReporting.trdx` in `ReportingPlayground`.
3. Wait for the Web Report Designer to open in a VS Code tab and for its local service to start.

The new report opens in the designer with the sections that make up its initial layout. In the next step, you will become familiar with this layout and add some simple content that you can later preview and export.

## Adding Report Content

The design surface displays three horizontal report sections. The **Explorer** tab (it is selected by default) in the designer's left pane lists their names: `pageHeaderSection1` at the top, `detailSection1` in the middle, and `pageFooterSection1` at the bottom. After you select a report section, the **Components** tab provides the report items that you can add to that section.

For this first report, you will add a **TextBox** to the detail section and use it to display a fixed message. This keeps the report simple while introducing the basic workflow for adding and configuring report items.

To add the text:

1. In the designer's **Explorer** tab, select `detailSection1`. Selecting the section enables the report items that can be added to it.
2. Switch from **Explorer** to the **Components** tab.
3. Find **TextBox** in **Components** and drag it onto the selected detail section in the design surface.
4. Select the text box. In the properties pane on the right, enter `Hello from Telerik Reporting` in the **Value** field.
5. Resize the text box so that the complete value is visible.
6. Save the report with `Ctrl`+`S` on Windows or Linux, or `Cmd`+`S` on macOS.

The report now contains the content you will use in the remaining parts of the tutorial. The next step is to render the report and verify that the text appears as expected.

## Previewing the Report

Previewing renders the report so that you can inspect its output without leaving the designer. Click **Preview** in the upper-right corner of the designer and verify that the rendered page displays `Hello from Telerik Reporting`. You can return to the design surface if you want to make further changes.

You can preview and export the report without configuring a license, but the exported PDF will include a licensing watermark. To remove it, [set up an existing license or a free trial license](slug:reporting-vs-code-configuration-and-reference#configuring-a-license).

## Exporting the Report

After verifying the report in the preview, export the rendered output as a PDF that you can open independently of the report designer.

To export the report:

1. In the **Preview** view, click the **Export** button on the toolbar.
2. Select **PDF** from the export options.
3. In the VS Code save dialog, choose a destination and select **Export**.
4. Select **Open File** in the completion notification to inspect the result.

Verify that the PDF contains `Hello from Telerik Reporting`. The PDF contains the rendered output, while `HelloReporting.trdx` remains the editable report definition that you can reopen and modify later.

You have now completed the basic report-authoring workflow in VS Code: you created a report definition, added content in the designer, previewed the rendered report, and exported it as a PDF. From here, you can continue learning the designer or choose another workflow that matches what you want to do next.

## Next Steps

The next step depends on whether you want to continue learning report design, configure a license, try AI-assisted authoring, or work with Telerik Reporting in another scenario.

### Learning Report Design

Use [the Web Report Designer user guide](slug:user-guide/overview) to build on your first report and learn how to add data sources, report items, parameters, styles, and other report features.

### Configuring a License

You can design and preview reports without a license, but licensing watermarks will appear in exported reports. To remove them, follow [the local-service license setup instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-license).

### Trying AI-Assisted Authoring

After completing the manual report-authoring workflow, you can also use AI-assisted features in the Web Report Designer. AI-assisted authoring requires a valid Telerik Reporting Subscription or Trial license and access to a language model through VS Code. For the setup requirements and editing workflow, see [the AI-assisted authoring guide for existing reports](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports#using-ai-assisted-authoring).

### Choosing Another Workflow

If you are bringing a report from an existing application into VS Code, follow [the existing-report workflow](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).

For more control over configuration (such as using assemblies from [custom user functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions)), run **Telerik Reporting: Export To Application**. Follow [the application-generation guide](slug:integration-with-vs-code#creating-a-web-report-designer-application) to continue with your report in a standalone Web Report Designer application. This way, the application can also be used to let other users create and edit reports in a browser.

## See Also

The following articles provide related report-design guidance:

- [Report Designer Tools Overview](slug:telerikreporting/designing-reports/report-designer-tools/overview)
- [Report File Formats](slug:report-file-formats)
- [Report items in the Web Report Designer](slug:user-guide/components/report-items)
