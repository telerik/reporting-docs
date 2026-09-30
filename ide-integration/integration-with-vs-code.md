---
title: Integration with VS Code
page_title: Integration with VS Code
description: The Telerik Reporting Productivity Tools Extension for Visual Studio Code provides scaffolding for the Telerik Reporting native Angular viewer.
slug: integration-with-vs-code
tags: integration, vscode, report, viewer, angular
published: True
position: 1
reportingArea: General
components: [general]
---

# Visual Studio Code Integration

The [Telerik Reporting Productivity Tools](https://marketplace.visualstudio.com/items?itemName=TelerikInc.telerik-reporting-productivity-tools) Extension for [Visual Studio Code](https://code.visualstudio.com/) provides scaffolding for the Telerik Reporting native Angular viewer.

## Creating a Reporting App in VS Code

Choose an approach based on whether you need a complete starter app or want to add a viewer component to an Angular app.

### Create a Complete App from a Reporting Template

To create a complete app with the Native Angular Report Viewer and a companion ASP.NET Core Reporting service, first [install the Telerik CLI](slug:reporting-telerik-cli), then use its interactive project templates:

```powershell
telerik create reporting --interactive
```

Select **Telerik Reporting Native Angular Report Viewer**.

### Add a Viewer to an Existing Angular App

Use the project item generator to add a preconfigured Reporting viewer component to an Angular app. If you need to create an Angular app first, run the Angular CLI command:

```powershell
ng new ReportingAngularApp
```

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
