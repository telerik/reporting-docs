---
title: Using Custom Bindings
page_title: Using Custom Bindings for ReportServiceClient Explained
description: "Learn how to use Custom Bindings for ReportServiceClient in Telerik Reporting Silverlight Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/using-custom-bindings
tags: using,custom,bindings
published: True
position: 4
previous_url: /silverlight-report-viewer-using-custom-bindings
---

# Using Custom Bindings for ReportServiceClient

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

You might encounter a need to use custom Bindings for the __ReportServiceClient__ in certain scenarios. To do that create your own __ReportServiceClient__ object instance and initialize it according to your needs.

You need to implement the __IReportServiceClientFactory__ interface and its only method should create and return a new instance of the __ReportServiceClient__ class using any of its constructors. This way you attach your custom Binding to be used for connecting to the Report Service.

Once you have implemented __IReportServiceClientFactory__, you should provide an instance to the report viewer so it will use it the next time it creates a new instance of the __ReportServiceClient__ - that is when the report or report service Uri have changed or the __RefreshReportCommand__ is executed through the __ReportViewerModel__.

The ReportViewer usually passes absolute [Uri](https://learn.microsoft.com/en-us/previous-versions/windows/silverlight/dotnet-windows-silverlight/txt7706a(v=vs.95)) to the _IReportServiceClientFactory.Create()_ method. For more information on how the ReportServiceUri is resolved to absolute please review __Telerik.ReportViewer.Silverlight.ReportViewer.EnsureAbsoluteUri__.

The example below illustrates how to implement and use a custom __IReportServiceClientFactory__:

````C#
using System;
using System.ServiceModel;
using System.Windows.Controls;
using Telerik.Reporting.Service.SilverlightClient;
using Telerik.ReportViewer.Silverlight;

public partial class MainPage : UserControl, IReportServiceClientFactory
{
	public MainPage()
	{
		InitializeComponent();

		this.ReportViewer1.ReportServiceClientFactory = this;
	}

	ReportServiceClient IReportServiceClientFactory.Create(System.Uri remoteAddress)
	{
		var binding = new BasicHttpBinding() // or BasicHttpBinding(BasicHttpSecurityMode.Transport) overload if SSL is used
		{
			MaxBufferSize = int.MaxValue,
			MaxReceivedMessageSize = int.MaxValue,
			ReceiveTimeout = new TimeSpan(0, 15, 0),
			SendTimeout = new TimeSpan(0, 15, 0)
		};

		var endpointAddress = new EndpointAddress(remoteAddress);

		return new ReportServiceClient(binding, endpointAddress);

	}
}
````
````VB.NET
Imports System
Imports System.ServiceModel
Imports System.Windows.Controls
Imports Telerik.Reporting.Service.SilverlightClient
Imports Telerik.ReportViewer.Silverlight

Partial Public Class MainPage
	Inherits UserControl
	Implements IReportServiceClientFactory

	Public Sub New()
		InitializeComponent()

		Me.ReportViewer1.ReportServiceClientFactory = Me

	End Sub
	
	Function Create(ByVal remoteAddress As Uri) As ReportServiceClient Implements IReportServiceClientFactory.Create

		Dim binding = New BasicHttpBinding()
		binding.MaxBufferSize = Integer.MaxValue
		binding.MaxReceivedMessageSize = Integer.MaxValue
		binding.ReceiveTimeout = New TimeSpan(0, 15, 0)
		binding.SendTimeout = New TimeSpan(0, 15, 0)

		Dim endpointAddress As New EndpointAddress(remoteAddress)

		Return New ReportServiceClient(binding, endpointAddress)

	End Function
End Class
````

