---
title: Setting ReportSource to ReportViewers
page_title: Setting ReportSource for Report Viewers in Telerik Reporting
description: "Learn how to configure a ReportSource for all Telerik Reporting Report Viewer types — local, REST Service-connected, and Report Server-connected."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers
tags: how, set, reportsource, reportviewer
published: True
position: 1
previous_url: /report-sources-viewers
reportingArea: General
---

# Setting ReportSource to Report Viewers Overview

To display a report in a Report Viewer, specify the [Report Source](slug:telerikreporting/designing-reports/report-sources/overview) object. This article explains how to configure a Report Source for each of the following Report Viewer types:

* [Report Viewer controls that work with the Telerik Reporting Engine](#set-up-report-viewer-controls-that-work-with-telerik-reporting-engine) - for example, WinForms, WPF, and the WinUI Report Viewer controls;
* [Report Viewers that operate via the Telerik Reporting Services](#set-up-report-viewers-that-operate-via-telerik-reporting-services) - for example, HTML5, HTML5 ASP.NET MVC, HTML5 ASP.NET WebForms, WinForms, WPF, and the WinUI Report Viewers;
* [Report Viewer controls that are integrated with Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server) - for example, HTML5, HTML5 ASP.NET MVC, HTML5 ASP.NET WebForms Report Viewers, WinForms, WPF, and the WinUI Report Viewer controls.

Report Viewers load reports that have been processed and rendered server-side. To request processing and rendering, wrap the report in a Report Source object. The rendering format and Report Source settings vary depending on the viewer type. The sections below explain both Report Source types and how to configure each viewer.

The Telerik Reporting Engine accepts only **[Server-Side ReportSources](slug:telerikreporting/designing-reports/report-sources/overview#available-report-sources)**. A server-side ReportSource contains either an instance of the report definition ([InstanceReportSource](/api/Telerik.Reporting.InstanceReportSource)) or information about where to find and how to instantiate it ([TypeReportSource](/api/Telerik.Reporting.TypeReportSource), [UriReportSource](/api/Telerik.Reporting.UriReportSource), [XmlReportSource](/api/Telerik.Reporting.XmlReportSource)). For example, `TypeReportSource` references a C# or VB.NET class that is instantiated via reflection from its assembly-qualified name set in the [TypeName](/api/Telerik.Reporting.TypeReportSource#Telerik_Reporting_TypeReportSource_TypeName) property.

A **client-side reportSource** contains only a string identifying the report definition. For example, the [reportSource of the HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods#reportsource) exposes the `report` property as a report definition identifier. This string cannot be passed directly to the Reporting Engine because the engine does not know how to create a report instance from it. The identifier is resolved to a server-side ReportSource in the `Resolve` method of the [ReportSource Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview) configured in the [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview) that web-based viewers require.

The Report Parameter values in both server-side and client-side Report Source are a Dictionary with a _string_ key and _object_ value.

## Set up Report Viewer controls that work with Telerik Reporting Engine

These are viewers that operate on the same machine where reports are processed and rendered. These viewers include mechanisms for resolving reports:

* **[WinForms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview)** — processes and renders reports on the local machine, unless configured to connect to a remote Reporting REST Service or [Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server).
* **[WPF Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview)** — processes and renders reports on the local machine, unless configured to connect to a remote Reporting REST Service or [Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server).
* **[WinUI Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview)** — processes and renders reports on the local machine, unless configured to connect to a remote Reporting REST Service or [Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server).

Each of these viewer controls has a ReportSource property of type **Telerik.Reporting.ReportSource**, which can be set to an instance of one of the available [Report Sources](slug:telerikreporting/designing-reports/report-sources/overview).

The specified report is processed locally on the same machine where the Report Viewer control is running.

- **Set the Report Source through the Visual Studio Designer**

	1. In VS Design view, right-click a report viewer to which you want to set a report source and select **Properties**.
	1. In its **Properties**, find and click **ReportSource**.
	1. A **"Load a Report from"** dialog appears which allows you to select a **ReportSource**.
	1. Select the type of ReportSource to use and specify a report. To use a **UriReportSource**, click the **URL or file** option and select the report to display. To pass parameters to the report, continue with the next step.
	1. Click **Edit Parameters** button - **Edit Parameters** dialog appears. Click **New**. In the **Parameter Name** column, select the name of a report parameter in the report. In the **Parameter Value**, type or select the value to pass to the parameter in the report.

- **Set the Report Source programmatically**

**C# and VB.NET example for setting a local ReportSource programmatically**

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateUriReportSourceSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateUriReportSourceSnippet}}

## Set up Report Viewers that operate via Telerik Reporting Services

The following Report Viewers are designed to work as clients of [Telerik Reporting Services](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview):

- **HTML5 Report Viewer** (go to section [HTML5 Viewer](#html5-report-viewer))
- **Angular Report Viewer** (go to section [Angular Viewer](#angular-report-viewer))
- **React Report Viewer** (go to section [React Viewer](#react-report-viewer))
- **Blazor Report Viewer** (go to section [Blazor Viewer](#blazor-report-viewer))
- **Native Blazor Report Viewer** (go to section [Native Blazor Viewer](#native-blazor-report-viewer))
- **HTML5 ASP.NET MVC Report Viewer** (go to section [MVC Viewer](#html5-aspnet-mvc-report-viewer))
- **HTML5 ASP.NET WebForms Report Viewer** (go to section [WebForms Viewer](#html5-aspnet-webforms-report-viewer))
- **WinForms Report Viewer** (go to section [WinForms Viewer](#winforms-report-viewer))
- **WPF Report Viewer** (go to section [WPF Viewer](#wpf-report-viewer))
- **WinUI Report Viewer** (go to section [WinUI Viewer](#winui-report-viewer))

These Report Viewers do not have direct access to the Telerik Reporting Engine. Reports are processed and rendered on a remote machine, and the content is delivered to the client by the corresponding **Telerik Reporting Service**.

**How this works:**

1. The Report Viewer sends a **client-side ReportSource** to the Reporting Service: a *report description string* and *client parameters*. The *report description string* must comply with technology limits on message size and character encoding. The *client parameters* must match report parameter names exactly (case-sensitive).
1. The Reporting Service passes the *report description string* to its **Report Source Resolver**, which creates a valid [server-side Report Source](slug:telerikreporting/designing-reports/report-sources/overview).

	>note The default resolvers produce `TypeReportSource` or `UriReportSource`. Each Telerik Reporting Service supports a custom resolver to return any available Report Source type. Report assembly or TRDX or TRDP files must be accessible on the server where the Reporting Service is running.

1. The Reporting Service applies the *client parameters* to the **server-side Report Source's Parameters** collection in memory.
1. The Reporting Engine processes the document on the server. The Reporting Service then returns the following:

	- Information about Visible parameters - the Report Viewer displays its Parameters Area and corresponding parameter editors;
	- The processed and rendered report - the rendering format depends on the viewer, e.g., XAML for WPF Report Viewers and HTML for the HTML5 Viewer, or on the operation - export/print;
	- Information about Document Map - the Report Viewer displays its DocumentMap Area.

**Setting the Client-Side ReportSource:**

### HTML5 Report Viewer

The [HTML5 Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview) is a client-side widget that has a **client-side reportSource**. The **reportSource.report** part is a string - the _report description string_ that can be a path to a TRDP or TRDX file, an assembly qualified name of a report class, or other custom information set via string. For example:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5Viewer.html region=Html5ViewerUriReportSource}}

or

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5Viewer.html region=Html5ViewerTypeReportSource}}

The *report description string* is sent to the [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview), which resolves it to a `TypeReportSource` or `UriReportSource` on the machine where the service is running.

To display a different report or update the current *client parameters*, call the [reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods#reportsource) method on the viewer object in JavaScript, or recreate the viewer.

>important The HTML5 Report Viewer supports only `UriReportSource` and `TypeReportSource`. To use an `InstanceReportSource` or `XmlReportSource`, implement a custom Report Source Resolver for the Reporting REST Service. For details, see [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).

### Angular Report Viewer

The [Angular Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview) is an Angular wrapper of the **HTML5 Viewer**. It works in the same way as the pure HTML5 Report Viewer and requires jQuery. It exposes an identical **client-side reportSource**. For example:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5AngularViewer.html region=AngularHtml5ViewerUriReportSource}}


or

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5AngularViewer.html region=AngularHtml5ViewerTypeReportSource}}

### React Report Viewer

The [React Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview) is a React wrapper of the **HTML5 Viewer**. It works in the same way as the pure HTML5 Report Viewer and requires jQuery. It exposes an identical **client-side reportSource**. For example:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ReactViewer.jsx region=ReactHtml5ViewerUriReportSource}}

or

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ReactViewer.jsx region=ReactHtml5ViewerTypeReportSource}}

### Blazor Report Viewer

The [Blazor Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview) is a Blazor wrapper of the **HTML5 Viewer**. It works in the same way as the pure HTML5 Report Viewer and requires jQuery. It exposes an identical **client-side reportSource** through the model `ReportSourceOptions`:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\BlazorViewers.razor region=BlazorHtml5ViewerReportSources}}

### Native Blazor Report Viewer

The [Native Blazor Report Viewer control](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview) is a native Blazor widget built on top of [Telerik UI for Blazor](https://docs.telerik.com/blazor-ui/introduction) components. Its ReportSource is defined through the same `ReportSourceOptions` model as the Blazor wrapper of the HTML5 Viewer:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\BlazorViewers.razor region=BlazorNativeViewerReportSources}}

### HTML5 ASP.NET MVC Report Viewer

The [HTML5 ASP.NET MVC Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview) is an MVC wrapper of the **HTML5 Viewer** that renders a string on the page.

The string contains the HTML elements and the JavaScript methods required for initializing the HTML5 Viewer JavaScript widget. The HTML5 ASP.NET MVC Viewer has a [ReportSource](/api/Telerik.ReportViewer.Mvc.IReportViewerBuilder#Telerik_ReportViewer_Mvc_IReportViewerBuilder_ReportSource) method, creating a client-side report source via server-side code (C# or VB.NET):

- `ReportSource(UriReportSource uriReportSource)` - the _report description string_ is obtained from the _UriReportSource.Uri_ property, and the _client parameters_ from the _UriReportSource.Parameters_ collection.
- `ReportSource(TypeReportSource typeReportSource)` - the _report description string_ is obtained from the _TypeReportSource.TypeName_ property, and the _client parameters_ from the _TypeReportSource.Parameters_ collection.
- `ReportSource(string report)` - The _report description string_ is obtained from the ReportSource method's string report argument. No _client parameters_ can be set.
- `ReportSource(string report, IDictionary<string, object> parameters)` - The _report description string_ is obtained from the ReportSource method's string **report** argument. The _client parameters_ can be set through the ReportSource method's IDictionary **parameters** argument.

**Example:**

{{source=CodeSnippets\MvcCS\Views\Home\InvoiceParameters.cshtml region=ParametersExample}}
{{source=CodeSnippets\MvcVB\Views\Home\InvoiceParameters.vbhtml region=ParametersExample}}

To display a different report or update the current *client parameters*, call the [reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods#reportsource) method on the viewer object in JavaScript, or recreate the ASP.NET MVC Report Viewer.

>important The HTML5 ASP.NET MVC Report Viewer supports only `UriReportSource` and `TypeReportSource`. To use an `InstanceReportSource` or `XmlReportSource`, implement a custom Report Source Resolver for the Reporting REST Service. For details, see [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).

### HTML5 ASP.NET WebForms Report Viewer

The [HTML5 ASP.NET WebForms Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview) is a server-side wrapper of the **HTML5 Viewer**, suitable for ASP.NET WebForms applications.

- The *report description string* is obtained from the [Telerik.ReportViewer.Html5.WebForms.ReportSource.Identifier](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Identifier) property, which accepts a string. The value can be a path to a TRDP or TRDX file, an assembly-qualified name of a report class, or a custom string. For example: `Identifier="./DashboardReport.trdp"` or `Identifier="Telerik.Reporting.Examples.CSharp.BarcodesReport, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"`.
- Report parameters are set through the [ReportSource.Parameters](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Parameters) property (the *client parameters*).
- The [Telerik.ReportViewer.Html5.WebForms.ReportSource.IdentifierType](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_IdentifierType) property indicates which resolver to use for resolving the report description string on the server.

**Example of setting the client-side ReportSource in code-behind:**

{{source=CodeSnippets\MvcCS\Views\WebForms\Html5WebFormsViewer.aspx.cs region=Html5WebFormsReportViewerReportSource}}
{{source=CodeSnippets\MvcVB\Views\WebForms\Html5WebFormsViewer.aspx.vb region=Html5WebFormsReportViewerReportSource}}

**Example of setting the client-side ReportSource via markup:**

1. Open the ASPX page that contains the HTML5 WebForms Report Viewer.
1. Select the HTML5 WebForms Report Viewer and navigate to its **ReportSource** property in the **Visual Studio Properties** grid.
1. A **"Load a Report from"** dialog appears. Select a **ReportSource** type.
1. Select the type of ReportSource to use and specify a report. To use a **TypeReportSource**, click the **Type name** option and select the report to display. To pass parameters to the report, continue with the next step.
1. Click the **Edit Parameters** button. In the **Edit Parameters** dialog, click **New**. In the **Parameter Name** column, select a report parameter name. In the **Parameter Value** column, type or select the value to pass.

{{source=CodeSnippets\MvcCS\Views\WebForms\Html5WebFormsViewer.aspx region=Html5WebFormsReportViewerReportSource}}

To display a different report or update the current *client parameters*, call the [reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods#reportsource) method on the viewer object in JavaScript, or recreate the HTML5 WebForms Report Viewer.

>important The HTML5 WebForms Report Viewer supports only `UriReportSource` and `TypeReportSource`. To use an `InstanceReportSource` or `XmlReportSource`, implement a custom Report Source Resolver for the Reporting REST Service. For details, see [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).

### WinForms Report Viewer

The [WinForms Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview) can be connected to a **Telerik Reporting REST Service** or **Telerik Report Server** by setting its **ReportEngineConnection property** - [How To: Construct a string to connect to Report Engine](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine). For more details check [How To: Use Windows Forms Report Viewer with Report Server (REST Service)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server). In this scenario, the viewer's ReportSource property of type **Telerik.Reporting.ReportSource** is considered as a **client-side ReportSource**. The client report source can be set in the same way as if the viewer is operating locally (go to section [Set up Report Viewer controls that work with Telerik Reporting Engine](#set-up-report-viewer-controls-that-work-with-telerik-reporting-engine)), where the **selection is limited to TypeReportSource and UriReportSource**:

- The _report description string_ is obtained from the TypeReportSource.TypeName|UriReportSource.Uri property that returns a string. The _report description string_ is sent to the [Telerik Reporting REST service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview), which internally resolves it to a **TypeReportSource** or a **UriReportSource** on the machine where the service and Telerik Reporting Engine are running.

  >important To use an `InstanceReportSource` or `XmlReportSource`, send a custom *report description string* and implement a custom Report Source Resolver for the Reporting REST Service. For details, see [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).

- Report parameters (_client parameters_) are obtained from `TypeReportSource.Parameters` or `UriReportSource.Parameters`. Pass them through the viewer's Parameters Area, when creating the WinForms Report Viewer, or by updating the viewer's `ReportSource` property.

**Example of setting the ReportSource in code-behind:**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=Winviewer_SetReportSource}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=Winviewer_SetReportSource}}

### WPF Report Viewer

The [WPF Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview) can be connected to a **Telerik Reporting REST Service** or **Telerik Report Server** by setting its **ReportEngineConnection property** - [How To: Construct a string to connect to Report Engine](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine).

- The *report description string* is obtained from `TypeReportSource.TypeName` or `UriReportSource.Uri` and sent to the [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview), which resolves it to a `TypeReportSource` or `UriReportSource` on the machine where the service is running.

  >important To use an `InstanceReportSource` or `XmlReportSource`, send a custom *report description string* and implement a custom Report Source Resolver for the Reporting REST Service. For details, see [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).

- Report parameters (_client parameters_) are obtained from `TypeReportSource.Parameters` or `UriReportSource.Parameters`. Pass them through the viewer's Parameters Area, when creating the WPF Report Viewer, or by updating the viewer's `ReportSource` property.

**Example of specifying the ReportSource declaratively**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window1.xaml}}

**Example of setting the ReportSource at runtime using the _Window.Loaded_ event handler:**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml.cs}}

{{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml.vb}}

### WinUI Report Viewer

The [WinUI Report Viewer control](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview) can be connected to a **Telerik Reporting REST Service** or **Telerik Report Server** by setting its **ReportEngineConnection property** - [How To: Construct a string to connect to Report Engine](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine).

The configuration is identical to the [WPF Report Viewer](#wpf-report-viewer) configuration.

**Example of specifying the ReportSource declaratively**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\WinUiViewer.xaml region=WinUIReportViewer_SetReportSource}}

In the code above:
	* `telerikReportViewer` represents the namespace `Telerik.ReportViewer.WinUI`
	* `telerikReportingCore` represents the namespace `Telerik.Reporting`

## Set up Report Viewer controls that are integrated with Telerik Report Server

> [Telerik Report Server](https://www.telerik.com/report-server)'s REST Service can use only its built-in Report Source Resolver, capable of handling client-side UriReportSource into a server-side UriReportSource on the server ([Report Sources](slug:telerikreporting/designing-reports/report-sources/overview)). Reports must be [serialized in TRDX files](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml) or [packaged in TRDP files](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition) which can be published on Telerik Report Server - [Working with Report Server Reports](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports). Thus the **client-side ReportSource is limited to UriReportSource**, where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard" which will request the Dashboard.trdx|trdp file that is published on Telerik Report Server under the "Samples" category.

The following Report Viewers are designed to work as clients of [Telerik Report Server](https://www.telerik.com/report-server):

For all supported viewers, configure the client report source the same way as when connecting to a Telerik Reporting REST Service, with one difference: set the *report description string* in the format `CategoryName/ReportNameWithoutFileExtension`, for example `"Samples/Dashboard"`. This requests the `Dashboard.trdx` or `Dashboard.trdp` file published on Telerik Report Server under the `Samples` category.

The following viewers support this configuration:

- HTML5 Report Viewer
- Angular Report Viewer
- React Report Viewer
- Blazor Report Viewer
- Native Blazor Report Viewer
- HTML5 ASP.NET MVC Report Viewer
- HTML5 ASP.NET WebForms Report Viewer
- WinForms Report Viewer
- WPF Report Viewer
- WinUI Report Viewer

These Report Viewers do not have direct access to the Telerik Reporting Engine. Reports are processed and rendered on a remote machine where Telerik Report Server is running, and the content is delivered to the client by **Telerik Report Server's REST Service**.

## See Also

- [Report Sources Overview](slug:telerikreporting/designing-reports/report-sources/overview)
- [Reporting REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview)
- [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview)
