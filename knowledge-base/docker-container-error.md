---
title: The type initializer for 'Telerik.Reporting.Processing.Common.FontContainer' threw an exception.
description: The following error might be thrown in docker container
type: troubleshooting
page_title: The type initializer for 'Telerik.Reporting.Processing.Common.FontContainer' threw an exception.
slug: docker-container-error
position: 
tags: 
ticketid: 1445253
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Error Message
InnerException = {System.TypeInitializationException: The type initializer for 'Telerik.Reporting.Drawing.Unit' threw an exception. ---> System.TypeInitializationException: The type initializer for 'Gdip' threw an exception. ---> System.DllNotFoundException: Unable to load ...
InnerException = {System.TypeInitializationException: The type initializer for 'Gdip' threw an exception. ---> System.DllNotFoundException: Unable to load shared library 'libdl' or one of its dependencies. In order to help diagnose loading problems, consider setting the LD_...
Message = "The type initializer for 'Gdip' threw an exception."
Message = "Unable to load shared library 'libdl' or one of its dependencies. In order to help diagnose loading problems, consider setting the LD_DEBUG environment variable: liblibdl: cannot open shared object file: No such file or directory"

## Solution
1. Test the approaches given in [Can't use System.Drawing.Common in microsoft/dotnet:runtime](https://github.com/dotnet/dotnet-docker/issues/618).
For example, [make sure you install it in your runtime and not in your dotnet build](https://github.com/dotnet/dotnet-docker/issues/618#issuecomment-467816141).

2. Check [Using Telerik Reporting in .NET Core Applications](https://www.telerik.com/blogs/using-telerik-reporting-in-net-core-applications) Blog post where 
you can find some additional information for using Telerik Reporting under Linux in 
**How do I Run it on Linux?** and **Wow. What about Containers?**  sections.
