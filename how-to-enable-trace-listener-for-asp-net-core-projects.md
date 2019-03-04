---
title: Problems in ASP.NET Core applications
description: How to enable Trace Listener for ASP.NET Core applications when crashing
type: how-to
page_title: How to enable Trace Listener for ASP.NET Core projects 
slug: how-to-enable-trace-listener-for-asp-net-core-projects 
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
When the application crashes while working with Telerik Reporting, the way to determine what has caused the problem is described in the following steps.

## Solution
- Upgrade to the latest version of the product in case the reason for the crash has been fixed.
- Try the reproduce the crash on another machine to exclude machine specific problems e.g., corrupted Telerik Reporting installation.
- Provide us with a log file containing detailed information about the error. To create the log file, go to the project that hosts the [Rest Service](../telerik-reporting-rest-conception) and add the below settings in the Program.cs file in Main method:

```CSharp
public static void Main(string[] args)
{
    try
    {
        Trace.Listeners.Add(new TextWriterTraceListener(File.Create("aspnetcoredemo.log")));
        Trace.AutoFlush = true;
        BuildWebHost(args).Run();
    }
    finally
    {
        Trace.Close();
    }
}
```
After running the application and reproduce the error, it would be generated a *aspnetcoredemo.log* file at the root folder of the application.

- Other recommended troubleshooting approach is to use [Fiddler](http://www.telerik.com/fiddler) or other proxy tool to check the requests, their responses and statuses. Please create Fiddler trace (see [how to create .SAZ file](https://docs.telerik.com/fiddler/Save-And-Load-Traffic/Tasks/CreateSAZ)).

After you generate the log files from the above steps, archive them and attach them to a support ticket. Include the steps which have to be followed in order to reproduce the issue.
