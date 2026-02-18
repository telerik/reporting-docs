---
title: Using the Blazor Report Viewer
page_title: Integrating the Telerik Reporting Blazor Report Viewer
description: "Learn how the Telerik Reporting Blazor Report Viewer can be integrated into a Blazor Server or Blazor WebAssembly application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer
tags: how,to,use,blazor,report,viewer
published: True
reportingArea: BlazorWrapper
position: 1
previous_url: /blazor-report-viewer-how-to-use
---

# Integrating the Blazor Report Viewer

> The following article will guide you on [how to use the Blazor Report Viewer](https://www.telerik.com/blogs/embed-reporting-everywhere) in a web application.

## Prerequisites

- [Visual Studio 2019+](https://visualstudio.microsoft.com/vs/)

- Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App

- The report viewer consumes reports generated and served from a running Telerik Reporting Web Service. Such can be referenced from another application or Telerik Report Server instance, or it can be hosted within the Blazor Server application.

- Blazor WebAssembly applications are executed directly on the browser UI thread. In other words, Blazor WebAssembly is strictly a client-side application and the Reports Web Service cannot be hosted in the same project. When using Blazor WebAssembly, the Reports Web Service has to be hosted in a separate project or [Telerik Report Server](https://www.telerik.com/report-server) may be used. For more information, see [Blazor WebAssembly vs. Server](https://www.telerik.com/faqs/blazor-ui/what-is-the-difference-between-blazor-webassembly-vs-server). To host the Reporting Service locally, please follow the approach from either the [Hosting the Telerik Reporting REST Service in ASP.NET Core with Top-Level Statements]({%slug how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api%}) or the [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%}) articles.

## Adding the Blazor Report Viewer component using an item template

The Blazor Report Viewer item template allows you to quickly and [add the Blazor Report Viewer](https://www.telerik.com/blogs/telerik-reporting-modern-ui-report-viewer-demo) and [embed the Blazor Report Viewer](https://www.telerik.com/blogs/telerik-reporting-sdk-report-server-dynamic-duo) to your application.

If you wish to connect the Report Viewer to a Reporting REST service, you can analogically follow the steps outlined in the [How to Use HTML5 Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}) documentation article.
Make sure that you select **Blazor Report Viewer page**, instead of **HTML5 Report Viewer page** when adding a new item to your project, and follow the steps in the **'Add new Report Viewer'** dialog.

> note Some options differ between the item templates based on the project they are being added to. For example, the option to host a new REST Service is not available in a Blazor WebAssembly project, since it is a strictly client-side application.

If you wish to connect the Report Viewer to a Report Server instance, refer to the [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates) section in the [How to Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}) documentation article, again, making sure that you select the **Blazor Report Viewer page** in the [Add New Item](<https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)>) dialog box.

## Adding the Blazor Report Viewer component manually

1.  Add NuGet package reference to the `Telerik.ReportViewer.Blazor` package hosted on the Progress Telerik proprietary NuGet feed. Make sure you have the needed NuGet feed added to the Visual Studio setting using the article [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

1.  Make sure app configuration inside the `Configure` method of the `Startup.cs`(or `Program.cs` if .NET {{site.mindotnetversion}}+ is used) can serve static files:

    ```C#
    app.UseStaticFiles();
    ```

1.  Add JavaScript dependencies to the `head` element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

    ```HTML
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    @* For Reports service hosted in the same project: *@
    <script src="/api/reports/resources/js/telerikReportViewer"></script>
    @* For Reports service hosted in another application / Report Server use absolute URI: *@
    @*<script src="https://demos.telerik.com/report-server/api/reports/resources/js/telerikReportViewer"></script>*@
    ```

1.  Add a [Telerik Kendo UI SASS-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) to the `head` element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App). The Razor syntax for a server application differs and you need to escape the **@** symbol as **@@**:

    ```HTML
    <link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
    ```

1.  Add the dedicated `interop.js` dependency at the end of the `body` element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

    ```HTML
    <script src="_content/Telerik.ReportViewer.Blazor/interop.js" defer></script>
    ```

1.  When using the Telerik Reporting web service (either locally hosted or in another application) use the following snippet to place the viewer component in a razor page like `Pages/Index.razor`.

    > note When referencing the Reports service from another application the `ServiceUrl` setting should be the absolute URI to the service.

    ```RAZOR
    @page "/"
    @_ For Blazor Web Apps, an interactive render mode should be used, for example: _@
    @_ @rendermode InteractiveServer _@
    @using Telerik.ReportViewer.Blazor

    <style>
        #rv1 {
            position: relative;
            width: 1200px;
            height: 600px;
        }
    </style>

    <ReportViewer ViewerId="rv1"
        ServiceUrl="/api/reports"
        ReportSource="@(new ReportSourceOptions()
        {
            Report = "SampleReport.trdp"
        })"
        Parameters="@(new ParametersOptions { Editors = new EditorsOptions { MultiSelect = EditorType.ComboBox, SingleSelect = EditorType.ComboBox } })"
        ScaleMode="@(ScaleMode.Specific)"
        Scale="1.0" />
    ```

1.  When displaying reports from a Report Server instance, use the following snippet to place the viewer component in a razor page like `Pages/Index.razor`.

    ```RAZOR
    @page "/"
    @* For Blazor Web Apps, an interactive render mode should be used, for example: *@
    @* @rendermode InteractiveServer *@
    @using Telerik.ReportViewer.Blazor
    <style>
    	#rv1 {
    		position: relative;
    		width: 1200px;
    		height: 600px;
    	}
    </style>
    <ReportViewer
        ViewerId="rv1"
        ReportServer="@(new ReportServerOptions {
                     Url = "https://demos.telerik.com/report-server/",
                     Username = "demouser",
                     Password = "demopass"
                    })"
        ReportSource="@(new ReportSourceOptions() { Report = "Published/Dashboard" })"
        ScaleMode="@(ScaleMode.Specific)"
        Scale="1.0" />
    ```

1.  Finally, run the project to see the rendered report.

## See Also

- [Blazor Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting) documentation article.
