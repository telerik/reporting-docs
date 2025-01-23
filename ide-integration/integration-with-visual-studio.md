---
title: Integration with Visual Studio
page_title: Integration with Visual Studio
description: Integration with Visual Studio
slug: reporting-integration-with-visual-studio
tags: integration,visual,studio,reporting,configure,wizard
published: True
position: 0
---
# Integration with Visual Studio

The **Visual Studio Extensions** for the **Telerik Reporting** product aim to help developers when creating applications with Telerik Reporting. They can be accessed through the *Extensions | Telerik | Reporting* menu.

Make sure that the extension is installed first:

![Telerik Reporting Tools](images/telerik-reporting-tools.png)  

The extensions handle the following major points in the development process:

## Project Templates

After [installing Telerik Reporting]({%slug telerikreporting/installation%}), the extensions add several project templates to the **New Project** dialog of Visual Studio:

![New Project Templates](images/new-project-templates.png)   

If you select the last option **Telerik Reporting REST service**, the **REST Service Project Configuration** wizard is launched:

![REST Service Project Configuration Wizard](images/rest-service-project-configuration-wizard.png)  

A menu pops up that allows you to configure the REST Service properties:


[Hosting the Telerik Reporting REST Service in an ASP.NET Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%})

[Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET 6+ with Minimal API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})

## Item Templates

With the [installation of Telerik Reporting]({%slug telerikreporting/installation%}), several [report item]({%slug report_item%}) templates are added to the **New Item** dialog of Visual Studio:

![Add New Item](images/add-new-item.png)  

![New Item Templates](images/new-item-templates.png)   

If you select the last option, the New Report Wizard is launched:

![Select Report Wizard](images/report-wizard.png)    

Depending on the user's selection, the respective wizard is displayed, e.g. [Band Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}).

## Upgrade Wizard

The [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) allows you to upgrade Telerik Reporting to a newer version. It can be started by using the *Extensions > Telerik > Reporting > Upgrade Wizard* menu item:

![Start Upgrade Wizard](images/start-upgrade-wizard.png) 

After [installing Telerik Reporting]({%slug telerikreporting/installation%}) you can benefit the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) which facilitates the creation of new reports and importing reports from other formats in the Designer.

During the [installation process]({%slug telerikreporting/installation%}) of Telerik Reporting on your machine, the Telerik assemblies are added to Global Assemby Cache (GAC) as well. This enables the respective items in the Visual Studio Toolbox:

![Toolbox Items](images/toolbox-items.png) 

In case of any problems related to the Visual Studio Telerik Reporting Toolbox items, please refer to [Troubleshooting]({%slug telerik-reporting-toolbox-items-are-missing%}) article offering several tips.

## See Also

- [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%})
- [Troubleshooting Visual Studio Report Designer Problems]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems%})
- [Installation Approaches for Telerik Reporting]({%slug telerikreporting/installation%})

