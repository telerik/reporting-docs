---
title: How to Build and Install Latest libgdiplus library on Linux
description: Step-by-step installation description of libgdiplus on Linux
type: how-to
page_title: How to build and install the latest libgdiplus library on Linux
slug: how-to-build-and-Install-libgdiplus-linux
ticketid: 1433335
res_type: kb
previous_url: /knowledge-base/how-to-install-libgdiplus-centos-amazon-linux
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

Step-by-step article on how to build and install libgdiplus from source and prebuilt .deb package.

In a [special section](#solution-for-centos-and-amazon-linux) we will Learn how to find the repository to download and install `libgdiplus` on __CentOS__ and its derived __Amazon Linux__ operating system.

## General Solution

**Prerequisites:**

We are assuming that you already have older libgdiplus which installed its dependencies. More information and build and install instructions can be found here: https://github.com/mono/libgdiplus

`sudo apt install libgdiplus`

**Easier method:**

https://www.mono-project.com/download/stable/#download-lin

````
sudo apt install gnupg ca-certificates

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

sudo apt update

sudo apt install libgdiplus
````

**Harder method:**

On Debian-based distributions install prerequisites by running this command:

`sudo apt-get install libgif-dev autoconf libtool automake build-essential gettext libglib2.0-dev libcairo2-dev libtiff-dev libexif-dev`

Clone or download and unarchive libgdi repository: 

````
git clone https://github.com/mono/libgdiplus.git
cd libgdiplus
````

Run build script (Optionally you can use --with-pango parameter if you want to use this library: 

````
./autogen.sh
make 
````

Then run unit tests to verify that all is correct: 

`make check`

If everything is fine, install by running: 

`make install`

or  

`sudo make install`

If the first one fails because of missing rights.

## Solution for CentOS and Amazon Linux

The `libgdiplus` library for __CentOS__ Linux distributions resides in the `Epel` package repository. For most of the __CentOS__ versions, this repository is available by default. __Amazon Linux__ is based on __CentOS__ but not all of its versions contain `Epel` by default. Below are the commands necessary for installing this repository. Note that they may vary depending on the exact distribution, version, etc. You may need to run the terminal as administrator or use `sudo` to authorize.

````
yum install epel-release -y
# Note: if 'yum install epel-release' doesn't work for you, try manually updating the source
# rpm -ihv --nodeps https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
````

After successfully installing the repository with the above instructions, you may ensure that you have the `Epel` repository listed with the output from the following command:

`yum repolist`

If it is indeed available, you may run the below command and install the package itself:

`yum install libgdiplus`

### Known issues related to the `libgdiplus` on __CentOS__

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
