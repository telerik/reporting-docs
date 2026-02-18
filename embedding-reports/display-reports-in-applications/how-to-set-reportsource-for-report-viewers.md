---
title: Setting ReportSource to ReportViewers
page_title: Setting ReportSource to ReportViewers Explained
description: "Learn what ReportSource is and how to set ReportSource for the supported Report Viewers in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers
tags: how,set,reportsource,reportviewer
published: True
position: 1
previous_url: /report-sources-viewers
reportingArea: General
---

# Setting ReportSource to Report Viewers Overview

To display a report in a Report Viewer, you must specify the [Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}) object. This document explains how to specify a Report Source for each of the following Report Viewer types:

* [Report Viewer controls that work with the Telerik Reporting Engine](#set-up-report-viewer-controls-that-work-with-telerik-reporting-engine) - for example, WinForms, WPF, and the WinUI Report Viewer controls;
* [Report Viewers that operate via the Telerik Reporting Services](#set-up-report-viewers-that-operate-via-telerik-reporting-services) - for example, HTML5, HTML5 ASP.NET MVC, HTML5 ASP.NET WebForms, WinForms, WPF, and the WinUI Report Viewers;
* [Report Viewer controls that are integrated with Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server) - for example, HTML5, HTML5 ASP.NET MVC, HTML5 ASP.NET WebForms Report Viewers, WinForms, WPF, and the WinUI Report Viewer controls.

We use Report Viewers to load reports that are already processed and rendered server-side. To request a report to be processed and rendered, you must wrap it in a Report Source object. The report's rendering format and the settings of the Report Source vary depending on the type of Report Viewer. Before describing how to set up each of the three Report Viewer types, let's explain the difference between the two main Report Source types.

Before describing how to set up each of the three Report Viewer types, let's explain the defference between the two main Report Source types.

The Telerik Reporting Engine accepts only __[Server-Side ReportSources]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources)__. The Server-Side ReportSource contains an instance of the report definition ([InstanceReportSource](/api/Telerik.Reporting.InstanceReportSource)), or information on where to find the report definition and how to instantiate it ([TypeReportSource](/api/Telerik.Reporting.TypeReportSource), [UriReportSource](/api/Telerik.Reporting.UriReportSource), [XmlReportSource](/api/Telerik.Reporting.XmlReportSource)). For example, the __TypeReportSource__ references a CLR (CSharp or VB.NET) class that would be instantiated with reflection from its assembly-qualified name provided through the property [TypeName](/api/Telerik.Reporting.TypeReportSource#Telerik_Reporting_TypeReportSource_TypeName).

The Telerik Reporting Engine accepts only **[Server-Side ReportSources]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources)**. The Server-Side ReportSource contains an instance of the report definition ([InstanceReportSource](/api/Telerik.Reporting.InstanceReportSource)), or an information on where to find the report definition and how to instantiate it ([TypeReportSource](/api/Telerik.Reporting.TypeReportSource), [UriReportSource](/api/Telerik.Reporting.UriReportSource), [XmlReportSource](/api/Telerik.Reporting.XmlReportSource)). For example, the **TypeReportSource** references a CLR (CSharp or VB.NET) class that would be instantiated with reflection from its assembly qualified name provided through the property [TypeName](/api/Telerik.Reporting.TypeReportSource#Telerik_Reporting_TypeReportSource_TypeName).

The **_Client-Side reportSource_** contains only a string identifying the report definition. For example, the [reportSource of the Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) exposes the `report` property as a report definition identifier. It cannot be passed directly to the Reporting engine as the latter doesn't know how to create a report instance from this string. The identifier gets resolved to a server-side ReportSource in the `Resolve` method of the [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) of the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) that the viewer utilizing client-side reportSources requires.

The Report Parameter values in both server-side and client-side Report Source are a Dictionary with a _string_ key and _object_ value.

## Set up Report Viewer controls that work with Telerik Reporting Engine

These are viewers that operate on the same machine where reports are processed and rendered. These viewers include mechanisms for resolving reports:

* __[WindowsForms Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})__ : reports are processed and rendered on the local machine, unless the viewer uses integration with remote Reporting REST service or Telerik Report Server ([Report Viewer controls integrated with Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server));
* __[WPF Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})__ : reports are processed and rendered on the local machine, unless the viewer uses integration with remote Reporting REST service or Telerik Report Server ([Report Viewer controls integrated with Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server));
* __[WinUI Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%})__ : reports are processed and rendered on the local machine, unless the viewer uses integration with remote Reporting REST service or Telerik Report Server ([Report Viewer controls integrated with Telerik Report Server](#set-up-report-viewer-controls-that-are-integrated-with-telerik-report-server));

Each of these viewer controls has a ReportSource property of type **Telerik.Reporting.ReportSource**, which can be set to an instance of one of the available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).

The specified report is processed locally on the same machine where the Report Viewer control is running.

- **Set the Report Source through the Visual Studio Designer**

  1.  In VS Design view, right-click a report viewer to which you want to set a report source and select **Properties**.
  1.  In its **Properties**, find and click **ReportSource**.
  1.  A **"Load a Report from"** dialog appears which allows you to select a **ReportSource**.
  1.  Select the type of the report source you would use and specify a report. For this example, we would use a **UriReportSource**, click 'URL or file' option and select the report that would be shown in the viewer. If you have to specify parameters for the report, continue with the next step.
  1.  Click **Edit Parameters** button - **Edit Parameters** dialog appears. Click **New**. In the **Parameter Name** column select the name of a report parameter in the report. In the **Parameter Value**, type or select the value to pass to the parameter in the report.

- **Set the Report Source programmatically**

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateUriReportSourceSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateUriReportSourceSnippet}}

## Set up Report Viewers that operate via Telerik Reporting Services

The following Report Viewers are designed to work as clients of [Telerik Reporting Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}):

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

These Report Viewers do not have direct access to the Telerik Reporting Engine. Reports are processed and rendered on a remote machine, and the content is delivered to the client by the corresponding __Telerik Reporting Service__.

**How this works:**

1. The Report Viewer has a __client-side ReportSource__ that describes the report we want to display (*report description string* and *client parameters*). The *report description string* 's content must consider technology limitations in the size of sent messages and in the allowed character encoding. The *client parameters* must match by name (case sensitive) the report parameters;
1. The Report Viewer (as a client) sends the *report description string* to the server, where the content is handled by the corresponding __Telerik Reporting Service's Report Source Resolver__. The purpose of the resolver is to create a valid [server-side Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}).

	>The default resolvers used by  __Telerik Reporting Services__ can produce TypeReportSource and UriReportSource on the server ([Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})). Each Telerik Reporting Service provides a mechanism for plugging a custom report source resolver, allowing you to create and return any of the available Report Sources (see the links at the bottom of the article). The reports' assembly or TRDX|TRDP files must be accessible on the server where the Reporting Service and Telerik Reporting Engine are running.

1. The Report Viewer (as a client) sends the _client parameters_ to the server. The Reporting Service applies the values to the **server-side Report Source's Parameters collection** that is generated in memory.
1. After the Reporting Service resolves the _report description string_ and _client parameters_, the Reporting Engine processes the document on the server. Finally, the Reporting Service returns the following:

   - Information about Visible parameters - the Report Viewer displays its Parameters Area and corresponding parameters editors;
   - The processed and rendered report - the rendering format depends on the viewer e.g. XAML for WPF Report Viewers and HTML for the HTML5 Viewer, or on the operation - export/print;
   - Information about Document Map - the Report Viewer displays its DocumentMap Area.

**Setting the Client-Side ReportSource:**

### **HTML5 Report Viewer**

The [HTML5 Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) is a client-side widget that has a **client-side reportSource**. The **reportSource.report** part is a string - the _report description string_ that can be a path to a TRDP or TRDX file, an assembly qualified name of a report class, or other custom information set via string. For example:

```JSON
reportSource: {
	report: "Product Catalog.trdp",
	parameters: { CultureID: "en" }
}
```

or

```JSON
reportSource: {
	report: "Telerik.Reporting.Examples.CSharp.ProductCatalog, CSharp.ReportLibrary",
	parameters: { CultureID: "en" }
}
```

The _report description string_ is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) which internally resolves it to a **TypeReportSource** or a **UriReportSource** on the machine where the service and Telerik Reporting Engine are running.

> __The HTML5 Report Viewer works only with__ ([UriReportSource and TypeReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources)). If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the *report description string* via a custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

To display another report or to update the _client parameters_ ' values of the current HTML5 Viewer object, you can update the HTML5 Viewer's reportSource by using the viewer object's [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method in JavaScript. Or you can recreate the HTML5 Report Viewer.

> **The HTML5 Report Viewer works only with** ([UriReportSource and TypeReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources)). If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the _report description string_ via custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

### **Angular Report Viewer**

The [Angular Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}) is an Angular wrapper of the **HTML5 Viewer**. It works in the same way as the pure HTML5 Report Viewer and requires jQuery. It exposes identical **client-side reportSource**. For example:

```HTML
<tr-viewer #viewer1
	...
	[reportSource]="{
		report: 'Product Catalog.trdp',
		parameters: { CultureID: 'en' }
	}"
	...>
</tr-viewer>
```

or

```HTML
<tr-viewer #viewer1
	...
	[reportSource]="{
		report: 'Telerik.Reporting.Examples.CSharp.ProductCatalog, CSharp.ReportLibrary',
		parameters: { CultureID: 'en' }
	}"
	...>
</tr-viewer>
```

### **React Report Viewer**

The [React Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) is a React wrapper of the **HTML5 Viewer**. It works in the same way as the pure HTML5 Report Viewer and requires jQuery. It exposes identical **client-side reportSource**. For example:

```JSX
export function ReportViewer() {

    const reportSource = {
			report: 'Dashboard.trdx'
		};

    return (
            <TelerikReportViewer
                serviceUrl="https://demos.telerik.com/reporting/api/reports/"
                reportSource={reportSource} />
    )
}
```

or

```JSX
export function ReportViewer() {

    const reportSource = {
			report: 'Telerik.Reporting.Examples.CSharp.ProductCatalog, CSharp.ReportLibrary'
		};

    return (
            <TelerikReportViewer
                serviceUrl="https://demos.telerik.com/reporting/api/reports/"
                reportSource={reportSource} />
    )
}
```

### **Blazor Report Viewer**

The [Blazor Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) is a Blazor wrapper of the **HTML5 Viewer**. It works in the same way as the pure HTML5 Report Viewer and requires jQuery. It exposes identical **client-side reportSource** through the model `ReportSourceOptions`:

```RAZOR
<ReportViewer ViewerId="rv1"
			...
			ReportSource="@(new ReportSourceOptions
					{
						Report = "Product Line Sales.trdp",
						//or "Telerik.Reporting.Examples.CSharp.ProductLineSales, CSharp.ReportLibrary",
						Parameters = new Dictionary<string, object>
						{
							{ "ProductCategory", "Clothing" },
							{ "ProductSubcategory", new [] { "Caps", "Gloves" } }
						}
					})"
			/>
```

### **Native Blazor Report Viewer**

The [Native Blazor Report Viewer control]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) is a native Blazor widget built on top of [Telerik UI for Blazor](https://docs.telerik.com/blazor-ui/introduction) components. Its ReportSource is defined through the same `ReportSourceOptions` model as the Blazor wrapper of the HTML5 Viewer:

```RAZOR
<ReportViewer
	...
	@bind-ReportSource="@ReportSource"
	...>
</ReportViewer>

@code {
	...
	public ReportSourceOptions ReportSource { get; set; } =
			new ReportSourceOptions(
				"Product Line Sales.trdp",
				//or "Telerik.Reporting.Examples.CSharp.ProductLineSales, CSharp.ReportLibrary",
				new Dictionary<string, object>
					{
						{ "ProductCategory", "Clothing" },
						{ "ProductSubcategory", new [] { "Caps", "Gloves" } }
					});
}
```

### **HTML5 ASP.NET MVC Report Viewer**

The [HTML5 ASP.NET MVC Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%}) is an MVC wrapper of the **HTML5 Viewer** that renders a string on the page.

The string contains the HTML elements and the JavaScript methods required for initializing the HTML5 Viewer JavaScript widget. The HTML5 ASP.NET MVC Viewer has a [ReportSource](/api/Telerik.ReportViewer.Mvc.IReportViewerBuilder#Telerik_ReportViewer_Mvc_IReportViewerBuilder_ReportSource) method, creating a client-side report source via server-side code (C# or VB.NET):

- `ReportSource(UriReportSource uriReportSource)` - the _report description string_ is obtained from the _UriReportSource.Uri_ property, and the _client parameters_ from the _UriReportSource.Parameters_ collection.
- `ReportSource(TypeReportSource typeReportSource)` - the _report description string_ is obtained from the _TypeReportSource.TypeName_ property, and the _client parameters_ from the _TypeReportSource.Parameters_ collection.
- `ReportSource(string report)` - The _report description string_ is obtained from the ReportSource method's string report argument. No _client parameters_ can be set.
- `ReportSource(string report, IDictionary<string, object> parameters)` - The _report description string_ is obtained from the ReportSource method's string **report** argument. The _client parameters_ can be set through the ReportSource method's IDictionary **parameters** argument.

**Example:**

{{source=CodeSnippets\MvcCS\Views\Home\InvoiceParameters.cshtml region=ParametersExample}}
{{source=CodeSnippets\MvcVB\Views\Home\InvoiceParameters.vbhtml region=ParametersExample}}

To display another report or to update the _client parameters_ ' values of the current HTML5 Viewer object, you can update the HTML5 Viewer's reportSource by using the viewer object's [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method in JavaScript. Or you can recreate the HTML5 ASP.NET MVC Report Viewer.

> __The HTML5 ASP.NET MVC Report Viewer works only with__ ([UriReportSource and TypeReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources)). If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the *report description string* via a custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

### **HTML5 ASP.NET WebForms Report Viewer**

The [HTML5 ASP.NET WebForms Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) is a server-side wrapper of the **HTML5 Viewer**, suitable for ASP.NET WebForms applications.

+ The *report description string* is obtained from the [Telerik.ReportViewer.Html5.WebForms.ReportSource.Identifier](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Identifier) property, which accepts a string. The string can be a path to a TRDP or TRDX file, an assembly-qualified name of a report class, or custom information provided in a string. For example:(__Identifier="./DashboardReport.trdp"__) or (__Identifier="Telerik.Reporting.Examples.CSharp.BarcodesReport, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"__).
+ Report parameters' values are obtained from the [ReportSource.Parameters](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Parameters) property - the *client parameters*.
+ The [Telerik.ReportViewer.Html5.WebForms.ReportSource.IdentifierType](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_IdentifierType) property hints which resolver can be used for resolving the report description string on the server.

- The _report description string_ is obtained from the [Telerik.ReportViewer.Html5.WebForms.ReportSource.Identifier](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Identifier) property, which accepts a string. The string can be a path to a TRDP or TRDX file, an assembly qualified name of a report class or custom information provided in a string. For example:(**Identifier="./DashboardReport.trdp"**) or (**Identifier="Telerik.Reporting.Examples.CSharp.BarcodesReport, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"**).
- Report parameters' values are obtained from the [ReportSource.Parameters](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_Parameters) property - the _client parameters_.
- The [Telerik.ReportViewer.Html5.WebForms.ReportSource.IdentifierType](/api/Telerik.ReportViewer.Html5.WebForms.ReportSource#Telerik_ReportViewer_Html5_WebForms_ReportSource_IdentifierType) property hints which resolver can be used for resolving the report description string on the server.

**Example of setting the client-side ReportSource in code-behind:**

```C#
var clientReportSource = new Telerik.ReportViewer.Html5.WebForms.ReportSource();
clientReportSource.IdentifierType = IdentifierType.TypeReportSource;
clientReportSource.Identifier = typeof(ReportCatalog).AssemblyQualifiedName;//or <namespace>.<class>, <assembly> e.g. "MyReports.Report1, MyReportsLibrary"
clientReportSource.Parameters.Add("Parameter1", 123);
reportViewer1.ReportSource = clientReportSource;
```
```VB
Dim clientReportSource As New Telerik.ReportViewer.Html5.WebForms.ReportSource
clientReportSource.IdentifierType = Telerik.ReportViewer.Html5.WebForms.IdentifierType.TypeReportSource
clientReportSource.Identifier = GetType(ReportCatalog).AssemblyQualifiedName 'or <namespace>.<class>, <assembly> e.g. "MyReports.Report1, MyReportsLibrary"
clientReportSource.Parameters.Add("Parameter1", 123)
reportViewer1.ReportSource = clientReportSource
```

__Example of setting the client-side ReportSource via markup:__ 

1. Open the ASPX with the HTML5 WebForms Report Viewer.
1. Select the HTML5 WebForms Report Viewer and navigate to its Reportsource property in __Visual Studio Property grid__.
1. A __"Load a Report from"__ dialog appears which allows you to select a __ReportSource__.
1. Select the type of report source you would use and specify a report. For this example, we will use a __TypeReportSource__, click the 'Type name' option, and select the report that would be shown in the viewer. If you have to specify parameters for the report, continue with the next step
1. Click __Edit Parameters__ button - __Edit Parameters__ dialog appears. Click __New__. In the __Parameter Name__ column, select the name of a report parameter in the report. In the __Parameter Value__, type or select the value to pass to the parameter in the report.

```HTML
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
```

To display another report or to update the _client parameters_ ' values of the current HTML5 Viewer object, you can update the HTML5 Viewer's reportSource by using the viewer object's [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method in JavaScript. Or you can recreate the HTML5 WebForms Report Viewer.

> __The HTML5 WebForms Report Viewer works only with ([UriReportSource and TypeReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources))__. If you need an InstanceReportSource or XmlReportSource, you will have to resolve manually the *report description string* via a custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

### **WinForms Report Viewer**

The [WinForms Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) can be connected to a **Telerik Reporting REST Service** or **Telerik Report Server** by setting its **ReportEngineConnection property** - [How To: Construct a string to connect to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}). For more details check [How To: Use Windows Forms Report Viewer with Report Server (REST Service)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%}). In this scenario, the viewer's ReportSource property of type **Telerik.Reporting.ReportSource** is considered as a **client-side ReportSource**. The client report source can be set in the same way as if the viewer is operating locally (go to section [Set up Report Viewer controls that work with Telerik Reporting Engine](#set-up-report-viewer-controls-that-work-with-telerik-reporting-engine)), where the **selection is limited to TypeReportSource and UriReportSource**:

- The _report description string_ is obtained from the TypeReportSource.TypeName|UriReportSource.Uri property that returns a string. The _report description string_ is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), which internally resolves it to a **TypeReportSource** or a **UriReportSource** on the machine where the service and Telerik Reporting Engine are running.

  > If you need an InstanceReportSource or XmlReportSource, you will have to send custom string as _report description string_, and to resolve manually the _report description string_ via custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

- Report parameters' values (_client parameters_) are obtained from the TypeReportSource.Parameters|UriReportSource.Parameters collection. The _client parameters_ can be sent through the viewer's Parameters Area, on creating the WinForms Report Viewer, or by updating the viewer's ReportSource property.

**Example of setting the ReportSource in code-behind:**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=Winviewer_SetReportSource}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=Winviewer_SetReportSource}}

### **WPF Report Viewer**

The [WPF Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%}) can be connected to a **Telerik Reporting REST Service** or **Telerik Report Server** by setting its **ReportEngineConnection property** - [How To: Construct a string to connect to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}).

+ The *report description string* is obtained from the TypeReportSource.TypeName|UriReportSource.Uri property, which returns a string. The *report description string* is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) which internally resolves it to a __TypeReportSource__ or a __UriReportSource__ on the machine where the service and Telerik Reporting Engine are running.

	> If you need an InstanceReportSource or XmlReportSource, you will have to send a custom string as *report description string*, and to resolve manually the *report description string* via a custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

- The _report description string_ is obtained from the TypeReportSource.TypeName|UriReportSource.Uri property, that returns a string. The _report description string_ is sent to the [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) which internally resolves it to a **TypeReportSource** or a **UriReportSource** on the machine where the service and Telerik Reporting Engine are running.

  > If you need an InstanceReportSource or XmlReportSource, you will have to send a custom string as _report description string_, and to resolve manually the _report description string_ via custom resolver for the Reporting REST service. For more details, check [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) (available only if using a Telerik Reporting REST service instance).

- Report parameters' values (_client parameters_) are obtained from the TypeReportSource.Parameters|UriReportSource.Parameters collection. The _client parameters_ can be sent through the viewer's Parameters Area, on creating the WPF Report Viewer, or by updating the viewer's ReportSource property.

**Example of specifying the ReportSource declaratively**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window1.xaml}}

**Example of setting the ReportSource at runtime using the _Window.Loaded_ event handler:**

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml.cs}}

{{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml.vb}}

### **WinUI Report Viewer**

The [WinUI Report Viewer control]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%}) can be connected to a **Telerik Reporting REST Service** or **Telerik Report Server** by setting its **ReportEngineConnection property** - [How To: Construct a string to connect to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}).

The configuration is practically identical to the one for the [WPF Report Viewer](#wpf-report-viewer).

**Example of specifying the ReportSource declaratively**

```XAML
<telerikReportingCore:ReportViewer x:Name="reportViewer" Grid.Row="1" ReportEngineConnection="engine=RestService;uri=http://localhost:59655/api/reports">
	<telerikReportingCore:ReportViewer.ReportSource>
		<telerikReportingCore:UriReportSource Uri="MyReport.trdp">
			<telerikReportingCore:ReportSource.Parameters>
				<telerikReportingCore:Parameter Name="ParameterName_01" Value="ParameterValue_01"/>
				<telerikReportingCore:Parameter Name="ParameterName_02" Value="ParameterValue_02"/>
			</telerikReportingCore:ReportSource.Parameters>
		</telerikReportingCore:UriReportSource>
	</telerikReportingCore:ReportViewer.ReportSource>
</telerikReportingCore:ReportViewer>
```

## Set up Report Viewer controls that are integrated with Telerik Report Server

> [Telerik Report Server](https://www.telerik.com/report-server)'s REST Service can use only its built-in Report Source Resolver, capable of handling client-side UriReportSource into a server-side UriReportSource on the server ([Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})). Reports must be [serialized in TRDX files]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) or [packaged in TRDP files]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) which can be published on Telerik Report Server - [Working with Report Server Reports]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports%}). Thus the **client-side ReportSource is limited to UriReportSource**, where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard" which will request the Dashboard.trdx|trdp file that is published on Telerik Report Server under the "Samples" category.

The following Report Viewers are designed to work as clients of [Telerik Report Server](https://www.telerik.com/report-server):

- **HTML5 Report Viewer** - the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **Angular Report Viewer** the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **React Report Viewer** the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **Blazor Report Viewer** the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **Native Blazor Report Viewer** the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **HTML5 ASP.NET MVC Report Viewer** - the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **HTML5 ASP.NET WebForms Report Viewer** - the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **WinForms Report Viewer** - the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **WPF Report Viewer** - the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"
- **WinUI Report Viewer** - the client report source is set in the same way as if the viewer is connected to a **Telerik Reporting REST Service** where the _report description string_ must be in a format: **[CategoryName]/[ReportNameWithoutFileExtension]** e.g. "Samples/Dashboard"

These Report Viewers do not have direct access to Telerik Reporting Engine. Reports are processed and rendered on a remote machine where Telerik Report Server is running, and the content is delivered to the client by **Telerik Report Server's REST Service**.

## See Also

- [Reporting REST Service's Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})
