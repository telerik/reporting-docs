---
title: Error 'Value cannot be null. Parameter name: instance' when trying to open the Report Designer in Visual Studio 2017
description: VS Report Designer cannot be opened in VS 2017
type: troubleshooting
page_title: Exception while opening report is VS 2017 Report Designer
slug: error-value-cannot-be-null-parameter-name-instance-vs2017-report-designer
position: 
tags: 
ticketid: 1156994
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
When attempting to bring up the Report Designer in  Visual Studio 2017, an error with message _'Value cannot be null. Parameter name: instance'_ is thrown.

## Solution
[The error](http://docs.telerik.com/reporting/troubleshooting-upgrading#report-cannot-be-built-and-opened-in-visual-studio-report-designer) indicates that the project uses a version of _Telerik Reporting_ that is not registered in Visual Studio 2017\.  

You should re-install Telerik Reporting with support for Visual Studio 2017.
You can download MSI file to install Telerik Reporting as described in the [How to download Telerik Reporting installer](https://docs.telerik.com/reporting/installation-installing-from-msi#how-to-download-telerik-reporting-installer).
After downloading the installer, our recommendation is to run the MSI file per Visual Studio edition:

```
msiexec /i [installer_file_name].msi PRODUCTDIRVS2017ENTERPRISE="C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise"
```
or					
```						
msiexec /i [installer_file_name].msi PRODUCTDIRVS2017PROFESSIONAL="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional"
```
or
```
msiexec /i [installer_file_name].msi PRODUCTDIRVS2017COMMUNITY="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community"
```
In the code above _[installer_file_name].msi_ is the exact name of the installer, and should look like _Telerik_Reporting_R1_2018_SP2_DEV.msi_

Once Telerik Reporting is installed with support for VS2017, you can load the project in Visual Studio.  
  
The VS Report Designer is not fully functional in VS2017 for version of Telerik Reporting prior to R1 2017\.  
Therefore, our recommendation is to [upgrade ](https://docs.telerik.com/reporting/installation-upgrading-newer-version)the project to the newest version (check our [Release History](https://www.telerik.com/support/whats-new/reporting/release-history)) by running the [Upgrade Wizard](https://docs.telerik.com/reporting/ui-upgrade-wizard).  

