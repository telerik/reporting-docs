---
title: Telerik Reporting Missing in Visual Studio
description: Learn how to restore missing Telerik Reporting templates and extensions in Visual Studio by enabling or reinstalling the required VSIX packages.
type: how-to
page_title: Telerik Reporting Missing in Visual Studio
slug: telerik-reporting-missing-in-visual-studio
tags: visual-studio,vsix
ticketid: 1448597
res_type: kb
---

## Environment

| Product |
|---|
| Progress® Telerik® Reporting |

## Description

You cannot add Telerik Reporting templates or items in Visual Studio when the required extensions are unavailable. Use the steps in this article to enable or reinstall the extensions.

## Cause

The **Telerik Reporting** or **Telerik.CommonPackage** extension is disabled or not installed.

## Solution

If another user installed the extension, Visual Studio might not load it when you run Visual Studio as an administrator. To allow per-user extensions:

1. Select **Tools** > **Options** > **Environment** > **Extensions**.
1. Select **Load per user extension when running as administrator**.

## Visual Studio 2022 and Visual Studio 2026

Visual Studio can fail to install the templates in its `\Common7\IDE` folder. This happens when a Visual Studio service does not stop while the Telerik Reporting installer deploys the project and item templates. The template cache is not refreshed, so the templates do not appear in Visual Studio.

Try the following solutions in order:

1. Uninstall Telerik Reporting, restart the computer, and install Telerik Reporting again.
2. Open the **Developer Command Prompt for Visual Studio 2022** or **Developer Command Prompt for Visual Studio 2026** as an administrator. Type `devenv.exe /installvstemplates` to reinstall the templates and refresh the template cache.
3. Open the folder for your Visual Studio version:
   * Visual Studio 2022: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2022`
   * Visual Studio 2026: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2026`
4. Run `Telerik.Reporting.VsX.vsix` to install the required extensions.

## Visual Studio 2019

Select **Extensions** > **Manage Extensions**. On the **Installed** tab, find the **Telerik Reporting** and **Telerik.CommonPackage** extensions and select **Enable**.

If the extensions are not listed, locate `Telerik.Reporting.VsX.vsix` in `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2019` and run it.

## Visual Studio 2017 and 2015

Select **Tools** > **Extensions and Updates**. On the **Installed** tab, find the **Telerik Reporting** and **Telerik.CommonPackage** extensions and select **Enable**.

If the extensions are not listed, locate `Telerik.Reporting.VsX.vsix` in `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2017` or `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2015` and run it.

## See Also

- [Visual Studio extensions for Telerik Reporting]({%slug reporting-integration-with-visual-studio%})
- [Troubleshooting Visual Studio Report Designer problems]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems%})
- [Telerik Reporting installation approaches]({%slug telerikreporting/installation%})
