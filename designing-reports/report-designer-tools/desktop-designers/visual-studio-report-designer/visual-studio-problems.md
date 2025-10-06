---
title: Troubleshooting
page_title: Troubleshooting Visual Studio Report Designer Problems
description: "Learn how to troubleshoot Visual Studio-related problems, what are the most common Visual Studio Report Designer issues, and how to fix them."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems
tags: visual,studio,report,designer,problems
published: True
position: 41
previous_url: /troubleshooting-visual-studio-problems
---

# Troubleshooting Visual Studio Report Designer

## Visual Studio Crashes

When Visual Studio crashes while working with Telerik Reporting, for example, when opening a Report in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). The way to determine what has caused the problem is described in the following steps:

- Upgrade to the latest version of the product in case the reason for the crash has been fixed.
- Try the reproduce the crash on another machine to exclude machine-specific problems e.g., corrupted Telerik Reporting installation.
- Provide us with a log file containing detailed information about the Visual Studio crash. To create the log file, turn on tracing for the Visual Studio IDE and perform the actions that caused the crash. Below is the XML you need to add to the `devenv.exe.config` file to enable tracing:

  ```XML
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
  ```

The `devenv.exe.config` file resides in `C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE` by default (it is recommended to create a backup copy before modifying it).

- Start Visual Studio with the log switch: [/Log (devenv.exe)](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2015/ide/reference/log-devenv-exe?view=vs-2015) which could also provide more info on the error.
- Check the event viewer logs for any logs that could provide more info about the problem.
- Attach to the `devenv.exe` running process with another Visual Studio instance, to pinpoint where the error occurs.

After you generate the log files from the above steps, archive them and attach them to a support ticket. Include the steps which have to be followed to reproduce the issue.

## The report cannot be built and opened in Visual Studio Report Designer

Please refer to the information from the following KB article: [The report cannot be built and opened in Visual Studio Report Designer]({%slug report-cannot-be-built-and-opened-in-vs-report-designer%})

## The Visual Studio Report Designer is blank

Please refer to the information from the following KB article: [The Visual Studio Report Designer is blank]({%slug vs-report-designer-is-blank%})

## Missing Telerik menu in Visual Studio

Please refer to the information from the following KB article: [Missing Telerik menu in Visual Studio]({%slug missing-telerik-menu-in-visual-studio%})

## Visual Studio missing Telerik Reporting Toolbox items

Please refer to the information from the following KB article: [Telerik Reporting Toolbox items are missing.]({%slug telerik-reporting-toolbox-items-are-missing%})

## Visual Studio missing Telerik Reporting Item Template

Please refer to the information from the following KB article: [Telerik Reporting Item Template is missing.]({%slug telerik-reporting-missing-in-visual-studio%})
