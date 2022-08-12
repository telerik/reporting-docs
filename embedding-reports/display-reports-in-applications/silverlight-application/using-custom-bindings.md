---
title: Using Custom Bindings
page_title: Using Custom Bindings 
description: Using Custom Bindings
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/using-custom-bindings
tags: using,custom,bindings
published: True
position: 4
previous_url: /silverlight-report-viewer-using-custom-bindings
---

# Using Custom Bindings

You might encounter a need to use custom Bindings for the __ReportServiceClient__ in certain scenarios. To do that create your own __ReportServiceClient__ object instance and initialize it according to your needs. 

You need to implement the __IReportServiceClientFactory__ interface and its only method should create and return a new instance of the __ReportServiceClient__ class using any of its constructors. This way you attach your custom Binding to be used for connecting to the Report Service.

Once you have implemented __IReportServiceClientFactory__, you should provide an instance to the report viewer so it will use it the next time it creates a new instance of the __ReportServiceClient__ - that is when the report or report service Uri have changed or the __RefreshReportCommand__ is executed through the __ReportViewerModel__. 

The ReportViewer usually passes absolute [Uri](http://msdn.microsoft.com/en-us/library/system.uri%28VS.95%29.aspx) to the _IReportServiceClientFactory.Create()_ method. For more information on how the ReportServiceUri is resolved to absolute please review [Telerik.ReportViewer.Silverlight.ReportViewer.EnsureAbsoluteUri](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_EnsureAbsoluteUri_System_Uri_) 

The example below illustrates how to implement and use a custom __IReportServiceClientFactory__ :

{{source=CodeSnippets\SilverlightCS\API\Telerik\ReportViewer\Silverlight\CustomBindingsSnippets.cs region=UsingCustomBindings}}
{{source=CodeSnippets\SilverlightVB\API\Telerik\ReportViewer\Silverlight\CustomBindingsSnippets.vb region=UsingCustomBindings}}

