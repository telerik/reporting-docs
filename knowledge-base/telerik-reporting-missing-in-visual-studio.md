---
title: Telerik Reporting Missing in Visual Studio
description: Learn how to restore missing Telerik Reporting items in Visual Studio by enabling extensions or reinstalling the Visual Studio templates.
type: how-to
page_title: Telerik Reporting Missing in Visual Studio
slug: telerik-reporting-missing-in-visual-studio
tags: visual-studio,vsix
ticketid: 1448597
res_type: kb
---

## Environment

| Environment | Details |
|---|---|
| Product | Progress® Telerik® Reporting |

## Description

You cannot add Telerik Reporting items in Visual Studio when the required extensions are unavailable or the Visual Studio templates are not installed correctly. Use the solutions in this article to restore the items.

## Possible Cause

The **Telerik Reporting** or **Telerik.CommonPackage** extension might be disabled or missing.

## Solution

If you run Visual Studio as an administrator and another user installed the extension, enable the per-user extension setting:

Open **Tools** > **Options** > **Environment** > **Extensions** or **Extensions and Updates**, and select **Load per user extension when running as administrator**.

## Visual Studio 2022/2026

Visual Studio 2022/2026 can fail to install the templates in its `\Common7\IDE` folders. A Visual Studio service can remain active while the Telerik Reporting installer deploys the project and item templates. The template cache then is not refreshed, and the templates are unavailable in Visual Studio.

Use one of the following solutions:

1. Uninstall the current Telerik Reporting installation, restart the computer, and install Telerik Reporting again.
2. Open the Developer Command Prompt for Visual Studio 2022/2026 as an administrator, and run `devenv.exe /installvstemplates`. This forces Visual Studio to install the templates and refresh the template cache.
3. Navigate to the folder for your Visual Studio version:
   * Visual Studio 2022: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2022`
   * Visual Studio 2026: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2026`

   Run the `Telerik.Reporting.VsX.vsix` file to install the required extensions.

## Visual Studio 2019

Navigate to **Extensions** > **Manage Extensions**. Under **Installed**, find the **Telerik Reporting** and **Telerik.CommonPackage** extensions, and mark them as **Enabled**.

If no Telerik extensions appear, locate `Telerik.Reporting.VsX.vsix` in `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2019`, and run it to install the required extensions.

## Visual Studio 2017 and 2015

Navigate to **Tools** > **Extensions and Updates**. Under **Installed**, find the **Telerik Reporting** and **Telerik.CommonPackage** extensions, and mark them as **Enabled**.

If no Telerik extensions appear, locate `Telerik.Reporting.VsX.vsix` in the folder for your Visual Studio version:

* Visual Studio 2017: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2017`
* Visual Studio 2015: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2015`

Run the file to install the required extensions.
