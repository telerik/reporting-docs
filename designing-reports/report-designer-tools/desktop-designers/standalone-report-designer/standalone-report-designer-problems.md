---
title: Standalone Report Designer Problems
page_title: Standalone Report Designer Problems | for Telerik Reporting Documentation
description: Standalone Report Designer Problems
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/standalone-report-designer-problems
tags: standalone,report,designer,problems
published: True
position: 8
---

# Standalone Report Designer Problems



## Standalone Report Designer Crashes

When the Standalone Report Designer crashes while working with Telerik Reporting,           the way to determine what has caused the problem is described in the following steps:         

* Upgrade to the latest version of the product in case the reason for the crash has been fixed.

* Try the reproduce the crash on another machine to exclude machine specific problems e.g., corrupted Telerik Reporting installation.

* Provide us with a log file containing detailed information about the Standalone Report Designer crash.               To create the log file, turn on tracing for the Standalone Report Designer and perform the actions which caused the crash.               Below is the XML you need to add to the __Telerik.ReportDesigner(.x86).exe.config__  file to enable tracing:             

	
      ````xml
<?xml version ="1.0"?>
<configuration>
    ...
    <system.diagnostics>
        <trace autoflush="true" indentsize="4">
          <listeners>
            <add name="myListener" type="System.Diagnostics.TextWriterTraceListener" initializeData="c:\temp\StandaloneDesigner.LOG" />              
            <remove name="Default" />
          </listeners>
        </trace>
    </system.diagnostics>
</configuration>
````

More details about the Standalone Report Designer's configuration file are available in the [Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview%}) article."__Telerik.ReportDesigner(.x86).exe.config__  resides in the __[InstallDir]/Report Designer__  directory by default               (it is recommended to create a backup copy before modifying it).             

* Check the event viewer logs for any log entries related to the problem.

* Use Visual Studio Debugger to attach to the __Telerik.ReportDesigner(.x86).exe__  running process before it crashes,               in order to pinpoint where the error occurs.             

After you generate the log files from the above steps, archive them and attach them to a support ticket.           Include the steps which have to be followed in order to reproduce the issue.         

## The report cannot be opened in the Standalone Report Designer

Please refer to the information from the following KB article:  [The report cannot be opened in the Standalone Report Designer](./knowledge-base/report-cannot-be-opened-in-standalone-report-designer) 

# See Also

