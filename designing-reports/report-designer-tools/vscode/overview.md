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

The Telerik Reporting extension for Visual Studio Code lets you design and preview reports without installing the Telerik Reporting MSI. You can start with a new report, continue working with a definition from an existing application, or use a language model available through Visual Studio Code to help generate report content.

## Choosing a Workflow

Start with the article that matches your task:

| Goal | Start with |
|---|---|
| Try Telerik Reporting without a database or application project | [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code) |
| Edit a report from an existing application or repository | [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports) |
| Generate or modify report content with a Visual Studio Code language model | [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) |
| Configure report paths, connections, licensing, commands, and settings | [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference) |
| Generate a Web Report Designer application | [Creating a Web Report Designer application](slug:integration-with-vs-code#creating-a-web-report-designer-application) |
| Add the Native Angular Report Viewer to an Angular application | [Integration with VS Code](slug:integration-with-vs-code#adding-the-native-angular-report-viewer) |

## Understanding the Available Experiences

The extension supports several related report workflows:

* The hosted Web Report Designer opens report definitions in a Visual Studio Code editor. Use it to create, edit, save, and preview reports with the bundled local backend.
* The designer's built-in preview lets you switch quickly between the design surface and rendered output. The separate Report Viewer keeps the rendered report visible beside the designer while you continue working, and it also provides parameter, paging, and export controls.
* The project-generation workflow creates a standalone Web Report Designer application that you can continue developing outside the extension.
* The Native Angular Report Viewer workflow adds a viewer component to an Angular application. It does not create or host a Web Report Designer.

The extension supports `.trdp`, `.trdx`, and `.trdj` report definitions. Use a trusted workspace when reports depend on local configuration, shared data sources, or resource files.

## Licensing and AI Access

Telerik Reporting licensing is separate from MSI installation. A missing or invalid license can produce licensing warnings and report watermarks. See [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) to make a license available to the local backend.

AI-assisted report generation requires a valid Telerik Reporting Subscription or Trial license. The selected model provider, such as GitHub Copilot, separately controls model access, authentication, usage limits, and billing. See [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) for the complete setup and data-disclosure considerations.

## Generating a Web Report Designer Application

The extension-hosted designer is sufficient when you want to try Reporting or make a focused report change. When you need a complete project that you can continue developing, follow [Creating a Web Report Designer application](slug:integration-with-vs-code#creating-a-web-report-designer-application). This workflow creates a separate ASP.NET Core application; it does not add a viewer to an existing application.

## Next Steps

Choose a task-based article to continue:

* [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code)
* [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports)
* [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai)
* [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference)