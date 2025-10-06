---
title: Using With REST Service
page_title: Using the WPF Report Viewer With Reporting REST Service
description: "Learn how to set up the WPF Report Viewer to use a Reporting REST Service for rendering the reports in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-rest-service
tags: how,to,use,wpf,report,viewer,with,rest,service
published: True
reporting_area: WPF
position: 10
previous_url: /wpf-report-viewer-howto-use-it-with-rest-service
---

# Integrating the WPF Report Viewer With REST Service

This topic explains how to setup the WPF Report Viewer to work with Telerik Reporting REST Service

## Prerequisites

* Running [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) instance.
* In case you are not using the [Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project%}), add references to all the assemblies listed in the article [Requirements For Desktop Viewers Using Remote Report Sources]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/requirements-for-desktop-viewers-using-remote-report-sources%}).

## Configuring the WPF Report Viewer to work with REST Service

1. To create a form and host the report viewer in it, you can either use the item template, as explainedin the article [How to Add report viewer to a Windows Forms' .NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project%}), or place it yourself through drag-and-drop from the toolbox.

1. As soon as the report viewer is on your form, select it and locate the `ReportEngineConnection` property. Invoke the UI editor by pressing the ellipsis button. The `Report Engine Connection` dialog should appear:

	![An image ofthe Report Engine Connection dialog with REST Service option selected](images/wpf-connection-editor-rest-service.png)

1. The __Reporting engine__ combobox provides the following options:

	+ *Embedded* - the reports will be processed and rendered at the local machine that hosts the viewer. This is the default mode in order to preserve backwards compatibility.
	+ *REST Service* - the reports will be processed at the machine that hosts configured and running REST Service instance.
	+ *Report Server* - the reports will be processed and rendered at the machine that hosts configured and running [Telerik Report Server](https://docs.telerik.com/report-server/introduction) instance.

	Select `REST Service`.

1. In __URL__ textbox enter the address and port (if needed) of the machine that hosts the REST Service instance.Note that the */api/reports* part is already added so you need to prefix it with the service address.
1. Check the __Use default credentials__ checkbox if you need the default credentials to be sent with the requests by the [HTTP client handler](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httpclienthandler.usedefaultcredentials) that is used internally to communicate with the REST service.
1. In the __Document timeout__ textbox you can change the timeout for rendering a document, the default is `100` seconds.
1. Uncheck the __Keep client alive__ checkbox if you want the client session to expire.
1. Click __OK__ when ready. The dialog will close and the resulting connection string will be populated as a value of the __ReportEngineConnection__ property.
1. Locate the __ReportSource__ property. Invoke the UI editor by pressing the ellipsis button. The `Report Source Editor` dialog should appear:

	![An image of the Wpf Report Source Editor with UriReportSource being the selected option](images/WpfReportSourceEditor.png)

	>When the [ReportEngineConnection](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_ReportEngineConnection) property has `Engine` set to `RestService`, the viewer will serialize the report source identifier property (`URI` for [UriReportSource](/api/Telerik.Reporting.UriReportSource), `TypeName` for [TypeReportSource](/api/Telerik.Reporting.TypeReportSource), `ReportDocument` for [InstanceReportSource](/api/Telerik.Reporting.InstanceReportSource) and `XML` for [XmlReportSource](/api/Telerik.Reporting.XmlReportSource)) and send it to the service resolver. The *REST service* will use the `ReportSourceResolver` instances included in its [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ReportServiceConfiguration) to resolve the report by the provided identifier. However, the *REST service*'s default implementation includes only [UriReportSourceResolver](/api/Telerik.Reporting.Services.UriReportSourceResolver) and [TypeReportSourceResolver](/api/Telerik.Reporting.Services.TypeReportSourceResolver), so you need to provide a [Custom Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) if you use another type of [ReportSource](/api/Telerik.Reporting.ReportSource).

1. In this scenario we will use a [UriReportSource](/api/Telerik.Reporting.UriReportSource). Select the __UriReportSource__ entry. Confirm by clicking __OK__.
1. Expand the __ReportSource__ node in Properties window. In the provided __Uri__ textbox enter the category and the name of the report you want to display using the following format: `{Category}/{ReportName}`, as shown below:

	![An image of the WPF UriReportSource Property Grid where the report and its parameters can be set](images/WpfSetUriReportSourcePropertyGrid.png)

1. Click __OK__ when ready. The dialog will close and the resulting report source will be populated as a value of the __ReportSource__ property.
1. Build and run your application. If your settings are configured correctly, you should see the report displayed in the report viewer of your WPF application. If not, check the [Troubleshooting](#Troubleshooting) section below.

> When setting [ReportEngineConnection](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_ReportEngineConnection) with code, make sure you call the [RefreshReport()](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_RefreshReport) method or set the [ReportSource](/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_ReportSource) property afterwards, so the connection's new value will be respected.

## Troubleshooting

The following table shows the most common reasons for failure when using the Telerik Reporting REST Service. It is strongly recommended to use a tool like Fiddler or any other web debugger when investigating such a problem.

| Problem | Cause |
| ------ | ------ |
|The viewer displays the message:<br />`A problem occurred while registering client.`|Check if the REST service is active and running - the easiest way is to make a request for the available document formats, as explained in [How to Add Telerik Reporting REST Web API to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application
%}).|
|The viewer displays the message:<br />`System.OperationCanceledException: *{ReportName}* report cannot be resolved.`|Make sure the URL or type name specified in the __report source__ property is valid and can be resolved by the REST service.|
|The viewer displays the message:<br />`System.Net.WebException: The remote name could not be resolved: {name}`|Make sure that the address specified in the connection string exists and represents a valid and running REST service instance.|

## See Also

* [How to Use WPF Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%})
* [How to Construct a string to connect to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}) 
* [EmbeddedConnectionInfo](/api/Telerik.ReportViewer.Common.EmbeddedConnectionInfo)  
* [ReportServerConnectionInfo](/api/Telerik.ReportViewer.Common.ReportServerConnectionInfo)  
* [RestServiceConnectionInfo](/api/Telerik.ReportViewer.Common.RestServiceConnectionInfo)
