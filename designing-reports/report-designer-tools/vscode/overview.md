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

Use the extension to explore report design, update an existing application's report, or draft content with AI. You can do this in Visual Studio Code without creating an application or installing the Windows MSI.

The extension hosts the Web Report Designer in a VS Code editor and starts a local Reporting service to support report design and preview.

## Choosing a Workflow

Choose the article that matches what you want to do:

| If you want to... | Start with |
|---|---|
| Create and preview your first report without a database or application project | [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code) |
| Open and modify reports that already belong to an application or repository | [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports) |
| Use a language model to create or revise report content | [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) |
| Configure a connection, report location, license, command, or extension setting | [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference) |
| Prototype locally, then create an application that hosts the Web Report Designer | [Creating a Web Report Designer application](slug:integration-with-vs-code#creating-a-web-report-designer-application) |
| Embed the Native Angular Report Viewer in an Angular application | [Integration with VS Code](slug:integration-with-vs-code#adding-the-native-angular-report-viewer) |

## Understanding the Available Experiences

The extension supports several related report workflows:

* The Web Report Designer opens report definitions in a Visual Studio Code editor. Use it to create, edit, save, and preview reports with the local Reporting service.
* Use the designer's built-in preview to check a change without leaving the design surface. Open the separate Report Viewer when you want to keep the rendered report beside the designer or use its parameter, paging, and export controls.
* The project-generation workflow creates a standalone Web Report Designer application that you can continue developing outside the extension.
* The Native Angular Report Viewer workflow adds a viewer component to an Angular application. It does not create or host a Web Report Designer.

The extension supports `.trdp`, `.trdx`, and `.trdj` report definitions. If you are choosing a format for a new report, see [Report File Formats](slug:report-file-formats) for the differences. Use a trusted workspace when reports depend on local configuration, shared data sources, or resource files.

## Licensing and AI Access

Telerik Reporting licensing is separate from the Windows MSI installation. A missing or invalid license can produce warnings and report watermarks. See [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license) to make a license available to the local Reporting service.

AI-assisted authoring needs two independent forms of access. A Telerik Reporting Subscription or Trial license enables the AI Report Generator. Your model provider manages model availability, sign-in, usage limits, and billing. See [Using AI-Assisted Report Design in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-ai) for setup and data-disclosure details.

## Generating a Web Report Designer Application

You do not need an application project to design or preview reports in VS Code. Create one when you need to build and configure a standalone Web Report Designer application independently of the extension. See [Creating a Web Report Designer application](slug:integration-with-vs-code#creating-a-web-report-designer-application) for the workflow. It creates a separate ASP.NET Core application; it does not add a viewer to an existing application.

## Next Steps

If you are new to the extension, start with [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code). If you already have report definitions, continue with [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports).