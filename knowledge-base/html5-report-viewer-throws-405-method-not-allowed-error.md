---
title: HTML5 Report Viewer throws 405 (Method Not Allowed) error
description: Upon running the application an error 405 (Method Not Allowed) is thrown
type: troubleshooting
page_title: HTML5 Report Viewer throws 405 (Method Not Allowed) error
slug: html5-report-viewer-throws-405-method-not-allowed-error
position: 
tags: Html5ReportViewer
ticketid: 
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
```
Failed to load resource: the server responded with a status of 405 (Method Not Allowed)
```

## Description
[Telerik Reporting REST service](../telerik-reporting-rest-conception) requires **PUT** and **DELETE** verbs. Those verbs might be blocked by the *WebDavModule*.

## Solution
Therefore, make sure *WebDavModule* is removed as shown in the following configuration:
```
<configuration>
  <system.webServer>
    <modules runAllManagedModulesForAllRequests="true">
      <remove name="WebDAVModule"/>
    </modules>
  </system.webServer>
</configuration>
```
