---
title: Export operations fail in Chrome and Firefox with ERR_CONNECTION_RESET
description: Export operations initiated through the HTML5 Viewer results in ERR\_CONNECTION\_RESET error in Firefox and Chrome browsers when Telerik UI for ASP.NET AJAX RadCompression is *enabled.
type: how-to
page_title: ERR_CONNECTION_RESET error is thrown on trying to export a report to another rendering format
slug: html5-viewer-export-operations-fail-in-chrome-and-firefox-with-err_connection_reset
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Application Type</td>
			<td>Web Application</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 Report Viewer</td>
		</tr>
		<tr>
			<td>Browsers</td>
			<td>Google Chrome, Firefox</td>
		</tr>		
	</tbody>
</table>

## Error Message

**ERR_CONNECTION_RESET** error message.

**This site can't be reached.**

The connection was reset.

## Cause

**Telerik UI for ASP.NET AJAX RadCompression** is *enabled* for the Reporting REST Service endpoint. 

## Description

Export operations initiated through the HTML5 Viewer results in **ERR\_CONNECTION\_RESET** error in **Firefox** and **Chrome** browsers when **Telerik UI for ASP.NET AJAX RadCompression** is *enabled*.  
  
## Solution  

Disable the **RadCompression** to the [Reporting REST service](../telerik-reporting-rest-conception)(WebAPI based) to receive documents bytes in the client (Viewer).  

```xml
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

 Where the *handlerPath* should point to the Reporting REST Service - the HTML5 Viewer's *serviceUrl*.  
  
 For more information about the above configuration, please follow the [RadCompression](../../devtools/aspnet-ajax/controls/radcompression) help article.

