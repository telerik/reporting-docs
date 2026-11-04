---
title: Telerik Reporting in Visual Studio Code
page_title: Telerik Reporting in Visual Studio Code
description: Try report design in Visual Studio Code, work with existing reports, use AI-assisted authoring, or generate a Web Report Designer application.
slug: telerikreporting/designing-reports/report-designer-tools/vscode
tags: reporting, vscode, report, designer
published: True
position: 2
reportingArea: General
components: [general]
---

# Telerik Reporting in Visual Studio Code

Use the Telerik Reporting extension for Visual Studio Code to create, edit, preview, and export reports without installing the Telerik Reporting MSI. If you already use Telerik Reporting, open a report from an existing workspace and continue working with its definition and supporting files.

## Choosing a Workflow

Start with the article that matches your task:

| Goal | Start with |
|---|---|
| Try Telerik Reporting without a database or application project | [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code) |
| Edit a report from an existing application or repository | [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports) |
| Generate or modify report content with a Visual Studio Code language model | [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) |
| Configure report paths, connections, licensing, commands, and settings | [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference) |
| Generate a Web Report Designer application | [Creating a Web Report Designer application](slug:integration-with-vs-code#creating-a-web-report-designer-application) |
| Add the Native Angular Report Viewer to an Angular application | [Integration with VS Code](slug:integration-with-vs-code) |

## Understanding the Available Experiences

The extension supports related but distinct report workflows:

* The hosted Web Report Designer opens report definitions in a Visual Studio Code editor. Use it to create, edit, save, and preview reports with the bundled local backend.
* The separate Report Viewer opens a rendered report beside the designer. Use it to verify report parameters, pages, and export output.
* The project-generation workflow creates a standalone Web Report Designer application that you can continue developing outside the extension.
* The Native Angular Report Viewer workflow adds a viewer component to an Angular application. It does not create or host a Web Report Designer.

The extension supports `.trdp`, `.trdx`, and `.trdj` report definitions. Use a trusted workspace when reports depend on local configuration, shared data sources, or resource files.

## Licensing and AI Access

Telerik Reporting licensing is separate from MSI installation. A missing or invalid license can produce licensing warnings and report watermarks. See [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) to make a license available to the local backend.

AI-assisted report generation has a separate Telerik Reporting entitlement: it requires a valid Subscription or Trial license. The selected model provider, such as GitHub Copilot, supplies separate authentication and usage access. See [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) for the distinction.

## Generating a Web Report Designer Application

The extension-hosted designer is sufficient when you want to try Reporting or make a focused change to a report. To generate a separate ASP.NET Core application that you can continue developing, follow [Creating a Web Report Designer application](slug:integration-with-vs-code#creating-a-web-report-designer-application). This command does not add a viewer to an existing application.

## Next Steps

For task-based instructions, see:

* [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code)
* [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports)
* [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)