---
title: Troubleshoot Telerik Reporting Installation
description: "Learn how to Troubleshoot problems related to the Telerik Reporting Installation process by activating the logging."
type: how-to
page_title: Troubleshooting Telerik Reporting installation errors.
slug: troubleshoot-telerik-reporting-installation-problems
res_type: kb
---
 
## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

Telerik Reporting is distributed as a [windows installer](https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-portal) setup package and is shipped as a single `.msi` file.

In order to troubleshoot problems raised during the Telerik Reporting installation process, information from the log file should be obtained.

## Solution

1. By default the setup package is named `Telerik_Reporting_<version>.msi`, for example, `Telerik_Reporting_R1_2023_SP1_17_0_23_315_DEV.msi`, and you can obtain it in two ways:

	- Downloading it from [Your Telerik Account](https://www.telerik.com/account/downloads/product-download?product=REPORTING)
	- In case you use the Telerik Control Panel all the packages are cached on your disk. You can find the download location from the Telerik Control Panel's Options: dialogSettings -> Download Folder Location

1. Once you locate the msi file’s path(&lt;path&gt;), run the [msiexec command](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc759262(v=ws.10)) with logging information enabled from [command prompt](https://learn.microsoft.com/en-us/windows/win32/msi/command-line-options):

	- msiexec /i &lt;path&gt;\Telerik\_Reporting\_&lt;version&gt;.msi -l\*xv &lt;logFilePath&gt;install.log

1. The following example starts Telerik Reporting setup package and logs all activity to the C:\install.log file.

	- msiexec /i C:\Telerik\_Reporting\_Q1\_2013\_SP1\_DEV.msi -l\*xv C:\install.log
