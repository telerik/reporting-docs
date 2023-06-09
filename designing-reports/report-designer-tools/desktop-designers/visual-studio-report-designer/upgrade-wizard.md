---
title: Upgrade Wizard
page_title: Using the Upgrade Wizard
description: " Learn how the Upgrade Wizard can be used to upgrade a .NET Framework project by following the wizard steps."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard
tags: upgrade,wizard
published: True
position: 3
previous_url: /ui-upgrade-wizard
---

# Upgrade Wizard Overview

The __Upgrade Wizard__ will guide you through the process of upgrading Telerik Reporting projects to a newer (or older) version of Telerik Reporting. This wizard will upgrade the following:

* The references to Telerik Reporting assemblies to the selected version
* The project’s `.config` file
* All web page/user control files (`aspx`/`ascx`) with references to the Telerik Reporting assemblies
* All resource files (`resx`) with references to the Telerik Reporting assemblies

The wizard __will not__ change any code, namespaces, nor will it remove obsolete properties, events and methods. You may need to manually update your code after this wizard completes.

> Web Site projects are not supported by the Upgrade Wizard. In Web Sites assembly references are handled differently, and our recommendation is to upgrade manually or to turn the project into a Web Application that can be upgraded automatically - [Web Application Projects versus Web Site Projects in Visual Studio](https://learn.microsoft.com/en-us/previous-versions/aspnet/dd547590(v=vs.110)).

> `.NET Core` projects are not supported by the Upgrade Wizard. You need to upgrade manually to the selected version:
>
> * The references to the Telerik Reporting assemblies or NuGet packages
>
> * The HTML5 Report Viewer scripts

The Upgrade Wizard works only with project items. It is registered in Visual Studio and keeps tracks on Telerik Reporting installation folders on the machine. Telerik Reporting references are updated by using the selected in the wizard version and the installation folder registered for that version. If Telerik Reporting assemblies are referenced from a custom location, not the installation folder, the Upgrade Wizard will not update the content of the custom folder and references will be pointed to the installation folder.

The wizard requires access permissions to the solution folder and its files. If the solution or some of its projects are under source control, make sure that the correct source control plug-in is active in Visual Studio and no files are exclusively checked-out by another user.

Once you open a solution, the Upgrade Wizard would check what version of Telerik Reporting is used and if you have a newer one installed, it would offer to upgrade your application. Visual Studio would automatically popup the __Upgrade Wizard__ as shown below:

If you do not want it to popup automatically, simply check the "Do not start this wizard" checkbox at the bottom. If at later stage you decide that you want to upgrade your solution, simply use the [Telerik Reporting Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/telerik-reporting-menu%}) and select "Upgrade Wizard" from it.

Next step is to specify which project from the solution you want to upgrade and if you have multiple versions of Telerik Reporting installed - select the one you would like to upgrade/downgrade to:

You would be then asked whether you would like to backup your solution before proceeding with the upgrade and specify where it should be backed up. We highly recommend that you backup your solution(s) because the upgrade process is irreversible. Once you make your choice, you would be presented with confirmation step where you can review the files that are going to be changed during the upgrade.

Choosing Next from the wizard would proceed with the upgrade and you'll finish with screen where all successfully upgraded projects/files would be shown with green tick right next to them:

You can also review a detailed log of the upgrade once the solution is loaded into Visual Studio - to cancel this, you have to uncheck the "Show the upgrade log" checkbox at the bottom.

Once your solution is opened in the IDE, it would notify you with "File Modification Detected" prompt that your project(s) have been modified outside of the environment and you should press "Reload" in order to reload the updated project:

![A preview of the dialog that is displayed when the Upgrade Wizard has finished updating the files](images/upgwiz5.png)

## In case you receive compilation errors and/or warnings

This wizard __will not__ change any of your current code. As a result __you may receive compilation errors and/or warnings__ for properties, methods and events marked as obsolete. In this case a manual update of your code is required. The [Release Notes](https://www.telerik.com/support/whats-new/reporting/release-history) contain the complete list of obsolete and deleted properties, methods and events including information on what to be used instead, and why. Please, review the release notes of all Telerik Reporting versions starting from the version you upgraded from to the version you upgraded to, including the ones in between for information on how to update your project.

Feel free to contact us via the [support ticketing system](https://www.telerik.com/account/support-center/contact-us/technical-support) in case you still experience problems after the upgrade, and we will help you resolve any remaining issues. It will be faster and easier if you package your solution/project as a ZIP file and send it to Telerik, together with information on the errors/warnings you see.
