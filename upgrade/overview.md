---
title: Overview
page_title: Upgrade Overview
description: "Learn more about the general flow when upgrading Telerik Reporting and using the major and minor releases, and upgrade desktop, website, and other projects manually."
slug: telerikreporting/upgrade/overview
tags: telerik, reporting, upgrading, major, minor, releases, desktop, website, other, projects, manually, overview
published: True
position: 0
previous_url: /installation-upgrading-newer-version, /installation-upgrading-newer_version, /upgradepathoverview, /upgrade/
---

# Upgrading Telerik Reporting

Depending on the new features and changes in each new Telerik Reporting release, you may have to upgrade your project.

> __All *Telerik Reporting* and *Telerik Report Server* resources that interact must match in version__. For example, Html5 Report Viewer with version {{site.buildversion}}, Angular Report Viewer {{site.spaviewerversion}}, and React Report Viewer {{site.spaviewerversion}} must use a Reporting REST Service {{site.buildversion}}, or Telerik Report Server with version {{site.reportserverversion}}. Upon upgrading Telerik Reporting or Report Server ensure the browser hasn't cached the viewer's files with the older version.

> The PDF documentation is updated less often than the online documentation and may contain outdated or imprecise information.

## General Workflow

To upgrade Telerik Reporting:

1. Check for any new features, fixes, breaking or dependency changes in the Telerik Reporting [Release History](https://www.telerik.com/support/whats-new/reporting/release-history).
1. Install the desired Telerik Reporting version by using the Telerik Control Panel or [through the MSI installer file]({%slug telerikreporting/installation%}).
1. Upgrade all projects that use Telerik Reporting as described in this article.
1. Check for any updates between your current and desired versions in the articles with the specific changes in each Telerik Reporting release. For example, if your project currently targets Q3 2013, to upgrade to Q1 2014, review the articles for [Q3 2013]({%slug telerikreporting/upgrade/2013/q3-2013%}) and [Q1 2014]({%slug telerikreporting/upgrade/2014/q1-2014%}).

For any persisting issues, use either of the following options: 

* Refer to the article on [troubleshooting installation and upgrade issues]({%slug unable-to-upgrade-after-wizard%}) in Telerik Reporting.
* Send the issue through the [dedicated Telerik Reporting support system](https://www.telerik.com/support/reporting) together with your project or solution in a `.zip` file.

## Major and Minor Releases

Telerik Reporting supports the following types of releases:

* Major versions&mdash; Can simultaneously coexist on the same machine. For example, major versions are the [Q3 2013]({%slug telerikreporting/upgrade/2013/q3-2013%}) and [Q1 2014]({%slug telerikreporting/upgrade/2014/q1-2014%}) releases.
* Minor versions, or Service Packs (SP)&mdash; A major version can coexist on the same machine with only a single minor version from the same release. For example, when you upgrade the major Q1 2014 release to the later minor Q1 2014 SP1 release, the installer will first uninstall the Q1 2014 version and then install Q1 2014 SP1.

If the new Telerik Reporting version is a major release, it will be installed next to the earlier releases. If the new Telerik Reporting version is a minor release, it will replace the corresponding major release.

> Visual Studio Toolbox loads only the updates from the latest Telerik Reporting version that is installed on your computer. However, you will be able to work with the item and project templates from all Telerik Reporting versions that are installed on your computer.

## Upgrading Projects Automatically

To automatically upgrade your project to a later Telerik Reporting version, use the [Telerik Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}).

The Telerik Upgrade Wizard does not support website projects because [websites handle the assembly references in a different way](https://learn.microsoft.com/en-us/previous-versions/aspnet/dd547590(v=vs.110)). To upgrade your website project automatically, transform it into a web application. Alternatively, [upgrade your website project manually](#upgrading-website-projects-manually).

The Telerik Upgrade Wizard does not support .NET Core projects. To upgrade your .NET project, manually upgrade the references to the Telerik Reporting assemblies or NuGet packages and the HTML5 Report Viewer scripts to the required version.

You can only manually update the website projects and WPF projects that use the WPF Report Viewers but do not have separately purchased Telerik UI for WPF product.

## Upgrading Projects Manually

You can manually upgrade class library and website projects, and desktop and web applications.

1. In `Solution Explorer`, click the __Show All Files__ button. Open __References__ and locate the references to the previous Telerik Reporting assemblies.

	Service Pack assemblies are marked with yellow exclamation marks which show that the assemblies cannot be located. This behavior is normal and indicates that you have uninstalled the version to which they belong. 

1. Select the old assemblies that you identified in the previous step and click __Delete__ to remove them. Keep the names of the deleted assemblies for further reference.
1. Right-click __References__ and select __Add Reference__ > __Add all__ to add all required references to the new Telerik Reporting assembly versions. These versions correspond to the deleted ones from the previous step. As a result, the newly added references appear in __References__ without the yellow exclamation marks which means that they are valid.
1. Open the `web.config/app.config` file and update all version numbers to the new one in the following instances: 

	+ `<configSections>`―The location in which you can alter the attributes of the rendering extensions.
	+ `<httpHandlers>`/`<handlers>`―The location in which the ASP.NET Report Viewer registers its handler.
	+ `<assemblies>`―The Reporting assemblies that are references in the web application.

1. (For web applications only) Open the `.aspx` or `.master` pages and change the version of the ASP.NET Report Viewer in the `Register` directive. Update the HTML5 Report Viewer files in the project. Open the `.cshtml` or `.vbhtml` and layout views, the pure HTML pages or the `.aspx` or `.master` pages, and change the version of the links which point to the following files: 

	+ `telerikReportViewer-x.x.x.x(.min).css`―The CSS of the HTML5 Report Viewer where `x.x.x.x` is the HTML5 Report Viewer and Telerik Reporting version (for example, `8.1.14.816`).
	+ `telerikReportViewer-x.x.x.x(.min).js`―The JavaScript files of the HTML5 Report Viewer where `x.x.x.x` is the HTML5 Report Viewer and Telerik Reporting version (for example, `8.1.14.816`).
	+ `telerikReportViewerTemplate.html`―The default HTML template page of the HTML5 Report Viewer.

	(For WPF applications only) Update the references to Telerik UI for WPF and the corresponding binding redirects, if any. For more information, refer to the article on [manually setting up the WPF ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}). Update the XAML resources which correspond to the updated Telerik UI for WPF assemblies.

1. Open all report resource files as XML―each `.resx` file appears under the respective report file. Locate all occurrences of a Telerik Reporting Assembly and update the version number to the new one. Unlike the version name (for example, `Q1 2008`), the version number is a technical identifier (for example, `2.5.8.414`).
1. Restart Visual Studio and rebuild all updated projects.
1. If compilation errors or warnings occur, review the Telerik Reporting [Release History](https://www.telerik.com/support/whats-new/reporting/release-history) for any obsolete or deleted properties, methods, and events, and handle these according to the instructions. Review the release history for all releases between the previous and the latest version you installed.

## Upgrading Website Projects Manually

To upgrade your website project manually:

1. In `Solution Explorer`, click the __Show All Files__ button. Select __Delete all__ to remove all Telerik Reporting assemblies from the `Bin` folder.
1. From the __References__ tab on the __Property Pages__ of the website, remove all references to Telerik Reporting assemblies. Keep the names of the deleted assemblies for further reference.
1. Select __Add all__ to add all required references to the new Telerik Reporting assembly versions. They correspond to the ones that you deleted in the previous step.
1. Open the `web.config` file and update all version numbers to the new one in the following instances:

	+ `<configSections>`―The location in which you can alter the attributes of the rendering extensions.
	+ `<httpHandlers>`/`<handlers>`―The location in which the ASP.NET Report Viewer registers its handler.
	+ `<assemblies>`―The Telerik Reporting assemblies that are referenced on the website.

1. Open the `.aspx/.master` pages and change the version of the Report Viewer in the `Register` directive.
1. Open all report resource files as XML―Each `.resx` file appears under the respective report file. Locate all occurrences of a Telerik Reporting Assembly and update their version number to the new one. Unlike the version name (for example, Q1 2014), the version number is a technical identifier (for example, 8.0.14.225).
1. Restart Visual Studio and rebuild all updated projects.
1. If compilation errors or warnings occur, review the Telerik Reporting [Release History](https://www.telerik.com/support/whats-new/reporting/release-history) for any obsolete or deleted properties, methods, and events, and handle these according to the instructions. Review the Release History for all releases between the previous and the latest version you installed.
