---
title: Telerik Reporting Toolbox items are missing
description: Telerik Reporting Toolbox items are missing.
type: how-to
page_title: Telerik Reporting Toolbox items are missing
slug: telerik-reporting-toolbox-items-are-missing
res_type: kb
---
  

## Description  
After installing Telerik Reporting, some problems related to the Visual Studio Toolbox might appear. For example:

1. Toolbox items for Telerik Reporting are missing in Visual Studio;
2. It takes too much time to load a Toolbox on each Visual Studio launch;
3. Toolbox items are duplicated on each Visual Studio launch.


The above-mentioned problems are usually caused by the absence of the **Microsoft.VisualStudio.IDE.ToolboxControlsInstaller.ToolboxInstallerPackage** when loading the studio or by some incorrect registry settings that cause this package to crash unexpectedly while loading toolbox items.  
  
## Solution   
  

To understand the cause of Toolbox issues and resolve them, perform the following steps:

1. Open the "%USERPROFILE%\AppData\Local\Microsoft\VisualStudio\10.0" folder and remove all .TBD files.
2. Run the Registry Editor (regedit.exe).
3. Locate the following keys:  
  

    "HKEY\_CURRENT\_USER\Software\Microsoft\VisualStudio\10.0\ToolboxControlsInstaller\_AssemblyFoldersExCache"  
  

    "HKEY\_CURRENT\_USER\Software\Microsoft\VisualStudio\10.0\ToolboxControlsInstallerCache"
4. Remove these keys with their sub-keys.
5. Launch Visual Studio 2010 using the following command line:   
  

    In a 32-bit Windows:  

    "C:\Program Files\Microsoft Visual Studio 10.0\Common7\IDE\devenv" /ResetSkipPkgs /log "&lt;my\_folder&gt;\ActivityLog.xml"  
  

    In a 64-bit Windows:  

    "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv" /ResetSkipPkgs /log "&lt;my\_folder&gt;\ActivityLog.xml"
6. Open the report for edit in the [Report Designer](../ui-report-designer) and switch to the Toolbox. Toolbox items should appear after some time that is required for recreating all items on the first load.


These steps should help you find the cause of Toolbox issues in most cases. If the activity log did not help you determine the cause of the problem, send us the Visual Studio Log file that has been created after step 6:  
 &lt; my\_folder&gt;\ActivityLog.xml.


You can also review this Log file to resolve Toolbox issues manually:

**Issue 1: Toolbox items are missing**  
  
If using Visual Studio 2015 you can test adding the missing items manually:  
  
 1. *Right-click* on the Toolbox area.  
 2. Select *"Choose items..."* option from the context menu.  
 3. In ".NET Framework Components" tab of *Choose Toolbox items* dialog check the missing components from **Telerik.Reporting assembly.**  
  
If using older versions of Visual Studio, you can check if the ActivityLog.xml log file has records containing the string:

**"Microsoft.VisualStudio.IDE.ToolboxControlsInstaller.ToolboxInstallerPackage"**

If there are no such records, it is likely that the following key is missing:

In a **32-bit** Windows:  

 **"HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\VisualStudio\10.0\Packages\{2c298b35-07da-45f1-96a3-be55d91c8d7a}"**

In a **64-bit** Windows: 

 **"HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\Packages\{2c298b35-07da-45f1-96a3-be55d91c8d7a}"**

This registry key is added during Visual Studio installation. To resolve this issue, restore this key either by reinstalling Visual Studio.

If one of these keys exists, but you still don't see toolbox items, expand the key and you will see the "Toolbox" key. This key should contain the "DefaultItems" value and this value shouldn't be 0. If you see 0, just change it to 1 to fix the issue.
   
**Issue 2: It takes a long time for the Toolbox to load on each launch of Visual Studio**  

**Issue 3: Toolbox items are duplicated on each launch of Visual Studio**  
  
 To resolve these issues, open the ActivityLog.xml log file and locate the last entry of the string:  
 *"Microsoft.VisualStudio.IDE.ToolboxControlsInstaller.ToolboxInstallerPackage"*   
 This last entry points to a problematic assembly.

At the end of this line, there is information about the problematic assembly. After issues with this assembly are resolved, repeat the steps mentioned above to catch other issues (if any).

If this last entry contains the following string:  
 *"Attempting to get Toolbox items from Assembly Microsoft.ServiceModel.DomainServices.EntityFramework"*  
The cause of the issues is RIA services. Uninstall WCF RIA Services and WCF RIA Services ToolKit (if they are unnecessary) or remove the following registry keys:

In a **32-bit** Windows: 

 **HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\Microsoft SDKs\Silverlight\v4.0\AssemblyFoldersEx\Ria Services v1.0 Silverlight Libraries\Toolbox  
 HKEY\_LOCAL\_MACHINE\SOFTWARE\Microsoft\Microsoft SDKs\Silverlight\v5.0\AssemblyFoldersEx\Ria Services v1.0 Silverlight Libraries\Toolbox**

In a **64-bit** Windows: 
 
 **HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Silverlight\v4.0\AssemblyFoldersEx\Ria Services v1.0 Silverlight Libraries\Toolbox  
 HKEY\_LOCAL\_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Silverlight\v5.0\AssemblyFoldersEx\Ria Services v1.0 Silverlight Libraries\Toolbox**





