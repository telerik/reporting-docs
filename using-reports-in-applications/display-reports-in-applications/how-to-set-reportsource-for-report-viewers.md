---
title: How to Set ReportSource for Report Viewers
page_title: How to Set ReportSource for Report Viewers | for Telerik Reporting Documentation
description: How to Set ReportSource for Report Viewers
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers
tags: how,to,set,reportsource,for,report,viewers
published: True
position: 7
---

# How to Set ReportSource for Report Viewers



To display a report in a Report Viewer, you must specify the [Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.         This document explains how to specify a Report Source for each of the following Report Viewer types:       

* [ReportViewer controls that work with the Telerik Reporting Engine](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-reportviewer-controls-that-work-with-telerik-reporting-engine-)             - for example, WinForms, WPF, and the obsolete ASP.NET WebForms ReportViewer controls;           

* [Report Viewers that operate via the Telerik Reporting Services](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-report-viewers-that-operate-via-telerik-reporting-services)             - for example, Silverlight, HTML5, HTML5 ASP.NET MVC, HTML5 ASP.NET WebForms, WinForms, and WPF Report Viewers;           

* [ReportViewer controls that are integrated with Telerik Report Server](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-reportviewer-controls-that-are-integrated-with-telerik-report-server) -             for example, HTML5, HTML5 ASP.NET MVC, HTML5 ASP.NET WebForms Report Viewers, WinForms and WPF ReportViewer controls.           

We use Report Viewers to load reports that are already processed and rendered server-side.           To request a report to be processed and rendered, you must wrap it in a Report Source object.          The report's rendering format and the settings of the Report Source vary depending on the type of the Report Viewer. We describe how to set up each of the three          Report Viewer types below.       

## Set up ReportViewer controls that work with Telerik Reporting Engine

These are viewers that operate on the same machine where reports are processed rendered. These viewers include mechanisms for resolving reports:

* __[WindowsForms ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})__ : reports are processed and rendered on the local machine,               unless the viewer uses integration with the Reporting REST service or Telerik Report Server               ([ReportViewer controls integrated with Telerik Report Server](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-reportviewer-controls-that-are-integrated-with-telerik-report-server));             

* __[WPF ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})__ : reports are processed and rendered on the local machine,               unless the viewer uses integration with the Reporting REST service or Telerik Report Server               ([ReportViewer controls integrated with Telerik Report Server](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-reportviewer-controls-that-are-integrated-with-telerik-report-server));             

* __[ASP.NET WebForms ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})__ :               reports are processed and rendered on the server machine where the ReportViewer is hosted.             

Each of these viewer controls has a ReportSource property of type __Telerik.Reporting.ReportSource__ ,           which can be set to an instance of one of the available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).         

The specified report is processed locally on the same machine where the ReportViewer control is running.         

* __Set the Report Source through the Visual Studio Designer__ 

   1. In VS Design view, right-click a report viewer to which you want to set a report source and select __Properties__ .                 

   1. In its __Properties__ , find and click __ReportSource__ .                 

   1. A __"Load a Report from"__  dialog appears which allows you to select a __ReportSource__ .                 

   1. Select the type of the report source you would use and specify a report. For this example, we would use a __UriReportSource__ ,                   click 'URL or file' option and select the report that would be shown in the viewer.                 If you have to specify parameters for the report, continue with the next step.

   1. Click __Edit Parameters__  button - __Edit Parameters__  dialog appears. Click __New__ .                   In the __Parameter Name__  column select the name of a report parameter in the report.                   In the __Parameter Value__ , type or select the value to pass to the parameter in the report.                 

* __Set the Report Source programmatically__ 

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateUriReportSourceSnippet}}
  ````C#
	            var uriReportSource = new Telerik.Reporting.UriReportSource();
	
	            // Specifying an URL or a file path
	            uriReportSource.Uri = "SampleReport.trdp";
	
	            // Adding the initial parameter values
	            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
````



{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateUriReportSourceSnippet}}
  ````VB
	        Dim uriReportSource As New Telerik.Reporting.UriReportSource()
	
	        ' Specifying an URL or a file path
	        uriReportSource.Uri = "SampleReport.trdp"
	
	        ' Adding the initial parameter values
	        uriReportSource.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
````



## Set up Report Viewers that operate via Telerik Reporting Services

The following Report Viewers are designed to work as clients of [Telerik Reporting Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/overview%}):         

* __Silverlight ReportViewer__  (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#SilverlightClientReportSource))             

* __HTML5 Report Viewer__  (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#HTML5ViewerClientReportSource))             

* __HTML5 ASP.NET MVC ReportViewer__  (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#HTML5MVCViewerClientReportSource))             

* __HTML5 ASP.NET WebForms ReportViewer__  (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#HTML5WebFormsViewerClientReportSource))             

* __WinForms ReportViewer__  (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#WinFormsClientReportSource))             

* __WPF ReportViewer__  (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#WPFClientReportSource))             

These Report Viewers do not have direct access to Telerik Reporting Engine. Reports are processed and rendered on a remote machine,           and the content is delivered to the client by the corresponding __Telerik Reporting Service__ .         

__How this works:__ 

1. The Report Viewer has a __client-side ReportSource__  that describes the report we want to display               (*report description string*  and *client parameters* ).             The *report description string* 's content must consider technology limitations               in the size of sent messages and in the used characters. The *client parameters*  must match by names (case sensitive) the report parameters;             

1. The Report Viewer (as a client) sends the *report description string*  to the server, where the content is handled by the corresponding               __Telerik Reporting Service's Report Source Resolver__ . The purpose of the resolver is to create a valid               [server-side Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}).             

   >note The default resolvers used by  __Telerik Reporting Services__  can produce TypeReportSource and UriReportSource on the server                 ([Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})). Each Telerik Reporting Service provides mechanism for plugging a                 custom report source resolver allowing you to create and return any of the available Report Sources (see the links at the bottom of the article).                 The reports' assembly or TRDX|TRDP files must be accessible on the server where the Reporting Service and Telerik Reporting Engine are running.               

1. The Report Viewer (as a client) sends the *client parameters*  to the server. The Reporting Service applies the values               to the __server-side Report Source's Parameters collection__  that is generated in memory.             

1. After the Reporting Service resolves the *report description string*  and *client parameters* ,               the Reporting Engine processes the document on the server. Finally, the Reporting Service returns the following:             

   + Information about Visible parameters - the Report Viewer displays its Parameters Area and corresponding parameters editors;

   + The processed and rendered report - the rendering format depends on the viewer e.g. XAML for WPF and Silverlight ReportViewers and HTML for the HTML5 Viewer, or on the operation - export/print;

   + Information about Document Map - the Report Viewer displays its DocumentMap Area.

__Setting the Client-Side ReportSource:__ 

* __[Silverlight ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%})__ The Silverlight ReportViewer control has a __[Telerik.ReportViewer.Silverlight.ReportViewer.Report](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_Report) property__  that accepts a string. This is the *report description string* .             The string can be a path to a TRDP or TRDX file or an assembly qualified name of a report class. For example:(__Report="./DashboardReport.trdp")__                or (__Report="Telerik.Reporting.Examples.CSharp.BarcodesReport, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null__ ").               The string is sent to the [Telerik Reporting WCF service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}) which internally resolves it to a               __TypeReportSource__  or a __UriReportSource__                on the machine where the service and Telerik Reporting Engine are running.             Report parameters' values sent by the Silverlight ReportViewer are *client parameters* . Report parameters' values can be sent through the viewer's Parameters Area,               in code by overriding the Silverlight ReportViewer control's  [OnApplyParameters](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_OnApplyParameters)                method or by subscribing to the __ApplyParameters__  event.             

   >note  __The Silverlight ReportViewer control works only with__ .                 If you need to modify a report or execute custom logic on displaying a report resulting in the usage of an InstanceReportSource or XmlReportSource,                 you will have to resolve manually the  *report description string*  via custom resolver for                 the Reporting WCF service. For more details, check [                   How to: Implement and use custom IReportResolver                 ]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-implement-and-use-custom-ireportresolver%}).               

* __[HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})__ The HTML5 Viewer is a client-side widget that has a __client-side reportSource__ .               The __reportSource.report__  part is a string - the *report description string*                that can be a path to a TRDP or TRDX file, an assembly qualified name               of a report class, or other custom information set via string. For example:             

	
      ````html
reportSource: { 
			report: "Dashboard.trdp",
			parameters: { CultureID: "en" }
              }
````

or

	
      ````html
reportSource: { 
			report: "Telerik.Reporting.Examples.CSharp.ProductCatalog, CSharp.ReportLibrary",
			parameters: { CultureID: "en" }
              }
````

The *report description string*  is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%})               which internally resolves it to a __TypeReportSource__  or a __UriReportSource__                on the machine where the service and Telerik Reporting Engine are running.             The __reportSource.parameters__  part is a collection of key-value pairs - the *client parameters* .               Report parameters' values can be sent through the viewer's Parameters Area or on creating the HTML5 Viewer object in JavaScript.             To display another report or to update the *client parameters* ' values of the current HTML5 Viewer object,               you can update the HTML5 Viewer's reportSource by using the viewer object's [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%})               method in JavaScript.               Or you can recreate the HTML5 Report Viewer.             

   >note  __The HTML5 Report Viewer works only with__   ([How To: Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})).                 If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the  *report description string*  via                 custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})                 (available only if using a Telerik Reporting REST service instance).               

* __[HTML5 ASP.NET MVC ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%})__ The HTML5 ASP.NET MVC Viewer is an MVC wrapper of the __HTML5 Viewer__  that renders a string on the page.               The string contains the HTML elements and the JavaScript methods required for initializing the HTML5 Viewer JavaScript widget.             The HTML5 ASP.NET MVC Viewer has a  [ReportSource](/reporting/api/Telerik.ReportViewer.Mvc.IReportViewerBuilder#Telerik_ReportViewer_Mvc_IReportViewerBuilder_ReportSource)                method, creating a client-side report source via server-side code (C# or VB.NET):             

   + __ReportSource(UriReportSource uriReportSource)__  -                   the *report description string*  is obtained from the *UriReportSource.Uri*  property,                   and the *client parameters*  from the *UriReportSource.Parameters*  collection.                 

   + __ReportSource(TypeReportSource typeReportSource)__  -                   the *report description string*  is obtained from the *TypeReportSource.TypeName*  property,                   and the *client parameters*  from the *TypeReportSource.Parameters*  collection.                 

   + __ReportSource(string report)__  - The *report description string*  is obtained from the ReportSource                   method's string report argument. No *client parameters*  can be set.                 

   + __ReportSource(string report, IDictionary```<string, object>``` parameters)__                    - The *report description string*  is obtained from the ReportSource                   method's string __report__  argument. The  *client parameters*  can be set through the ReportSource                   method's IDictionary __parameters__  argument.                 __Example:__ 

{{source=CodeSnippets\MvcCS\Views\Home\InvoiceParameters.cshtml region=ParametersExample}}
  ````c#
	@{
	    var typeReportSource = new TypeReportSource() { TypeName = typeof(Invoice).AssemblyQualifiedName };
	    typeReportSource.Parameters.Add("OrderNumber", Model.SelectedInvoice);
	}
	
	@(
	    Html.TelerikReporting().ReportViewer()
	        .Id("reportViewer1")
	        .ServiceUrl("/api/reports/")
	        .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html")
	        .ReportSource(typeReportSource)
	        .ViewMode(ViewMode.Interactive)
	        .ScaleMode(ScaleMode.Specific)
	        .Scale(1.0)
	)
````



{{source=CodeSnippets\MvcVB\Views\Home\InvoiceParameters.vbhtml region=ParametersExample}}
  ````vb.net
	@Code
	    Dim typeReportSource = New TypeReportSource() With {.TypeName = GetType(Invoice).AssemblyQualifiedName}
	    typeReportSource.Parameters.Add("OrderNumber", Model.SelectedInvoice)
	
	    Html.TelerikReporting().ReportViewer() _
	        .Id("reportViewer1") _
	        .ServiceUrl("/api/reports/") _
	        .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html") _
	        .ReportSource(typeReportSource) _
	        .ViewMode(ViewMode.Interactive) _
	        .ScaleMode(ScaleMode.Specific) _
	        .Scale(1.0)
	End Code
````

To display another report or to update the *client parameters* ' values of the current HTML5 Viewer object,               you can update the HTML5 Viewer's reportSource by using the viewer object's [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%})               method in JavaScript.  Or you can recreate the HTML5 ASP.NET MVC ReportViewer.             

   >note  __The HTML5 ASP.NET MVC ReportViewer works only with__  ([How To: Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})).                 If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the  *report description string*  via                 custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})                 (available only if using a Telerik Reporting REST service instance).               

* __[HTML5 ASP.NET WebForms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})__ The HTML5 ASP.NET WebForms ReportViewer control is a server-side wrapper of the __HTML5 Viewer__ ,               suitable for ASP.NET WebForms applications. The control renders the HTML elements and the JavaScript methods required for initializing the HTML5 Viewer JavaScript widget.             The ReportSource property of the HTML5 ASP.NET WebForms ReportViewer control is of type               Telerik.ReportViewer.Html5.WebForms. [ReportSource](/reporting/api/Telerik.ReportViewer.Html5.WebForms.ReportSource) :             

   + The *report description string*  is obtained from the                    [Telerik.ReportViewer.Html5.WebForms.ReportSource.Identifier](/reporting/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Identifier)  property,                   which accepts a string.                   The string can be a path to a TRDP or TRDX file, an assembly qualified name of a report class or custom information provided in a string. For example:(__Identifier="./DashboardReport.trdp")__                    or (__Identifier="Telerik.Reporting.Examples.CSharp.BarcodesReport, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null__ ").                 

   + Report parameters' values are obtained from the ReportSource. [Parameters](/reporting/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Parameters)                    property - the *client parameters* .                 

   + The  [Telerik.ReportViewer.Html5.WebForms.ReportSource.IdentifierType](/reporting/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_IdentifierType)  property                   hints which resolver can be used for resolving the report description string on the server.                 __Example of setting the client-side ReportSource in code-behind:__ 

	
      ````c#
                var clientReportSource = new Telerik.ReportViewer.Html5.WebForms.ReportSource();
                clientReportSource.IdentifierType = IdentifierType.TypeReportSource;
                clientReportSource.Identifier = typeof(ReportCatalog).AssemblyQualifiedName;//or <namespace>.<class>, <assembly> e.g. "MyReports.Report1, MyReportsLibrary"
                clientReportSource.Parameters.Add("Parameter1", 123);
                reportViewer1.ReportSource = clientReportSource;
````
````vb.net
              Dim clientReportSource As New Telerik.ReportViewer.Html5.WebForms.ReportSource
              clientReportSource.IdentifierType = Telerik.ReportViewer.Html5.WebForms.IdentifierType.TypeReportSource
              clientReportSource.Identifier = GetType(ReportCatalog).AssemblyQualifiedName 'or <namespace>.<class>, <assembly> e.g. "MyReports.Report1, MyReportsLibrary"
              clientReportSource.Parameters.Add("Parameter1", 123)
              reportViewer1.ReportSource = clientReportSource
````

__Example of setting the client-side ReportSource via mark-up:__ 

   1. Open the ASPX with the HTML5 WebForms ReportViewer.

   1. Select the HTML5 WebForms ReportViewer and navigate to its Reportsource property in __Visual Studio Property grid__ .                 

   1. A __"Load a Report from"__  dialog appears which allows you to select a __ReportSource__ .                 

   1. Select the type of the report source you would use and specify a report. For this example we will use a __TypeReportSource__ ,                   click 'Type name' option and select the report that would be shown in the viewer.                 If you have to specify parameters for the report, continue with the next step.

   1. Click __Edit Parameters__  button - __Edit Parameters__  dialog appears. Click __New__ .                   In the __Parameter Name__  column select the name of a report parameter in the report.                   In the __Parameter Value__ , type or select the value to pass to the parameter in the report.                 

	
      ````html
    <form runat="server">
        <telerik:ReportViewer Width="" Height=""
            ID="reportViewer1"
            runat="server">
            <ReportSource 
                IdentifierType="TypeReportSource" 
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
                <Parameters>
                    <telerik:Parameter Name="Parameter1" Value="123" />
                </Parameters>
            </ReportSource>
        </telerik:ReportViewer>
    </form>
````

To display another report or to update the *client parameters* ' values of the current HTML5 Viewer object,               you can update the HTML5 Viewer's reportSource by using the viewer object's [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%})               method in JavaScript. Or you can recreate the HTML5 WebForms ReportViewer.             

   >note  __The HTML5 WebForms ReportViewer works only with__  ([How To: Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})).                 If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the  *report description string*  via                 custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})                 (available only if using a Telerik Reporting REST service instance).               

* __[WinForms ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})__ The WinForms ReportViewer can be connected to a __Telerik Reporting REST Service__  or __Telerik Report Server__                by setting its __ReportEngineConnection property__  -               [How To: Construct a string to connect to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}).               For more details check [How To: Use Windows Forms Report Viewer with Report Server (REST Service)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%}).             In this scenario, the viewer's ReportSource property of type __Telerik.Reporting.ReportSource__  is considered as a               __client-side ReportSource__ . The client report source can be set in the same way as if the viewer is operating locally               (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-reportviewer-controls-that-work-with-telerik-reporting-engine-)), where the               __selection is limited to TypeReportSource and UriReportSource__ :             

   + The *report description string*  is obtained from the TypeReportSource.TypeName|UriReportSource.Uri property that returns a string.                   The *report description string*  is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}),                   which internally resolves it to a __TypeReportSource__  or a __UriReportSource__                    on the machine where the service and Telerik Reporting Engine are running.                 

   >note If you need an InstanceReportSource or XmlReportSource, you will have to send custom string as  *report description string* ,                     and to resolve manually the  *report description string*  via                     custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})                     (available only if using a Telerik Reporting REST service instance).                   

   + Report parameters' values (*client parameters* ) are obtained from the TypeReportSource.Parameters|UriReportSource.Parameters collection.                   The *client parameters*  can be sent through the viewer's Parameters Area, on creating the WinForms ReportViewer, or by updating the viewer's ReportSource property.                 

* __[WPF ReportViewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})__ The WPF ReportViewer can be connected to a __Telerik Reporting REST Service__  or __Telerik Report Server__                by setting its __ReportEngineConnection property__  -               [How To: Construct a string to connect to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}).               For more details check [How To: Use WPF Report Viewer with Report Server (REST Service)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%}).             In this scenario the viewer's ReportSource property of type __Telerik.Reporting.ReportSource__  is considered as a               __client-side ReportSource__ . The client report source can be set in the same way as if the viewer is operating locally               (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#set-up-reportviewer-controls-that-work-with-telerik-reporting-engine-)), where the               __selection is limited to TypeReportSource and UriReportSource__ :             

   + The *report description string*  is obtained from the TypeReportSource.TypeName|UriReportSource.Uri property, that returns a string.                   The *report description string*  is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%})                   which internally resolves it to a __TypeReportSource__  or a __UriReportSource__                    on the machine where the service and Telerik Reporting Engine are running.                 

   >note If you need an InstanceReportSource or XmlReportSource, you will have to send a custom string as  *report description string* ,                     and to resolve manually the  *report description string*  via                     custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})                     (available only if using a Telerik Reporting REST service instance).                   

   + Report parameters' values (*client parameters* ) are obtained from the TypeReportSource.Parameters|UriReportSource.Parameters collection.                   The *client parameters*  can be sent through the viewer's Parameters Area, on creating the WPF ReportViewer, or by updating the viewer's ReportSource property.                 

## Set up ReportViewer controls that are integrated with Telerik Report Server

>important  [Telerik Report Server](http://www.telerik.com/report-server) 's REST Service can use only its built-in Report Source Resolver, capable of handling client-side UriReportSource into a server-side UriReportSource on the server             ([Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})).             Reports must be [serialized in TRDX files]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) or             [packaged in TRDP files]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) which can be published on Telerik Report Server             - [Working with Report Server Reports]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports%}).           Thus the  __client-side ReportSource is limited to UriReportSource__ ,             where the  *report description string*  must be in a format:  __[CategoryName]/[ReportNameWithoutFileExtension]__              e.g. "Samples/Dashboard" which will request the Dashboard.trdx|trdp file that is published on Telerik Report Server under the "Samples" category.           


The following Report Viewers are designed to work as clients of  [Telerik Report Server](http://www.telerik.com/report-server) :         

* __HTML5 Report Viewer__                - the client report source is set in the same way as if the viewer is connected to a __Telerik Reporting REST Service__                (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#HTML5ViewerClientReportSource))             

* __HTML5 ASP.NET MVC ReportViewer__                - the client report source is set in the same way as if the viewer is connected to a __Telerik Reporting REST Service__                (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#HTML5MVCViewerClientReportSource))             

* __HTML5 ASP.NET WebForms ReportViewer__                - the client report source is set in the same way as if the viewer is connected to a __Telerik Reporting REST Service__                (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#HTML5WebFormsViewerClientReportSource))             

* __WinForms ReportViewer__                - the client report source is set in the same way as if the viewer is connected to a __Telerik Reporting REST Service__                (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#WinFormsClientReportSource))             

* __WPF ReportViewer__                - the client report source is set in the same way as if the viewer is connected to a __Telerik Reporting REST Service__                (go to section [link](1d2ff87d-335f-4640-be56-e2737220a8c9#WPFClientReportSource))             

These Report Viewers do not have direct access to Telerik Reporting Engine. Reports are processed and rendered on a remote machine where Telerik Report Server is running,           and the content is delivered to the client by __Telerik Report Server's REST Service__ .         

# See Also


 * [How to: Implement and use custom IReportResolver (Reporting WCF Service's Report Resolver)]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-implement-and-use-custom-ireportresolver%})

 * [Reporting REST Service's Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})
