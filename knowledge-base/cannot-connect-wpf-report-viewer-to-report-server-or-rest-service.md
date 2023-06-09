---
title: Cannot Connect WPF/WinForms Viewer to Report Server/REST Service
description: "Learn why on attempt to connect WPF or WinForms ReportViewer to an engine of remote type, i.e. Report Server or REST Service, an error 'The assembly Telerik.Reporting.Services.HttpClient.dll cannot be loaded' occurs."
type: troubleshooting
page_title: Fail connecting desktop Report Viewer to remote Reporting engine
slug: cannot-connect-wpf-or-winforms-report-viewer-to-report-server-or-rest-service
position: 
tags: WPFViewer, WinFormsVIewer, RestService, ReportServer
ticketid: 1407838
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
			<td>Project Type</td>
			<td>WPF and WinForms applications</td>
		</tr>
		<tr>
			<td>Viewer</td>
			<td>WPF/WinForms Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description

On attempt to connect WPF or WinForms ReportViewer to an engine of remote type, i.e. [Report Server](https://docs.telerik.com/report-server/introduction) or [REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), the following error occurs:

`The assembly Telerik.Reporting.Services.HttpClient.dll cannot be loaded.`

## Solution

The `Telerik.Reporting.Services.HttpClient.dll` is required if the selected engine is of remote type (REST Service or Report Server). Please make sure that you have added a reference to this assembly to the current project.

It could be found in Telerik Reporting installation directory. For example `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Bin\Telerik.Reporting.Services.HttpClient.dll`.

As a side note, we strongly suggest using the [Telerik Report Viewer Window Item Template]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%}) to create a window and host the report viewer in it. It will automatically add all required references and verify if all resources needed are added to the project.

## See Also

* [Using WPF Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%})
* [Using WPF Report Viewer With REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-rest-service%})
* [Using Windows Forms Report Viewer With REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-rest-service%})
* [Using Windows Forms Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%})
