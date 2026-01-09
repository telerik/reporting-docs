---
title: Telerik Reporting Missing in Visual Studio
description: This article shows how to add the Telerik Reporting items to Visual Studio if they are missing
type: how-to
page_title: Telerik Reporting Missing in Visual Studio
slug: telerik-reporting-missing-in-visual-studio
tags: visual-studio,vsix
ticketid: 1448597
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

Sometimes you are unable to add any Telerik Reporting items in Visual Studio. This article provides steps on how to solve this issue.

## Cause\Possible Cause(s)

A possible reason for the issue can be that the **Telerik Reporting** and/or **Telerik.CommonPackage** extensions might be disabled or they are not installed.

## Solutions

You may experience the issue if you are running Visual Studio as an administrator, and the extension is installed by another user. In this case:

Go to the menu `Tools`-> `Options` -> `Environment` -> `Extensions` / `Extensions and Updates`, and check **Load per user extension when running as administrator**.

## Visual Studio 2022/2026

Occasionally, Visual Studio 2022/2026 tends to fail to install properly the templates deployed in its `\Common7\IDE` folders. This is due to a specific Visual Studio service that fails to stop while the Telerik Reporting installer installs its project/item templates. As a result, the templates cache is never being refreshed and the new templates are not accessible in Visual Studio.

There are two solutions:

1. Uninstall the current Telerik Reporting installation. Restart your machine. Install Telerik Reporting again.
1. Using the Developer Command Prompt for Visual Studio 2022/2026 (started as Administrator), type `devenv.exe /installvstemplates`. This should force Visual Studio to install the templates and invalidate the templates' cache.
1. Follow this path:
   * For Visual Studio 2022: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2022`
   * For Visual Studio 2026: `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2026`
1. Run the `Telerik.Reporting.VsX.vsix` file. It should install all necessary extensions.

## Visual Studio 2019

Navigate to **Extensions** -> **Manage Extensions**. Under **Installed**,  find the aforementioned extensions and mark them as **Enabled**. 

If there aren't any Telerik extensions, locate the `Telerik.Reporting.VsX.vsix` under `%programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2019` and run it. It should install all necessary extensions.

## Visual Studio 2017 and 2015

Navigating to **Tools** -> **Extensions and Updates**. Under **Installed**,  find the aforementioned extensions and mark them as **Enabled**.

If there aren't any Telerik extensions, locate the `Telerik.Reporting.VsX.vsix` under ` %programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2017 ( or 2015)` and run it. It should install all necessary extensions.
