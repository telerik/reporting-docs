---
title: After installing Telerik Reporting, there is no Telerik menu
description: After installing Telerik Reporting, Telerik menu is not available from non admin account
type: troubleshooting
page_title: After installing Telerik Reporting, Telerik menu is not available from non admin account
slug: after-installing-telerik-reporting-there-is-no-telerik-menu
position: 
tags: Installation
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
		<td>Visual Studio 2017</td>
	</tr>
</table>


## Description
The article is related to Visual Studio 2017, but applicable for older versions as well.

After installation of Telerik Reporting finishes, Telerik menu is visible only under the admin account, not the user account. 

## Solution
You are facing this issue because our Visual Studio extensions are installed per user. In this case, please install the **Telerik.Reporting.VsX.vsix** package manually. The package can be found in the installation folder of Telerik Reporting, the path should look something like this: "C:\Program Files (x86)\Progress\Telerik Reporting **VERSION**\Bin\VS2017\Telerik.Reporting.VsX.vsix". Install the file with your user account and you should be able to access the Telerik Reporting menu in Visual Studio.

