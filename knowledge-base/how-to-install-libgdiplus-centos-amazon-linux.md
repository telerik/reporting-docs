---
title: How to Install libgdiplus Library on CentOS and Amazon Linux
description: "Learn how to find and install the libgdiplus library on CentOS and its derived Amazon Linux operating system in this step by step tutorial."
type: how-to
page_title: Install libgdiplus library on CentOS and Amazon Linux
slug: how-to-install-libgdiplus-centos-amazon-linux
position: 
tags: Linux,CentOS,Amazon,libgdiplus,tutorial
ticketid: 
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Operating System</td>
			<td>Linux</td>
		</tr>
	</tbody>
</table>

## Description

Learn how to find the repository to download and install `libgdiplus` on __CentOS__ and its derived __Amazon Linux__ operating system.

## Solution

The `libgdiplus` library for __CentOS__ Linux distributions resides in the `Epel` package repository. For most of the __CentOS__ versions this repository is available by default. __Amazon Linux__ is based on __CentOS__ but not all of its versions contain `Epel` by default. Below are the commands necessary for installing this repository. Note that they may vary depending on the exact distribution, version, etc. You may need to run the terminal as administrator, or use `sudo` to authorize.

````
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -ihv --nodeps ./epel-release-latest-8.noarch.rpm
````

After successfully installing the repository with the above instructions, you may assure that you have the `Epel` repository listed with the output from the following command:

`yum repolist`

If it is indeed available, you may run the below command and install the package itself:

`yum install libgdiplus`

## Known issues related to the `libgdiplus` on __CentOS__

An exception with the following stack trace may occur in some cases:

````
Unhandled exception. System.TypeInitializationException: The type initializer for 'Telerik.Reporting.Processing.Common.FontContainer' threw an exception.
 ---> System.TypeInitializationException: The type initializer for 'Gdip' threw an exception.
 ---> System.DllNotFoundException: Unable to load shared library 'libdl' or one of its dependencies. In order to help diagnose loading problems, consider setting the LD_DEBUG environment variable: liblibdl: cannot open shared object file: No such file or directory
   at Interop.Libdl.dlopen(String fileName, Int32 flag)
   at System.Drawing.SafeNativeMethods.Gdip.LoadNativeLibrary()
   at System.Drawing.SafeNativeMethods.Gdip..cctor()
   --- End of inner exception stack trace ---
   at System.Drawing.SafeNativeMethods.Gdip.GdipNewPrivateFontCollection(IntPtr& fontCollection)
   at System.Drawing.Text.PrivateFontCollection..ctor()
   at Telerik.Reporting.Processing.Common.FontContainer..ctor()
   at Telerik.Reporting.Processing.Common.FontContainer..cctor()
   --- End of inner exception stack trace ---
   at Telerik.Reporting.Processing.ReportProcessor.ProcessReportSource(ReportSource reportSource, IRenderingContext context)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessReportSource(ReportSource reportSource, Hashtable deviceInfo, IRenderingContext context)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessAndRender(String format, ReportSource reportSource, Hashtable deviceInfo, IRenderingContext renderingContext, CreateStream createStreamCallback)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessAndRenderStateless(String format, ReportSource reportSource, Hashtable deviceInfo, IRenderingContext renderingContext, CreateStream createStreamCallback)
   at Telerik.Reporting.Processing.ReportProcessor.<>c__DisplayClass47_0.<RenderReport>b__0(SingleStreamManager sm)
   at Telerik.Reporting.Processing.ReportProcessor.RenderReportSafe(Func`2 renderCallback, String format, IRenderingContext renderingContext)
   at Telerik.Reporting.Processing.ReportProcessor.RenderReport(String format, ReportSource reportSource, Hashtable deviceInfo, CancellationToken cancellationToken)
   at Telerik.Reporting.Processing.ReportProcessor.RenderReport(String format, ReportSource reportSource, Hashtable deviceInfo)
   at Program.<Main>$(String[] args) in /home/projects/ConsoleApp1/ConsoleApp1/Program.cs:line 10
````

If you see the error, run the next command to fix it:

`ln -s /lib64/libdl.so.2 /lib64/libdl.so`

## See Also

* [System.Drawing on CentOS: Unable to load DLL 'libdl'](https://github.com/dotnet/runtime/issues/24070)
* [libgdiplus Docs](https://www.mono-project.com/docs/gui/libgdiplus/)
