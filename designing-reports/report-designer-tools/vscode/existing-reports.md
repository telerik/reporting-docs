---
title: Working with Existing Reports in VS Code
page_title: Working with Existing Telerik Reports in VS Code
description: Edit and preview existing Telerik reports in Visual Studio Code, configure common dependencies, and continue in a Web Report Designer application when application-level configuration is required.
slug: telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports
tags: reporting, vscode, report, designer
published: True
position: 2
reportingArea: General
components: [general]
---

# Working with Existing Reports in VS Code

An existing Telerik report may belong to an application or repository that already provides its data and runtime configuration. Starting with Q4 2026, you can open and edit the report directly in Visual Studio Code without running the application that normally hosts it.

The extension's local Reporting service supports common report-authoring scenarios, including reports with embedded data and named database connections that you configure for VS Code. For reports that depend more closely on their application environment, the extension also provides a way to continue in a standalone Web Report Designer application.

## Opening an Existing Report

If you have not installed the Telerik Reporting extension yet, follow [the installation instructions](slug:telerikreporting/designing-reports/report-designer-tools/vscode#installing-the-extension).

To open the report:

1. Select **File** > **Open Folder** in VS Code and open the folder that contains the report and its related files.
2. In VS Code's **Explorer**, the file list in the side bar, open the `.trdp`, `.trdx`, or `.trdj` report.
3. If another editor opens the file, right-click its editor tab and select **Reopen Editor With** > **Telerik Report Designer**.

Wait for the Web Report Designer to open in a VS Code tab. The extension starts its local Reporting service automatically.

To run a command, press `Ctrl`+`Shift`+`P` on Windows or Linux, or `Cmd`+`Shift`+`P` on macOS to open the **Command Palette**. Enter the command name and select it from the results. You can also open the palette from **View** > **Command Palette**.

## Checking the Report in VS Code

Preview the report before you edit it to establish a baseline and confirm that the local Reporting service provides the dependencies that the report needs.

### Previewing the Report

To establish a baseline:

1. Open the report in the designer.
2. Click **Preview** in the upper-right corner of the designer.
3. Provide values for any report parameters, if required.
4. Verify that the rendered output matches the result you expect from the original report.

You can design and preview the report without a license, but licensing watermarks appear in exported documents. To remove them, [configure an existing license or a trial license](slug:reporting-vs-code-configuration-and-reference#configuring-a-license).

### Resolving Report Dependencies

If the report does not preview as expected, check what it requires from its original environment.

Some dependencies can be configured directly for the local Reporting service. For example, if the report uses a named database connection, follow [the data connection instructions](slug:reporting-vs-code-configuration-and-reference#configuring-a-data-connection).

If the report requires application-level configuration, run **Telerik Reporting: Export To Application** from the **Command Palette**. It generates an ASP.NET Core application with the Web Report Designer already integrated. Continue in the generated application when you need, for example:

* Custom locations or resolution for reports and resources.
* Assemblies that provide custom user functions or other runtime types.
* Additional control over the Reporting service configuration.

If the original application already provides the environment that the report needs, you can also continue working with the report there.

## Editing and Verifying the Report

Once the report renders as expected in the environment you are using, make the required change and preview the updated result.

To verify the change:

1. Return to the designer and make the required edit.
2. Save the report with `Ctrl`+`S` on Windows or Linux, or `Cmd`+`S` on macOS.
3. Click **Preview** again and verify the updated result.

>tip You can also run **Telerik Reporting: Preview Report** from the **Command Palette** to open a separate viewer tab beside the designer, which refreshes when you save changes in the designer. For a multi-monitor setup, you can move the viewer tab into a separate VS Code window on another monitor.

## Using AI-Assisted Authoring

You can also use AI-assisted authoring to modify supported report content in an existing report. To use the AI Report Generator, you need a valid Telerik Reporting Subscription or Trial license and access to a language model through VS Code.

Before you begin, [configure the Telerik Reporting license](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) and make a language model available through VS Code. Model-provider access and usage terms are separate from the Telerik Reporting license.

### Choosing a Model

If GitHub Copilot is enabled in VS Code and you are signed in with Copilot access, its models are typically available without additional configuration. The available models depend on your Copilot plan and organization policies.

When you send your first request from the designer's AI chat, the extension prompts you to select a model before it can continue. The extension saves your choice for later requests.

If no models are available, or you want to use another provider, run **Chat: Manage Language Models** from the **Command Palette**, then select **Add Models** and follow the [VS Code provider setup instructions](https://code.visualstudio.com/docs/agent-customization/language-models#_bring-your-own-language-model-key).

### Making an AI-Assisted Change

To modify supported report content:

1. Open the report in the designer.
2. Click **AI Report Generator** (the sparkle icon) in the bottom-right corner of the report area to open the designer's AI chat.
3. Describe the change you want to make and send the request.
4. On your first request, select a model in the picker that opens. The request continues after you select a model.
5. Review the proposed changes before you apply them, then preview and save the report.

Avoid including credentials or other sensitive information in prompts. For supported report items, prompting examples, and data-handling details, see [the AI Report Generator user guide](slug:wrd-genai-graph-gauge-design).

### Changing the Model

To choose a different model, open VS Code **Settings**, search for `telerik-reporting.ai.model`, and clear its value. Send another AI request to select a model when the extension prompts you.

## Next Steps

If you want to explore the authoring workflow with a self-contained sample before working with application dependencies, see [the getting-started tutorial](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code).