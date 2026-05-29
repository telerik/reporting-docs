---
title: Using in .NET
page_title: Integrating Native Blazor Viewer in Blazor Server or WebAssembly App
description: "Learn how to configure and integrate the Native Blazor Report Viewer built on top of the Telerik UI for Blazor widgets in your Blazor Server or WebAssembly Application."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer
tags: how, to, use, native, blazor, report, viewer, server, webassembly
published: True
reportingArea: NativeBlazor
position: 1
---

# Using Native Blazor Report Viewer

The Native Blazor Report Viewer is a component built entirely with Blazor and Telerik UI for Blazor, providing a modern, native experience for displaying reports in Blazor Server and Blazor WebAssembly applications.

**Key Benefits:**

- Pure Blazor implementation (no HTML5 viewer wrapper; only the standard Telerik UI for Blazor JS/CSS dependencies)
- Seamless integration with Telerik UI for Blazor applications  
- Full support for both Blazor Server and WebAssembly hosting models
- Can connect to either a Reporting REST Service or Report Server

This article guides you through integrating the Native Blazor Report Viewer into your application using either the item template or manual configuration.

## Prerequisites

- [Visual Studio 2022 or later](https://visualstudio.microsoft.com/vs/) or [Visual Studio Code](https://code.visualstudio.com/) with the C# Dev Kit extension
- Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App
- The report viewer consumes reports generated and served from a running Reporting REST Service. Such can be referenced from another application, or it can be hosted locally in a Blazor Server application
- Blazor WebAssembly applications are executed directly on the browser UI thread. In other words, Blazor WebAssembly is strictly a client-side application, and the Reporting REST Service cannot be hosted in the same project. When using Blazor WebAssembly, the Reporting REST Service has to be hosted in a separate project. For more information, see [Blazor WebAssembly vs. Server](https://www.telerik.com/faqs/blazor-ui/what-is-the-difference-between-blazor-webassembly-vs-server). To host the Reporting Service locally, please follow the approach from either the [Hosting the Telerik Reporting REST Service in ASP.NET Core with Top-Level Statements](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api) or the [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application with Startup.cs](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5) articles.

## Integration Options

The Native Blazor Report Viewer supports two backend integration options:

1. **Reporting REST Service** - Ideal when:
   - You need full control over report generation
   - Reports are stored as definition files (.trdp, .trdx) or cs/vb types.
   - You want to host reports alongside your application
   - You're building a new reporting solution

2. **Report Server** - Ideal when:
   - You have centralized report management needs
   - Multiple applications share the same reports
   - You need role-based access control
   - You want browser-based report authoring

This article covers both approaches. Choose the one that fits your architecture.

## Adding the Native Blazor Report Viewer component using an Item Template

The Native Blazor Report Viewer item template allows you to quickly and easily add the Native Blazor Report Viewer to your application.

Suppose you wish to connect the Report Viewer to a Reporting REST service. In that case, you can analogically follow the steps outlined in the [How to Use HTML5 Report Viewer with REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service) documentation article.

Just make sure that you select **Native Blazor Report Viewer page**, instead of **HTML5 Report Viewer page** when adding a new item to your project, and follow the steps in the **'Add new Report Viewer'** dialog.

> note Some of the options differ between the item templates based on the project they are being added to. For example, the option to host a new REST Service is not available in a Blazor WebAssembly project, since it is a strictly client-side application.

If you wish to connect the Report Viewer to a Report Server instance, refer to the [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates) section in the [How to Use HTML5 Report Viewer with Report Server](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server) documentation article, again, making sure that you select the **Native Blazor Report Viewer page** in the [Add New Item](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)) dialog box.

## Adding the Native Blazor Report Viewer Component Manually

1. Add NuGet package reference to the **Telerik.ReportViewer.BlazorNative** package hosted on the Progress Telerik proprietary NuGet feed. Ensure that the Telerik NuGet feed is added to the NuGet Package Sources by following [How to add the Telerik private NuGet feed to Visual Studio](slug:telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio).
1. Use the configuration inside the `Configure` method of the `Startup.cs` (or `Program.cs` if .NET {{site.mindotnetversion}}+ with Top Level Statements is used) file to enable serving static files:

	{{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=UseStaticFiles}}


	> note When it comes to Blazor WebAssembly applications, the above step should be implemented in the project used as the _Server_ where the [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview) is located. With the [ASP.NET Core Hosted](https://learn.microsoft.com/en-us/aspnet/core/blazor/tooling?view=aspnetcore-7.0&pivots=windows) template, that would be the `Blazor.Server` project.

1. (Optional) The [Native Blazor Report Viewer](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview) depends on version **{{site.blazoruiversion}}** of the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) product. If [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) is already used in your Blazor application, this step can be skipped. Otherwise, add the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) JS and its [Kendo theme](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) dependencies to the **head** element of the **Pages/\_Layout.cshtml** (Blazor Server) or **wwwroot/index.html** (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeBlazorViewerUseNativeBlazorReportViewer.html region=NativeBlazorViewerAddingTheNativeBlazorReportViewerComponentManually}}

1. Add the [Native Blazor Report Viewer's](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview) JS and CSS dependencies to the **head** element of the **Pages/\_Layout.cshtml** (Blazor Server) or **wwwroot/index.html** (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App).

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeBlazorViewerUseNativeBlazorReportViewer.html region=NativeBlazorViewerAddingTheNativeBlazorReportViewerComponentManually2}}

1. Configure the project to recognize all Telerik components without explicit **@using** statements on every **.razor** file by adding the following code to your **~/\_Imports.razor**:

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\TelerikLayout.razor region=NativeViewerUsingsInImports}}

1. Wrap the content of the main layout file(by default, the **~/Shared/MainLayout.razor** file in the Blazor project) with a razor component called **TelerikLayout.razor**:

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\TelerikLayout.razor region=NativeViewerTelerikLayout}}

1. If the report viewer should connect to a Reporting REST service (either locally hosted or in another application), use the following snippet to place the viewer component in a **.razor** page like **Pages/Index.razor**. Note that when referencing the Reporting REST service from another application, the `ServiceUrl` setting should be the absolute URL to the service.

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerWithRest.razor region=NativeViewerWithRESTService}}

	> warning
	>
	> The `ReportSource` of the viewer must be set using data binding as shown in the example above: `@bind-ReportSource="@ReportSource"`.
	>
	> Do NOT set the `ReportSource` directly, for example: `ReportSource="@(new ReportSourceOptions(\"Report Catalog.trdp\", new Dictionary<string, object>()))"`.
	>
	> Direct assignment introduces a circular dependency that causes endless refreshes of the Report Viewer, leading to an infinite sequence of requests to the Reporting REST Service.

1. If you need to display the reports from a Report Server instance, use the following snippet to place the viewer component in a **.razor** page like **Pages/Index.razor**. Remember to set the actual **ReportServer** and **ReportSource** settings:

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerWithRS.razor region=NativeViewerWithReportServer}}

1. Use the rest of the parameters exposed on the Blazor viewer component to set up its appearance and behavior as desired.
1. Finally, run the project to see the rendered report.

## Blazor Render Mode Configuration (.NET 8+)

For .NET 8+ Blazor Web Apps, the Native Blazor Report Viewer requires an interactive render mode. Add one of the following directives to your page:

- `@rendermode InteractiveServer` - Renders on server, updates via SignalR
- `@rendermode InteractiveWebAssembly` - Renders in browser WebAssembly
- `@rendermode InteractiveAuto` - Server-side initially, then WebAssembly after download

## Configuring CORS for Remote REST Service

When the Reporting REST Service is hosted in a separate application from the Blazor app, configure CORS to allow requests from your Blazor app's origin.

Add the CORS policy in the REST Service's `Program.cs`:

{{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=ReportingRestServiceAddCors}}

>caution **Security Note**: The example above uses `AllowAnyOrigin()` for development convenience. For production, restrict to specific origins:
{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=ReportingRestServiceAddCors}}


## See Also

- [Native Blazor Report Viewer Overview](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview)
- [Using Native Blazor Report Viewer with Report Server for .NET](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-with-report-server-net)
- [Native Blazor Report Viewer Options](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options)
- [Native Blazor Report Viewer Commands](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/commands)
- [Native Blazor Report Viewer Events](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/events)
- [Customize the Toolbar of the Blazor Native Report Viewer](slug:native-blazor-report-viewer/toolbar-customization)
- [Hosting Telerik Reporting REST Service in ASP.NET Core](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api)
- [Hosting Telerik Reporting REST Service in an ASP.NET Core Application with Startup.cs](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5)
- [Telerik Blazor Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting)
- [Enabling Cross-Origin Requests (CORS) in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/security/cors)
