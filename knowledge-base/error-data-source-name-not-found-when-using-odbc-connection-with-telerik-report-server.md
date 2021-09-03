---
title: Error 'Data source name not found' when using ODBC connection with Telerik Report Server.
description: The error 'Data source name not found' is thrown when using ODBC connection with Telerik Report Server.
type: troubleshooting
page_title: The 'Data source name not found' error is fired when using ODBC connection with Telerik Report Server.
slug: error-data-source-name-not-found-when-using-odbc-connection-with-telerik-report-server
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting, Report Server</td>
	</tr>
  <tr>
		<td>Report Designer</td>
		<td>Standalone Report Designer</td>
	</tr>
  	<tr>
		<td>Report Item</td>
		<td>SqlDataSource</td>
	</tr>
</table>
  
  
## Description  

The error  ppears when Standalone Report Designer tries to open an **ODB**C connection, registered in Telerik Report Server, although the connection string is valid and ODBC DSN is registered as User DSN.  
 
## Error Message 
 
 ```
 'Data source name not found and no default driver specified.'
 ```
 
## Possible Cause

When a DSN is registered as <a href="https://support.microsoft.com/en-us/topic/what-is-a-dsn-data-source-name-ae9a0c76-22fc-8a30-606e-2436fe26e89f" target="_blank">User DSN</a>, this means that only the currently logged-in user can access it.

The Report Server pool uses <a href="https://social.msdn.microsoft.com/Forums/sqlserver/en-US/31d57870-1faa-4e14-8527-ce77b1ff40e4/local-service-local-system-or-network-service?forum=sqlsecurity" target="_blank">LocalSystem</a> built-in account by default, so it probably is unable to access the registered User DSN.

## Solution 

 The solution is to register the DSN as **System DSN** in **ODBC Data Source Administrator**, so it will be available to all users.  
