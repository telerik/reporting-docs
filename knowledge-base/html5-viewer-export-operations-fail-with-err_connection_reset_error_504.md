---
title: HTML5 Viewer Export Operations Fail with ERR_CONNECTION_RESET HTTP Error 504
description: HTML5 Viewer export operations fail with ERR_CONNECTION_RESET HTTP Error 504
type: troubleshooting
page_title: HTML5 Viewer Export Operations Fail with ERR_CONNECTION_RESET HTTP Error 504
slug: html5-viewer-export-operations-fail-with-err_connection_reset_error_504
position: 
tags: reportviewer,export,http errror
ticketid: 1431303
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
Export operations initiated through the HTML5 Viewer result in ERR_CONNECTION_RESET ERROR 504 when Telerik UI for ASP.NET AJAX RadCompression is enabled.
```
Fidler's raw response is:
[Fiddler] ReadResponse() failed: The server did not return a complete response for this request. Server returned 0 bytes.                                                                                                                                                                                                                                                                                                                                                                                                       
```
## Solution
The RadCompression must be disabled for request to the Reporting REST service (WebAPI based) in order documents bytes to be received by the client(viewer).
``` XML
<configuration>
  <configSections>
    <sectionGroup name="telerik.web.ui">
      <section name="radCompression" type="Telerik.Web.UI.RadCompressionConfigurationSection, Telerik.Web.UI, PublicKeyToken=121fae78165ba3d4" allowDefinition="MachineToApplication" requirePermission="false"/>
    </sectionGroup>
  </configSections>
   
  <telerik.web.ui>
    <radCompression>
      <excludeHandlers>
        <add handlerPath="api/reports/" matchExact="false"/>
      </excludeHandlers>
    </radCompression>
  </telerik.web.ui>
```
where the handlerPath should point to the Reporting REST Service - the HTML5 Viewer's serviceUrl.

### See Also
* [RadCompression help article](https://docs.telerik.com/devtools/aspnet-ajax/controls/radcompression)
