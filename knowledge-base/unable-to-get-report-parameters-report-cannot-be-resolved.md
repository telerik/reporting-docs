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

Trying to display a report in a report viewer through the use of a [Reporting web service](../telerik-reporting-rest-conception) may result in the following error being displayed inside the report viewer.

## Error Message

```
Unable to get report parameters.
Report reportName.trdp/x cannot be resolved.
```

## Cause\Possible Cause(s)

- The report definition file cannot be resolved by the reporting service because it cannot be found at the given path. 

- The service does not have permissions for the folder used to store the report definitions and thus the reports cannot be resolved.

- If the application with the reporting web service is deployed on Azure with **lower** than **Basic** [App Service plan](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/).

- If the application with the reporting web service is run on a Linux system.  

## Solution

- Make sure that the path used by the ReportSourceResolvers is correct in every environment under which the reporting service is run and that the folder with the reports is accessible.

- If the application is to be deployed on Azure, make sure that the app service plan offers the required GDI+ APIs required in order for the service to be able to render the reports. From what we know, the GDI+ APIs are currently available in **Basic and highe** [App Service plans](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/), and even these implementations have some GDI API restrictions that affect the image rendering.

- If the service will be used to render reports under Linux, the [libgdiplus library](https://www.mono-project.com/docs/gui/libgdiplus/) must be installed on that machine. The following code may be used to install the necessary libraries:

```
sudo apt-get update
sudo apt-get install libc6-dev
sudo apt-get install libgdiplus
```

## See Also
- [Preview reports using REST Service deployed in Azure](./preview-reports-using-rest-service-deployed-in-azure)

- [How to Build and Install Latest libgdiplus library on Linux](./how-to-build-and-install-libgdiplus-linux)
