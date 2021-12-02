---
title: Installation
page_title: Installation | for Telerik Reporting Documentation
description: Installation
slug: telerikreporting/troubleshooting/installation
tags: installation
published: True
position: 0
---

# Installation



This article provides solutions for issues you might encounter while installing and upgrading Telerik Reporting projects.       

## The installer fails and I am not able to install Telerik Reporting

__Solution.__            Run the installer as administrator or from an admin account to avoid rights elevation problems.         

If the Telerik Reporting installer fails,           generate an installer log to identify the reason for the problem which occurred:         

1. Open a command prompt window by clicking __Start__ . In the prompt, type               `cmd`. Press `Enter`.             

1. Navigate to the folder in which the Telerik Reporting installer is located.

1. Run the `msiexec /i Telerik_Reporting.msi -l*xv install.log` command where               `install.log` stands for and has to be replaced with the               directory path and filename where you want to save the log.               Press `Enter`.             

1. After you generate the file, archive it and attach it to a support ticket with more information on the issue.

## An error that the report is now obsolete occurs

__Description.__            The project throws a `The report is now obsolete. Please use the ReportSource property instead.` error.         

__Solution.__            This message may appear in projects which use a Telerik Reporting Q2 2012 or later version.           For more information, refer to the article on            [               migrating your project to utilize the new ReportSource objects             ](http://www.telerik.com/support/kb/reporting/details/how-to-migrate-your-project-to-utilize-the-new-reportsource-objects) .         

## An error message about object of type XXX that cannot be converted to type XXX occurs

__Description.__            An `Object of type 'XXX' cannot be converted to type 'XXX'` occurs where `XXX`           is the same Type.         

__Solution.__ 

1. Run the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}).             

1. Restart Visual Studio.             

1. Manually verify that all Telerik Reporting assemblies are upgraded to the same version. For more information,               refer to the article on               [upgrading Telerik Reporting projects]({%slug telerikreporting/upgrade/overview%}).             

## The website project is not upgraded after running the Upgrade Wizard

__Cause.__            The [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) as well as all Telerik Reporting Wizards and Designers           are not designed to handle website projects because websites handle assembly references in a diffreent way.         

__Solution.__            Manually add viewers or upgrade the website. Design reports in an external `ClassLibrary` project           that is referenced by the website project. For more information, refer to the article on           [upgrading Telerik Reporting projects]({%slug telerikreporting/upgrade/overview%}).         
