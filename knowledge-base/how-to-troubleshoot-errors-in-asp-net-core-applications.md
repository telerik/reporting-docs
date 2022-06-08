---
title: Troubleshooting reporting implementation into ASP.NET Core application
description: How to troubleshoot errors in ASP.NET Core applications when crashing
type: how-to
page_title: How to troubleshoot errors in ASP.NET Core projects 
slug: how-to-troubleshoot-errors-in-asp-net-core-applications 
position: 
tags: ASP.NET Core, Configuration
ticketid: 1383767
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>ASP.NET Core</td>
	</tr>
	<tr>
		<td>.Net Framework</td>
		<td>.NET Core 2.1+</td>
	</tr>
</table>


## Description
If you are experiencing problems while working with Telerik Reporting, the right way to determine what have caused them is described in the following steps.

## Solution
- Upgrade to the latest version of the product in case the reason for the crash has been fixed.

- Try the reproduce the crash on another machine to exclude machine specific problems e.g., corrupted Telerik Reporting installation.

- Provide us with a log file containing detailed information about the error. To create the log file, go to the project that hosts the [Rest Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}) and add the below settings in the `Program.cs` file in the `Main` method:


````CSharp
public static void Main(string[] args)
{
     EnableTracing();
     BuildWebHost(args).Run();
}

static void EnableTracing()
{
     System.Diagnostics.Trace.Listeners.Add(new System.Diagnostics.TextWriterTraceListener(File.CreateText("log.txt")));
     System.Diagnostics.Trace.AutoFlush = true;
}
````


Upon running the project and reproducing the error, it will be generated an *aspnetcoredemo.log* file at the root of the application.

- Other recommended troubleshooting approach is to use [Fiddler Jam](https://www.telerik.com/fiddler-jam) or other proxy tool to check the requests, their responses and statuses. Please, create Fiddler trace (see [How to Record a Log with the Fiddler Jam Extension](https://www.youtube.com/watch?v=AegKWavRSv0)).

> After you generate the log files from the above steps, archive them and attach them to a support ticket. Include the steps which have to be followed in order to reproduce the issue.
