---
title: Upgrade Overview
page_title: Overview 
description: Overview
slug: telerikreporting/upgrade/overview
tags: overview
published: True
position: 0
---

# Upgrade Overview

Depending on the new features and changes in each new Telerik Reporting release, you may have to upgrade your project. 

Specific changes and dependencies for each major Telerik Reporting release are listed in the child articles. 

## General Workflow

1. Check for any new features, fixes, breaking or dependency changes in the Telerik Reporting [Release History](https://www.telerik.com/support/whats-new/reporting/release-history). 

1. Install the desired Telerik Reporting version by using the Telerik Control Panel or [through the MSI installer file]({%slug telerikreporting/installation%}). 

1. Upgrade all projects that use Telerik Reporting as described in this article. 

1. Refer to the child aricles to check for any updates between your current and desired versions. For example, if your project currently targets Q3 2013, to upgrade to Q1 2014, review the articles for Q3 2013 SP1 and Q1 2014. In this specific example the Q3 2013 SP1 article is missing because no breaking or dependency changes were introduced in that release. 

For any persisting issues, either: 

* Refer to the article on [troubeshooting installation and upgrade issues]({%slug unable-to-upgrade-after-wizard %}) in Telerik Reporting, or 

* Send the issue through the [dedicated Telerik Reporting support system](https://www.telerik.com/support/reporting) together with your project or solution in a `.zip` file. 

## Major and Minor Releases

Telerik Reporting supports the following types of releases: 

* Major versions―Can simultaneously coexist on the same machine. For example, major versions are the Q3 2013 and Q1 2014 releases. 

* Minor versions―Also known as Service Packs (SP). A major version can coexist on the same machine with only a single minor version from the same release. For example, when you upgrade the major Q1 2014 release to the later minor Q1 2014 SP1 release, the installer will first uninstall the Q1 2014 version and then install the Q1 2014 SP1 one. 

If the new Telerik Reporting version is a major release, it will be installed next to the earier releases. If the new Telerik Reporting version is a minor release, it will replace the corresponding major release. 

> Visual Studio Toolbox loads only the updates from the latest Telerik Reporting version that is installed on your computer. However, you will be able to work with the item and project templates from all Telerik Reporting versions that are installed on your computer. 


## Upgrading Projects Automatically

To automatically upgrade your project to a later Telerik Reporting version, use the [Telerik Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}). 

> * The Telerik Upgrade Wizzard does not support website projects. Websites handle assembly references in a different way. For more information, refer to the article on [Web Application Projects versus Web Site Projects in Visual Studio](https://msdn.microsoft.com/en-us/library/dd547590(v=vs.110).aspx). To upgrade your website project automatically, transform it into a web application or [manually upgrade your website project](#upgrading-website-projects-manually).
> * Website, WPF, and Silverlight projects which use the WPF and Silverlight ReportViewers but do not have separately purchased Telerik UI for WPF and Telerik UI for Silverlight products, can only be updated manually.
> * .NET Core projects are not supported by the Upgrade Wizard. You need to upgrade manually to the selected version:
>   * The references to the Telerik Reporting assemblies or NuGet packages
>   * The Htm5 Report Viewer scripts


## Upgrading Website Projects Manually

1. In __Solution Explorer__, click the __Show All Files__ button. 

1. Select __Delete all__ to remove all Telerik Reporting assemblies from the __Bin__ folder. 

1. From the __References__ tab on the __Property Pages__ of the website, remove all references to Telerik Reporting assemblies. Remember the names of the deleted assemblies. 

1. Select __Add all__ to add all required references to the new Telerik Reporting assembly versions. They correspond to the ones that you deleted in the previous step. 

1. Open the `web.config` file and update all version numbers to the new one in the following instances: 

   + ```<configSections>```―The location in which you can alter the atributes of the rendering extensions. 

   + ```<httpHandlers>```/```<handlers>```―The location in which the ASP.NET ReportViewer registers its handler. 

   + ```<assemblies>```―The Telerik Reporting assemblies that are references in the website. 

1. Open the `.aspx/.master` pages and change the version of the ReportViewer in the `Register` directive. 

1. Open all report resource files as XML―Each `.resx` file appears under the respective report file. 

1. Locate all occurrences of a Telerik Reporting Assembly and update their version number to the new one. Unlike the version name (for example, Q1 2014), the version number is a technical identifier (for example, 8.0.14.225). 

1. Restart Visual Studio. 

1. Rebuild all updated projects. 

1. If compilation errors or warnings occur, review the __[Release History](https://www.telerik.com/support/whats-new/reporting/release-history)__ section for any obsolete or deleted properties, methods, and events, and handle these according to the instructions in the section. Review the release history for all releases between the previous and the latest version you installed. 

## Upgrading Other Projects Manually

Apart from website projects, you can also manually upgrade class library projects, desktop and web applications. 

1. In __Solution Explorer__, click the __Show All Files__ button. 

1. Open __References__ and locate the references to the previous Telerik Reporting assemblies. Service Pack assemblies are marked with yellow exclamation marks which show that the assemblies cannot be located. This is normal behavior and indicates that you have an uninstalled the version to which they belong. 

1. Select the old assemblies that you identified in the previous step and click __Delete__ to remove them. Remember the names of the deleted assemblies. 

1. Right-click __References__ and select __Add Reference__. 

1. Select __Add all__ to add all required references to the new Telerik Reporting assembly versions. They correspond to the ones that you deleted in the previous step. As a result, the newly added references appear in __References__ without the yellow exclamation marks which means that they are valid. 

1. Open the `web.config/app.config` file and update all version numbers to the new one in the following instances: 

   + ```<configSections>```―The location in which you can alter the attributes of the rendering extensions. 

   + ```<httpHandlers>```/```<handlers>```―The location in which the ASP.NET ReportViewer registers its handler. 

   + ```<assemblies>```―The Reporting assemblies that are references in the web application. 

1. (Applicable to web applications only) Open the `.aspx` or `.master` pages and change the version of the ASP.NET ReportViewer in the `Register` directive. 

1. (Applicable to web applications only) Update the HTML5 Report Viewer files in the project. Open the `.cshtml` or `.vbhtml` and layout views, the pure HTMl pages or the `.aspx` or `.master` pages and change the version of the links which point to the following files: 

   + `telerikReportViewer-x.x.x.x(.min).css`―The CSS of the HTML5 Report Viewer where `x.x.x.x` is the HTML5 ReportViewer and Telerik Reporting version (for example, 8.1.14.816). 

   + `telerikReportViewer-x.x.x.x(.min).js`―The JavaScript files of the HTML5 Report Viewer where `x.x.x.x` is the HTML5 ReportViewer and Telerik Reporting version (for example, 8.1.14.816). 

   + `telerikReportViewerTemplate.html`―The default template HTML page of the HTML5 Report Viewer. 

1. (Applicable to WPF applications only) Update the references to Telerik UI for WPF and the corresponding binding redirects, if any. For more information, refer to the article on [manually setting up the WPF ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}). Update the XAML resources which correspond to the updated Telerik UI for WPF assemblies.

1. (Applicable to Silverlight applications only) Update the references to Telerik UI for Silverlight. For more information, refer to the article on [adding the Sliverlight ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}). Update the XAML resources which correspond to the updated Telerik UI for Silverlight assemblies.

1. Open all report resource files as XML―each `.resx` file appears under the respective report file. 

1. Locate all occurrences of a Telerik Reporting Assembly and update the version number to the new one. Unlike the version name (for example, Q1 2008), the version number is a technical identifier (for example, 2.5.8.414). 

1. Restart Visual Studio. 

1. Rebuild all updated projects. 

1. If compilation errors or warnings occur, review the [Release History section](https://www.telerik.com/support/whats-new/reporting/release-history) for any obsolete or deleted properties, methods, and events, and handle these according to the instructions in the section. Review the release history for all releases between the previous and the latest version you installed.
