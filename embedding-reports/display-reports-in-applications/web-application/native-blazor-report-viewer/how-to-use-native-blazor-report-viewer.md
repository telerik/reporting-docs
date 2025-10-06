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

- [Visual Studio 2019, version 16.4 or later](https://www.visualstudio.com/vs/)
- Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App
- The report viewer consumes reports generated and served from a running Reports Web Service. Such can be referenced from another application, or it can be hosted locally in a Blazor Server application
- Blazor WebAssembly applications are executed directly on the browser UI thread. In other words, Blazor WebAssembly is strictly a client-side application, and the Reports Web Service cannot be hosted in the same project. When using Blazor WebAssembly, the Reports Web Service has to be hosted in a separate project. For more information, see [Blazor WebAssembly vs. Server](https://www.telerik.com/faqs/blazor-ui/what-is-the-difference-between-blazor-webassembly-vs-server). To host the Reporting Service locally, please follow the approach from either the [Hosting the Telerik Reporting REST Service in ASP.NET Core with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%}) or the [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%}) articles.

## Adding the Native Blazor Report Viewer component using an Item Template

The Native Blazor Report Viewer item template allows you to quickly and easily add the Native Blazor Report Viewer to your application.

Suppose you wish to connect the Report Viewer to a Reporting REST service. In that case, you can analogically follow the steps outlined in the [How to Use HTML5 Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}) documentation article.

Just make sure that you select **Native Blazor Report Viewer page**, instead of **HTML5 Report Viewer page** when adding a new item to your project, and follow the steps in the **'Add new Report Viewer'** dialog.

> note Some of the options differ between the item templates based on the project they are being added to. For example, the option to host a new REST Service is not available in a Blazor WebAssembly project, since it is a strictly client-side application.

If you wish to connect the Report Viewer to a Report Server instance, refer to the [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates) section in the [How to Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}) documentation article, again, making sure that you select the **Native Blazor Report Viewer page** in the [Add New Item](<https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)>) dialog box.

## Adding the Native Blazor Report Viewer Component Manually

1. Add NuGet package reference to the **Telerik.ReportViewer.BlazorNative** package hosted on the Progress Telerik proprietary NuGet feed. Ensure that the Telerik NuGet feed is added to the NuGet Package Sources by following [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. Use the configuration inside the `Configure` method of the `Startup.cs` (or `Program.cs` if .NET {{site.mindotnetversion}}+ with Top Level Statements is used) file to enable serving static files:

   ```C#
   app.UseStaticFiles();
   ```

   > note When it comes to Blazor WebAssembly applications, the above step should be implemented in the project used as the _Server_ where the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is located. With the [ASP.NET Core Hosted](https://learn.microsoft.com/en-us/aspnet/core/blazor/tooling?view=aspnetcore-7.0&pivots=windows) template, that would be the `Blazor.Server` project.

1. (Optional) The [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) depends on version **9.1.0** of the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) product. If [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) is already used in your Blazor application, this step can be skipped. Otherwise, add the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) JS and its [Kendo theme](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) dependencies to the **head** element of the **Pages/\_Layout.cshtml** (Blazor Server) or **wwwroot/index.html** (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

   ```HTML
   <script src="_content/Telerik.UI.for.Blazor/js/telerik-blazor.js" defer></script>

       @* The version of the Kendo Utils should be updated according to the version of the Kendo theme used by the Telerik UI for Blazor package. *@
       @* The version of the Kendo Theme can be seen in the release notes of the Telerik UI for Blazor version - https://www.telerik.com/support/whats-new/blazor-ui/release-history. *@
   <link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/10.0.1/utils/all.css" />
   <link rel="stylesheet" href="_content/Telerik.UI.for.Blazor/css/kendo-theme-default/all.css" />
   <link rel="stylesheet" href="_content/Telerik.UI.for.Blazor/css/kendo-font-icons/font-icons.css" />
   ```

1. Add the [Native Blazor Report Viewer's]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) JS and CSS dependencies to the **head** element of the **Pages/\_Layout.cshtml** (Blazor Server) or **wwwroot/index.html** (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App).

   ```HTML
   <link href="_content/Telerik.ReportViewer.BlazorNative/css/reporting-blazor-viewer.css" rel="stylesheet" />
   <script src="_content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js"></script>
   ```

1. Configure the project to recognize all Telerik components without explicit **@using** statements on every **.razor** file by adding the following code to your **~/\_Imports.razor**:

   ```C#
   @using Telerik.Blazor
   @using Telerik.Blazor.Components
   @using Telerik.ReportViewer.BlazorNative
   ```

1. Wrap the content of the main layout file(by default, the **~/Shared/MainLayout.razor** file in the Blazor project) with a razor component called **TelerikLayout.razor**:

   ```RAZOR
   @inherits LayoutComponentBase

   <TelerikRootComponent>
   	@Body
   </TelerikRootComponent>
   ```

1. If the report viewer should connect to a Reporting REST service (either locally hosted or in another application), use the following snippet to place the viewer component in a **.razor** page like **Pages/Index.razor**. Note that when referencing the Reporting REST service from another application, the `ServiceUrl` setting should be the absolute URL to the service.

   ```RAZOR
   @page "/"
   @* For Blazor Web Apps, an interactive render mode should be used, for example: *@
   @* @rendermode InteractiveServer *@

   <PageTitle>Report Viewer</PageTitle>

   <ReportViewer
   	ServiceType="@ReportViewerServiceType.REST"
   	ServiceUrl="https://demos.telerik.com/reporting/api/reports"
   	@bind-ReportSource="@ReportSource"
   	@bind-ScaleMode="@ScaleMode"
   	@bind-ViewMode="@ViewMode"
   	@bind-ParametersAreaVisible="@ParametersAreaVisible"
   	@bind-DocumentMapVisible="@DocumentMapVisible"
   	@bind-Scale="@Scale">
   </ReportViewer>

   @code {
   	public ScaleMode ScaleMode { get; set; } = ScaleMode.Specific;
   	public ViewMode ViewMode { get; set; } = ViewMode.Interactive;
   	public bool ParametersAreaVisible { get; set; }
   	public bool DocumentMapVisible { get; set; }
   	public double Scale { get; set; } = 1.0;

   	public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Catalog.trdx",
   		new Dictionary<string, object>
   		{
   			// Add parameters if applicable
   		});
   }
   ```

   > The `ReportSource` of the viewer should be set as in the above example. i.e. with the binding `@bind-ReportSource="@ReportSource"`. Setting the `ReportSource` directly, for example, like `ReportSource="@(new ReportSourceOptions("Report Catalog.trdp", new Dictionary<string, object>()))"` introduces a circular dependency that causes endless refreshes of the Report Viewer that lead to an infinite sequence of requests to the Reporting REST Service.

1. If you need to display the reports from a Report Server instance, use the following snippet to place the viewer component in a **.razor** page like **Pages/Index.razor**. Remember to set the actual **ReportServer** and **ReportSource** settings:

   ```RAZOR
   @page "/"
   @* For Blazor Web Apps, an interactive render mode should be used, for example: *@
   @* @rendermode InteractiveServer *@

   <PageTitle>Report Viewer</PageTitle>

   <ReportViewer
   	ServiceType="@ReportViewerServiceType.ReportServer"
   	@bind-ReportSource="@ReportSource"
   	@bind-ScaleMode="@ScaleMode"
   	@bind-ViewMode="@ViewMode"
   	@bind-ParametersAreaVisible="@ParametersAreaVisible"
   	@bind-DocumentMapVisible="@DocumentMapVisible"
   	@bind-Scale="@Scale">
   	<ReportViewerSettings>
   		<ReportServerSettings Url="https://demos.telerik.com/report-server/" Username="demouser" Password="demopass"></ReportServerSettings>
   	</ReportViewerSettings>
   </ReportViewer>

   @code {
   	public ScaleMode ScaleMode { get; set; } = ScaleMode.Specific;
   	public ViewMode ViewMode { get; set; } = ViewMode.Interactive;
   	public bool ParametersAreaVisible { get; set; }
   	public bool DocumentMapVisible { get; set; }
   	public double Scale { get; set; } = 1.0;

   	public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Published/Dashboard", new Dictionary<string, object>
   	{
   		// Add parameters if applicable
   	});
   }
   ```

1. Use the rest of the parameters exposed on the Blazor viewer component to set up its appearance and behavior as desired.
1. Finally, run the project to see the rendered report.

## See Also

- [Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting)
- [Native Blazor Report Viewer Overview]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
