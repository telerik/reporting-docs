---
title: Adding Extra Fields to the Email Form in the Html5ReportViewer
description: Explains how to send extra parameters from the report viewer email form to the SendMailMessage method on the ReportsController.  
type: how-to
page_title: How to Pass Extra Parameters from the Html5ReportViewer to the SendMailMessage Method
slug: how-to-pass-extra-parameters-from-the-html5reportviewer-to-the-sendmailmessage-method
position: 
tags: html5reportviewer,email,sendmailmessage
ticketid: 1478987
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
			<td>Report Viewer</td>
			<td>HTML5 Report Viewer</td>
		</tr>
	</tbody>
</table>


## Description
In this article, you can find out how to pass some extra parameters from the report viewer email form to the SendMailMessage method of the ReportsController.


## Solution
The [SendEmail properties](../properties-t-telerik-reportviewer-mvc-sendemail) get passed from the viewer. 
They will be received as an instance of the [MailMessage class](https://docs.microsoft.com/en-us/dotnet/api/system.net.mail.mailmessage?view=netframework-4.8) in
the ReportsController [SendMailMessage method](../m-telerik-reporting-services-webapi-reportscontrollerbase-sendmailmessage). 

Another option is to use the [sendEmailEnd(e, args)](../html5-report-viewer-reportviewer-events-sendemailend) event handler of the viewer to modify any of the above properties that are available in the args parameter and then split out the needed information from this property in the controller and use it as needed.

## See Also
- [SendEmail properties](../properties-t-telerik-reportviewer-mvc-sendemail)
- [MailMessage class](https://docs.microsoft.com/en-us/dotnet/api/system.net.mail.mailmessage?view=netframework-4.8)
- [SendMailMessage method](../m-telerik-reporting-services-webapi-reportscontrollerbase-sendmailmessage)
- [sendEmailEnd(e, args)](../html5-report-viewer-reportviewer-events-sendemailend)
