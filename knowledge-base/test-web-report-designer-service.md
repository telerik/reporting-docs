---
title: Test whether Web Report Designer Service is Responding
description: Send Get request to this endpoint to test whether the Web Report Designer Service works
type: troubleshooting
page_title: Test Web Report Designer Service
slug: test-web-report-designer-service
tags: web report designer, rest api
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  <tr>
    <td>version</td>
    <td>13.2.19.918 - 14.0.20.219</td>
	</tr>
</table>


## Description
When setting up a Web Report Designer in an application it is very useful to be able to test whether the necessasry Web Designer Service 
configured by default in the __ReportDesignerController__ is working. Just as you can perform the 
[Get request to 'api/reports/formats']({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%}) for the Telerik Reporting REST 
Service.

## Solution
Use the endpoint
```
api/reportdesigner/cultureContext
```

If successful, it should return the separators determined by the current culture, for example:
```
{"decimalSeparator":".","listSeparator":","}
```

For an example, [test the endpoint in our online demo](https://demos.telerik.com/reporting/api/reportdesigner/cultureContext).  
