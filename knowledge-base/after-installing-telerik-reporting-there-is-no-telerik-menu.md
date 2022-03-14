---
title: No Telerik Menu Appears after Installing Telerik Reporting
page_title: The Telerik Menu Is Not Available after Installing Telerik Reporting
description: "Learn how to render the Telerik menu after installing Telerik Reporting and make it available for non admin accounts."
type: troubleshooting
slug: after-installing-telerik-reporting-there-is-no-telerik-menu
tags: telerik, reporting, menu, not, visible, after, installation, for, non, admin, accounts
ticketid: 1400382
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Visual Studio version</td>
		<td>Visual Studio 2017 and previous</td>
	</tr>
</table>


## Description

After the installation of Telerik Reporting finishes, the Telerik menu is visible only under the admin account and not available for the user account.

## Solution

The Telerik Visual Studio extensions are installed per user. In this case you need to manually install the `Telerik.Reporting.VsX.vsix` package, which is located in the Telerik Reporting installation folder in `C:\Program Files (x86)\Progress\Telerik Reporting **VERSION**\Bin\VS2017\Telerik.Reporting.VsX.vsix`. Install the file with your user account and you will be able to access the Telerik Reporting menu in Visual Studio.
