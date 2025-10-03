---
title: Using in .NET
page_title: Integrating Native Blazor Viewer in Blazor Server or WebAssembly App
description: "Learn how to configure and integrate the Native Blazor Report Viewer built on top of the Telerik UI for Blazor widgets in your Blazor Server or WebAssembly Application."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer
tags: how, to, use, native, blazor, report, viewer, server, webassembly
published: True
reporting_area: NativeBlazor
position: 1
---

# Using Native Blazor Report Viewer

The following articles will guide you on [how to use the new Native Blazor Report Viewer](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor) and [embed the Native Blazor Report Viewer](https://www.telerik.com/blogs/embed-reporting-native-blazor-applications) in a web application.

## Prerequisites

* [Visual Studio 2019, version 16.4 or later](https://www.visualstudio.com/vs/)
* Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App
* The report viewer consumes reports generated and served from a running Reports Web Service. Such can be referenced from another application, or it can be hosted locally in a Blazor Server application
* Blazor WebAssembly applications are executed directly on the browser UI thread. In other words, Blazor WebAssembly is strictly a client-side application, and the Reports Web Service cannot be hosted in the same project. When using Blazor WebAssembly, the Reports Web Service has to be hosted in a separate project. For more information, see [Blazor WebAssembly vs. Server](https://www.telerik.com/faqs/blazor-ui/what-is-the-difference-between-blazor-webassembly-vs-server). To host the Reporting Service locally, please follow the approach from either the [Hosting the Telerik Reporting REST Service in ASP.NET Core with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%}) or the [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%}) articles.

## Adding the Native Blazor Report Viewer component using an Item Template

The Native Blazor Report Viewer item template allows you to quickly and easily add the Native Blazor Report Viewer to your application.

Suppose you wish to connect the Report Viewer to a Reporting REST service. In that case, you can analogously follow the steps outlined in the [How to Use HTML5 Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}) documentation article.

Just make sure that you select __Native Blazor Report Viewer page__, instead of __HTML5 Report Viewer page__ when adding a new item to your project, and follow the steps in the __'Add new Report Viewer'__ dialog.

>note Some of the options differ between the item templates based on the project they are being added to. For example, the option to host a new REST Service is not available in a Blazor WebAssembly project, since it is a strictly client-side application.

If you wish to connect the Report Viewer to a Report Server instance, refer to the [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates) section in the [How to Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}) documentation article, again, making sure that you select the __Native Blazor Report Viewer page__ in the [Add New Item](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)) dialog box.

## Adding the Native Blazor Report Viewer Component Manually

1. Add NuGet package reference to the __Telerik.ReportViewer.BlazorNative__ package hosted on the Progress Telerik proprietary NuGet feed. Ensure that the Telerik NuGet feed is added to the NuGet Package Sources by following [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. Use the configuration inside the `Configure` method of the `Startup.cs` (or `Program.cs` if .NET {{site.mindotnetversion}}+ with Top Level Statements is used) file to enable serving static files:

	{{source=CodeSnippets\BlazorAppSnippets\Program.cs region=UseStaticFiles}}

	>note When it comes to Blazor WebAssembly applications, the above step should be implemented in the project used as the *Server* where the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is located. With the [ASP.NET Core Hosted](https://learn.microsoft.com/en-us/aspnet/core/blazor/tooling?view=aspnetcore-7.0&pivots=windows) template, that would be the `Blazor.Server` project.

1. (Optional) The [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) depends on version **9.1.0** of the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) product. If [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) is already used in your Blazor application, this step can be skipped. Otherwise, add the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) JS and its [Kendo theme](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) dependencies to the __head__ element of the __Pages/_Layout.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

	{{source=CodeSnippets\BlazorAppSnippets\Components\Pages\Native_Layout.cshtml}}

1. Add the  [Native Blazor Report Viewer's]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) JS and CSS dependencies to the __head__ element of the __Pages/_Layout.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App).

	{{source=CodeSnippets\BlazorAppSnippets\Components\Pages\Native_AddTheme.cshtml}}

1. Configure the project to recognize all Telerik components without explicit __@using__ statements on every __.razor__ file by adding the following code to your __~/_Imports.razor__:

	{{source=CodeSnippets\BlazorAppSnippets\Components\Native_Imports.razor}}

1. Wrap the content of the main layout file(by default, the __~/Shared/MainLayout.razor__ file in the Blazor project) with a razor component called __TelerikLayout.razor__:

	

1. If the report viewer should connect to a Reporting REST service (either locally hosted or in another application), use the following snippet to place the viewer component in a **.razor** page like __Pages/Index.razor__. Note that when referencing the Reporting REST service from another application, the `ServiceUrl` setting should be the absolute URL to the service.

	{{source=CodeSnippets\BlazorAppSnippets\Components\Pages\Native_Viewer_REST.razor}}

	> The `ReportSource` of the viewer should be set as in the above example. i.e. with the binding `@bind-ReportSource="@ReportSource"`. Setting the `ReportSource` directly, for example, like `ReportSource="@(new ReportSourceOptions("Report Catalog.trdp", new Dictionary<string, object>()))"` introduces a circular dependency that causes endless refreshes of the Report Viewer that lead to an infinite sequence of requests to the Reporting REST Service.

1. If you need to display the reports from a Report Server instance, use the following snippet to place the viewer component in a **.razor** page like __Pages/Index.razor__. Remember to set the actual __ReportServer__ and __ReportSource__ settings:

	{{source=CodeSnippets\BlazorAppSnippets\Components\Pages\Native_Viewer_ReportServer.razor}}

1. Use the rest of the parameters exposed on the Blazor viewer component to set up its appearance and behavior as desired.
1. Finally, run the project to see the rendered report.

## See Also

* [Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting)
* [Native Blazor Report Viewer Overview]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
