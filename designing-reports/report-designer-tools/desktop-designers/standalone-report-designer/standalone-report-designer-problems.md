---
title: Standalone Report Designer Problems
page_title: Standalone Report Designer Problems 
description: Standalone Report Designer Problems
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/standalone-report-designer-problems
tags: standalone,report,designer,problems
published: True
position: 8
previous_url: /Troubleshooting-Standalone-Report-Designer-problems
---

# Standalone Report Designer Problems

## Standalone Report Designer Crashes

When the Standalone Report Designer crashes while working with Telerik Reporting, the way to determine what has caused the problem is described in the following steps: 

* Upgrade to the latest version of the product in case the reason for the crash has been fixed.

* Try the reproduce the crash on another machine to exclude machine specific problems e.g., corrupted Telerik Reporting installation.

* Provide us with a log file containing detailed information about the Standalone Report Designer crash. To create the log file, turn on tracing for the Standalone Report Designer and perform the actions which caused the crash. Below is the XML you need to add to the designer's configuration file to enable tracing: 

	+ For the `.NET Framework` Standalone Designer version

		The Trace Listener for `.NET Framework` is setup in the `system.diagnostics` section of the designer's configuration file `Telerik.ReportDesigner.exe.config`:

		````XML
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

		More details about the .NET Framework Standalone Report Designer's configuration file are available in the [Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview%}) article. `Telerik.ReportDesigner.exe.config` resides in the __[InstallDir]/Report Designer__ directory by default (it is recommended to create a backup copy before modifying it). 

	+ For the `.NET` Standalone Designer version

		The Trace Listener for `.NET` is setup in the `Telerik.Reporting` section of the designer's configuration file `Telerik.ReportDesigner.Net.dll.config`.

		````XML
<?xml version ="1.0"?>
		<configuration>
			...
			<Telerik.Reporting>
				...
				<traceListeners>
					<add name="myCustomListener" type="CustomListenersNamespace.CustomListener, CustomListenersAssembly"  initializeData="Telerik.ReportDesigner.custom.log" />
					<remove name="Default" />
				</traceListeners>
			</Telerik.Reporting>
		</configuration>
````

		The `type` specifies the Assembly Qualified Name of the Trace Listener type implementing the abstract class [System.Diagnostics.TraceListener](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.tracelistener?view=net-6.0).

		You may use its implementations in `System.Diagnosics` like [System.Diagnostics.TextWriterTraceListener](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.textwritertracelistener?view=net-6.0) and they will be discovered automatically even if you don't provide the assembly name specified as _CustomListenersAssembly_. 

		If you provide a custom `type`, you need to copy its assembly in the designer's folder (see its path below). You need also to provide the assembly name _CustomListenersAssembly_ along with the full type name _CustomListenersNamespace.CustomListener_.

		More details about the .NET Standalone Report Designer's configuration file are available in the [Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview%}) article. `Telerik.ReportDesigner.Net.dll.config` resides in the __[InstallDir]/Report Designer/.NET__ directory by default (it is recommended to create a backup copy before modifying it). 

* Check the event viewer logs for any log entries related to the problem.

* Use Visual Studio Debugger to attach to the __Telerik.ReportDesigner.exe__ running process before it crashes, in order to pinpoint where the error occurs. 

After you generate the log files from the above steps, archive them and attach them to a support ticket. Include the steps which have to be followed in order to reproduce the issue. 

## The report cannot be opened in the Standalone Report Designer

Please refer to the information from the following KB article: [The report cannot be opened in the Standalone Report Designer]({%slug report-cannot-be-opened-in-standalone-report-designer%}) 
