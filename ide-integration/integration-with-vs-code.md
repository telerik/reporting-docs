---
title: Integration with VS Code
page_title: Integration with VS Code
description: The Telerik Reporting Productivity Tools Extension for Visual Studio Code provides scaffolding for the Telerik Reporting native Angular viewer.
slug: integration-with-vs-code
tags: integration, vscode, report, viewer, angular
tag: update
published: True
position: 1
reportingArea: General
components: [general]
---

# Visual Studio Code Integration

The [Telerik Reporting Productivity Tools](https://marketplace.visualstudio.com/items?itemName=TelerikInc.telerik-reporting-productivity-tools) extension provides report-authoring and application-development workflows for [Visual Studio Code](https://code.visualstudio.com/). Depending on what you want to build, use the following guides to continue.

## Designing Reports in VS Code

You can create, edit, preview, and export Telerik reports directly in Visual Studio Code without first creating a Reporting application.

![A report open in the Telerik Reporting Web Report Designer in VS Code, with the report explorer and properties panel visible](../designing-reports/report-designer-tools/vscode/images/wrd-vscode.png)

* Start with [Telerik Reporting in Visual Studio Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode) for installation, licensing, and an overview of the available workflows.
* Follow [Getting Started with Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/working-with-reports-in-vs-code) to create, preview, and export your first report.
* See [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports) when you want to edit reports from an existing application or repository.
* Use [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference) for named database connections, licensing, commands, and settings.

## Adding the Native Angular Report Viewer

The VS Code extension can also add the Native Angular Report Viewer to an Angular application. This workflow is intended for displaying reports in an application and is separate from report authoring with the Web Report Designer.

To create a new test app, you can use the Angular CLI:

`ng new ReportingAngularApp`

> note The Telerik CLI includes a complete-app template for the Native Angular Report Viewer, in addition to the component generator described here. See the [Telerik CLI article](slug:reporting-telerik-cli) for details.

1\. In VS Code, in the Explorer, within your Angular application source folder, right-click where you want to add a reporting component and select **New Telerik Reporting Angular Project Item**:

![New Telerik Reporting Angular Project Item](images/vscode-reporting-angular-new-project.png)

2\. VS Code will prompt you that @progress/telerik-reporting-schematics is missing. To install it, click `npm i ...` in the prompt.

![Telerik Reporting Schematics](images/telerik-reporting-schematics.png)

3\. The Telerik Reporting Angular Scaffolding wizard will open, showing the available Angular component options.

![Telerik Reporting Angular Scaffolding Wizard](images/telerik-reporting-angular-scaffolding-wizard.png)

4\. Configure your preferred options and click **Create**. This will generate an Angular component with a pre-configured Telerik Reporting Native Angular report viewer.

![ Telerik Reporting Native Angular Report Viewer](images/telerik-reporting-angular-report-viewer.png)

5\. Include the new component in your project. Add it to your routing or to the HTML of an existing component.

## See Also

- [Adding the Native Angular Report Viewer with the Project Item Generator](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/integrating-with-project-item-generator)
