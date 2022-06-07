---
title: Unable to get report parameters - Report reportName cannot be resolved
description: Unable to get report parameters - Report reportName cannot be resolved
type: troubleshooting
page_title: Unable to get report parameters - Report reportName cannot be resolved
slug: unable-to-get-report-parameters-report-cannot-be-resolved
position: 
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

Trying to display a report in a report viewer through the use of a [Reporting web service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}) may result in the following error being displayed inside the report viewer.

## Error Message

```
Unable to get report parameters.
Report reportName.trdp/x cannot be resolved.
```

## Cause\Possible Cause(s)

1. The report definition file cannot be resolved by the reporting service because it cannot be found at the given path. 

2. The service does not have permissions for the folder used to store the report definitions and thus the reports cannot be resolved.

3. If the application with the reporting web service is deployed in an environment that heavily restricts the GDI APIs. An example of such a case would be an Azure environment with **lower** than **Basic** [App Service plan](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/).

4. If the application with the reporting web service is running on a Linux system. This is because the GDI APIs are not available **at all** on Linux and substitite libraries must be installed in order for the reports to be rendered.  

## Solution

1. Make sure that the path used by the ReportSourceResolvers is correct in every environment under which the reporting service is run and that the folder with the reports is accessible.

2. The problem may be related to folder access permissions. For example, make sure that the "**Copy to output directory**" setting of the report file is set to **True**. This setting may be configured by selecting the file inside Visual Studio. It should be inside the **Properties** window of that file.

3. If the application is to be deployed on Azure, make sure that the app service plan offers the required GDI+ APIs in order for the service to be able to render the reports. From what we know, the GDI+ APIs are currently available in **Basic and higher** [App Service plans](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/), and even these implementations have some GDI API restrictions that affect the image rendering.

4. If the service will be used to render reports under Linux, the [libgdiplus library](https://www.mono-project.com/docs/gui/libgdiplus/) must be installed on that machine. The following code may be used to install the necessary libraries:

   ```
   sudo apt-get update
   sudo apt-get install libc6-dev
   sudo apt-get install libgdiplus
   ```

### See Also
- [Preview reports using REST Service deployed in Azure](./preview-reports-using-rest-service-deployed-in-azure)

- [How to Build and Install Latest libgdiplus library on Linux](./how-to-build-and-install-libgdiplus-linux)
