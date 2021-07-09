---
title: Error 'Data source name not found' when using ODBC connection with Telerik Report Server
description: Error 'Data source name not found' when using ODBC connection with Telerik Report Server.
type: how-to
page_title: Error 'Data source name not found' when using ODBC connection with Telerik Report Server
slug: error-data-source-name-not-found-when-using-odbc-connection-with-telerik-report-server
res_type: kb
---

  
  
## Description  
 The message '*Data source name not found and no default driver specified*' appears when Standalone Report Designer tries to open an ODBC connection, registered in Telerik Report Server, although the connection string is valid and ODBC DSN is registered as User DSN.  
  
## Solution 
 When a DSN is registered as <a href="https://support.microsoft.com/en-us/topic/what-is-a-dsn-data-source-name-ae9a0c76-22fc-8a30-606e-2436fe26e89f" target="_blank">User DSN</a>, this means that only the currently logged-in user can access it. The Report Server pool uses <a href="https://social.msdn.microsoft.com/Forums/sqlserver/en-US/31d57870-1faa-4e14-8527-ce77b1ff40e4/local-service-local-system-or-network-service?forum=sqlsecurity" target="_blank">LocalSystem</a> built-in account by default, so it probably is unable to access the registered User DSN. The solution is to register the DSN as System DSN in ODBC Data Source Administrator, so it will be available to all users.  


