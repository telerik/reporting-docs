---
title: Error Unable to Get Report Parameters
description: "Learn why the exception with the message 'Unable to get report parameters - Report reportName cannot be resolved' may occur in Telerik Reporting."
type: troubleshooting
page_title: Unable to get report parameters - Report reportName cannot be resolved
slug: unable-to-get-report-parameters-report-cannot-be-resolved
tags: Azure, Linux
ticketid: 1532722
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

Trying to display a report in a report viewer through the use of a [Reporting web service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) may result in the following error being displayed inside the report viewer.

## Error Message

````
Unable to get report parameters.
Report reportName.trdp/x cannot be resolved.
````

## Cause\Possible Cause(s)

1. The report definition file cannot be resolved by the reporting service because it cannot be found on the given path.
1. The service does not have permissions for the folder used to store the report definitions and thus the reports cannot be resolved.
1. If the application with the reporting web service is deployed in an environment that heavily restricts the GDI APIs. An example of such a case would be an Azure environment with **lower** than **Basic** [App Service plan](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/).
1. If the application with the reporting web service runs on a Linux system with the [GDI engine]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}#graphics-engine). This is because the GDI APIs are not available **at all** on Linux and substitute libraries must be installed for the reports to be rendered.

## Solution

1. Make sure that the path used by the ReportSourceResolvers is correct in every environment under which the reporting service is run and that the folder with the reports is accessible.
1. The problem may be related to folder access permissions. For example, make sure that the `Copy to Output Directory` setting of the report file is set to `Copy always` or `Copy if newer`. This setting may be configured by selecting the file inside Visual Studio. It should be inside the **Properties** window of that file.
1. If the application is to be deployed on Azure, make sure that the app service plan offers the required GDI+ APIs for the service to be able to render the reports. From what we know, the GDI+ APIs are currently available in **Basic and higher** [App Service plans](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/), and even these implementations have some GDI API restrictions that affect the image rendering.
1. If the service will be used to render reports under Linux with the GDI engine, the [libgdiplus library](https://www.mono-project.com/docs/gui/libgdiplus/) must be installed on that machine. See [Deploying on Linux Using libgdiplus]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}#using-systemdrawing) for more information on how to do that.

## See Also

* [Preview reports using REST Service deployed in Azure]({%slug preview-reports-using-rest-service-deployed-in-azure.md%})
* [How to Build and Install Latest libgdiplus library on Linux]({%slug how-to-build-and-Install-libgdiplus-linux%})
