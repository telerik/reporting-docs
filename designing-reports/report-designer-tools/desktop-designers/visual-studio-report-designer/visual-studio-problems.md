---
title: Visual Studio Problems
page_title: Visual Studio Problems | for Telerik Reporting Documentation
description: Visual Studio Problems
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems
tags: visual,studio,problems
published: True
position: 4
---

# Visual Studio Problems



## Visual Studio Crashes

When Visual Studio crashes while working with Telerik Reporting,           the way to determine what has caused the problem is described in the following steps:         

* Upgrade to the latest version of the product in case the reason for the crash has been fixed.

* Try the reproduce the crash on another machine to exclude machine specific problems e.g., corrupted Telerik Reporting installation.

* Provide us with a log file containing detailed information about the Visual Studio crash.               To create the log file, turn on tracing for the Visual Studio IDE and perform the actions which caused the crash.               Below is the XML you need to add to the __devenv.exe.config__  file to enable tracing:             

	
      ````xml
<?xml version ="1.0"?>
<configuration>
    ...
    <system.diagnostics>
        <trace autoflush="true" indentsize="4">
          <listeners>
            <add name="myListener" type="System.Diagnostics.TextWriterTraceListener" initializeData="c:\temp\DEVENV.LOG" />              
            <remove name="Default" />
          </listeners>
        </trace>
    </system.diagnostics>
</configuration>
````

__devenv.exe.config__  resides in C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE by default (it is recommended to create a backup copy before modifying it).             

* Start Visual Studio with the log switch:  [/Log (devenv.exe)](https://msdn.microsoft.com/en-us/library/ms241272.aspx)                which could also provide more info on the error.             

* Check the event viewer logs for any logs that could provide more info about the problem.

* Attach to the __devenv.exe__  running process with another Visual Studio instance, in order to pinpoint where the error occurs.             

After you generate the log files from the above steps, archive them and attach them to a support ticket.           Include the steps which have to be followed in order to reproduce the issue.         

## The report cannot be built and opened in Visual Studio Report Designer

Please refer to the information from the following KB article:  [The report cannot be built and opened in Visual Studio Report Designer](./knowledge-base/report-cannot-be-built-and-opened-in-vs-report-designer) 

## The Visual Studio Report Designer is blank

Please refer to the information from the following KB article:  [The Visual Studio Report Designer is blank](./knowledge-base/vs-report-designer-is-blank) 

## Missing Telerik menu in Visual Studio

Please refer to the information from the following KB article:  [Missing Telerik menu in Visual Studio](./knowledge-base/missing-telerik-menu-in-visual-studio) 

## Visual Studio missing Telerik Reporting Toolbox items

Please refer to the information from the following KB article:  [Telerik Reporting Toolbox items are missing.](http://www.telerik.com/support/kb/reporting/general/missing-toolbox-items.aspx) 

## Visual Studio missing Telerik Reporting DataSource components

Please refer to the information from the following KB article:  [Telerik Reporting DataSource components are missing.](http://www.telerik.com/support/kb/reporting/details/telerik-reporting-datasource-components-are-missing) 

## Visual Studio missing Telerik Reporting Item Template

Please refer to the information from the following KB article:  [Telerik Reporting Item Template is missing.](http://www.telerik.com/support/kb/reporting/general/missing-item-template.aspx) 

# See Also

