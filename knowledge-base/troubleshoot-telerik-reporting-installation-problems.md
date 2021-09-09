---
title: Troubleshoot Telerik Reporting installation problems.
description: Troubleshoot Telerik Reporting installation issues.
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

Telerik Reporting is distributed as a [windows installer](https://docs.microsoft.com/en-us/windows/win32/msi/windows-installer-portal?redirectedfrom=MSDN) setup package and is shipped as a single **.msi** file.  
 
In order to troubleshoot problems raised during the Telerik Reporting installation process, information from the log file should be obtained.  
   
## Solution  
 
1. By default the setup package is named Telerik\_Reporting\_&lt;version&gt;.msi (e.g. &lt;version&gt; is 2012\_Q3\_SP1) and. you can obtain it in two ways:
    
    - Downloading it from [www.telerik.com](/): Log in first and navigate to Manage Products -&gt; DevCraft Ultimate -&gt; Download Installer and other Resources -&gt; Reporting -&gt; Browse all product files -&gt; Automatic Installation: [Download Reporting](/account/your-products/product-versions.aspx?pmvid=3198&amp;pid=521).
    
    - In case you use the Telerik Control Panel all the packages are cached on your disk. You can find the download location from the Telerik Control Panel's Options: dialogSettings-&gt;Download Folder Location

2. Once you locate the msi file’s path(&lt;path&gt;), run the [msiexec command](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc759262(v=ws.10)?redirectedfrom=MSDN) with logging information enabled   from [command prompt](https://docs.microsoft.com/en-us/windows/win32/msi/command-line-options?redirectedfrom=MSDN):  
   
   - msiexec /i &lt;path&gt;\Telerik\_Reporting\_&lt;version&gt;.msi -l\*xv &lt;logFilePath&gt;install.log  
   
3. The following example starts Telerik Reporting setup package  and logs all activity to the C:\install.log file.  
   
   - msiexec /i C:\Telerik\_Reporting\_Q1\_2013\_SP1\_DEV.msi -l\*xv C:\install.log



