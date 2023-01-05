---
title: Hosting the Reporting REST Service in Medium Trust environment leads to a permission error.
description: A *Hosting with Medium Trust* - '**Request for the permission of type 'System.Security.Permissions.SecurityPermission, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089' failed.**' error is thrown in the report viewer when the Reporting REST service is being hosted in a Medium Trust environment.
type: troubleshooting
page_title: Medium Trust environment breaks the Reporting REST Service
slug: hosting-with-medium-trust-request-for-permission-failed
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting REST Service</td>
		</tr>
		<tr>
			<td>Application Type</td>
			<td>Web Application</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 Report Viewer</td>
		</tr>		
	</tbody>
</table>

## Error Message

*Hosting with Medium Trust: "**Request for the permission of type 'System.Security.Permissions.SecurityPermission, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089' failed.**"*  

## Cause
  
The [Reporting REST Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}) is not designed to operate in *Medium Trust* environment. 

## Description

The error will be bubbled in the web viewer's preview window when the Reporting REST service is hosted in *Medium Trust* environment.

## Solution  

1. Separate the Reporting REST Service and host it in an environment with Full Trust- check [How To: Self Host Telerik Reporting REST Web API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-self-host-telerik-reporting-rest-web-api%}) and [How To: Add Telerik Reporting REST Web API to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%})(you can find the VS project template in the Reporting category of VS templates). This may require you to [enable CORS](https://www.asp.net/web-api/overview/security/enabling-cross-origin-requests-in-web-api) for the service to let the HTML5 Viewer communicate with it.

2. [Export reports programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) without displaying them. Please check the [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%}) article for more details, which rendering formats work.



