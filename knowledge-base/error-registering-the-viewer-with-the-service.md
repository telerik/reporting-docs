---
title: Error registering the viewer with the service.
description: After deploying there is an error Access to the path 'C:\Windows\TEMP\Html5DemoApp\<VERSION>\LCT\value.dat' is denied.
type: troubleshooting
page_title: Error registering the viewer with the service.  An error has occurred.  Access to the path 'C:\Windows\TEMP\Html5DemoApp\<VERSION>\LCT\value.dat' is denied.
slug: error-registering-the-viewer-with-the-service
position: 
tags: 
ticketid: 1165109
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Error Message
Error registering the viewer with the service. 

An error has occurred. 

Access to the path 'C:\Windows\TEMP\Html5DemoApp\\**VERSION**\LCT\value.dat' is denied.

Where **VERSION** is the current used version of the product.

## Cause\Possible Cause(s)
The error message "Access to the path X is denied" indicates that the [Telerik Reporting REST service](https://docs.telerik.com/reporting/telerik-reporting-rest-conception) cannot access the configured file storage. By default, user temp folder will be used as a storage which is *'C:\Windows\TEMP'* in this case. 

## Solution
Test changing the default folder using the [second oveload of the FileStorage](https://docs.telerik.com/reporting/m-telerik-reporting-cache-file-filestorage--ctor-1) and passing the custom folder location. The changes need to be made in ReportsController.cs file where the setting of the Reporting REST service are defined.

Make sure that the IIS process has read/write access for the folder used by the storage. You can give access to the folder from its Properties - Sharing|Security options or change the used application pool's Identity through IIS Manager.

In case of different instances of the application running, set a unique **HostAppId** for each instance of the Reporting REST Service. The settings must be added in the ReportsControllerBase implementation.
Depending on the hosting environment, it should be considered the appropriate cache storage options - please check the available options in [REST Service Storage](https://docs.telerik.com/reporting/telerik-reporting-rest-service-storage).
