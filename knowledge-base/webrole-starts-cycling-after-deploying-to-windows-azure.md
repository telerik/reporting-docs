---
title: WebRole Starts Cycling after Deploying on Windows Azure
description: "Learn why WebRole starts cycling after deploying the project on Azure Windows environment and how to fix it."
type: troubleshooting
page_title: WebRole cycling when deploying the solution to Azure with Windows
slug: webrole-starts-cycling-after-deploying-to-windows-azure
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Environment</td>
		<td>Windows Azure</td>
	</tr>
</table>

## Error Message

- Windows Azure Activity log shows:

	`Instance 0 of role WebRole1 is cycling.`

- Server Explorer shows:

	`Windows Azure > Cloud Services > [service name] > [environment] > [WebRole1] > Instance 0 (Cycling Role)`

- Windows Azure Portal shows:

	````
One or more role instances are unhealthy. 
	1 Instance: 1 Unhealthy
````


## Cause

This problem happens when you are trying to deploy an MVC 5 project which utilizes Telerik Reporting WebAPI REST service.

Usually, the MVC 5 project is also referencing the Web API 2 assemblies while the reports service is built against Web API 1 assemblies.

For this reason, several assembly binding redirects have to be added in order the service to start properly.

## Description

After deploying a WebRole which utilizes Telerik Reporting WebAPI REST Service to Windows Azure, the role becomes restarting and goes into a cycling state.

## Solution

- Add a new file named **[MyWebRoleName].dll.config** to the Web Role project at the same level as the **web.config** file is.
- Set its **Copy to Output Directory** property to **Copy always**.
- Add the following assembly binding redirects:

	````XML
<?xml version="1.0"?>
	<configuration>
		<runtime>
			<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1"> 
				<dependentAssembly>
					<assemblyIdentity name="System.Web.Http" publicKeyToken="31bf3856ad364e35"/>
					<bindingRedirect oldVersion="0.0.0.0-5.0.0.0" newVersion="5.0.0.0"/>
				</dependentAssembly>
				<dependentAssembly>
					<assemblyIdentity name="System.Net.Http.Formatting" publicKeyToken="31bf3856ad364e35"/>
					<bindingRedirect oldVersion="0.0.0.0-5.0.0.0" newVersion="5.0.0.0"/>
				</dependentAssembly>
			</assemblyBinding>
		</runtime>
	</configuration>
````

	> Check the exact versions of the referenced `System.Web.Http` and `System.Net.Nttp.Formatting` assemblies in order to setup the binding redirects correctly.

- Publish the solution to Windows Azure.

## Notes

Keep in mind that Windows Azure Web Apps (in **Free** and **Shared** modes) restricts applications to access some system resources, including GDI API, and rendering extensions as PDF would not be able to produce a document.

## See Also

* [OutOfMemoryException on exporting or printing Telerik report from Azure Web Apps]({%slug outofmemoryexception-on-exporting-or-printing-telerik-report-from-azure-webapps%})
* [Problems When Rendering Teleik Reports in Azure]({%slug azure-reporting-problems%})
