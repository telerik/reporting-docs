---
title: How to Use Blazor Report Viewer
page_title: How to Use Blazor Report Viewer 
description: How to Use Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer
tags: how,to,use,blazor,report,viewer
published: True
position: 1
---

# How to Use Blazor Report Viewer



> The following article guides you how to use Blazor Report Viewer in a            [Blazor](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor)            web application.         


## Prerequisites

* [Visual Studio 2019, version 16.4 or later](https://www.visualstudio.com/vs/) 

* Existing ASP.NET Core 3.1 and higher Blazor Server App or ASP.NET Core 3.1 and higher hosted Blazor WebAssembly App             

* The report viewer consumes reports generated and served from a running Reports Web Service.               Such can be referenced from another application or Telerik Report Server instance               ,or it can be hosted locally in a Blazor Server application.              

* Blazor WebAssembly applications are executed directly on the browser UI thread.               In other words, Blazor WebAssembly are stictly client-side applications and the Reports Web Service cannot be hosted in the same project.               When using Blazor WebAssembly, the Reports Web Service has to be hosted in a separate project or                 [Telerik Report Server](https://www.telerik.com/report-server)  may be used.               For more information, see                [Blazor WebAssembly vs. Server](https://www.telerik.com/faqs/blazor-ui/what-is-the-difference-between-blazor-webassembly-vs-server).               To host the Reporting Service locally, please follow the approach from either the [How to Host Reports Service in ASP.NET Core 3.1]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%}) or the [How to Host Reports Service in ASP.NET Core in.NET 5]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%}) articles.             

## Adding the HTML5 Report Viewer component

1. Add NuGet package reference to the __Telerik.ReportViewer.Blazor__ (or __Telerik.ReportViewer.Blazor.Trial__)               package hosted on the Progress Telerik proprietary NuGet feed.               Make sure you have the needed NuGet feed added to VS setting using the article [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).             

1. Make sure app configuration inside the __Configure__ method of the __Startup.cs__             can serve static files:             

    
      ````c#
app.UseStaticFiles();
````

1. Add JavaScript dependencies to the __head__ element of the               __Pages/_Host.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly):             

    
      ````html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" /script>
@* For Reports service hosted in the same project: *@
<script src="/api/reports/resources/js/telerikReportViewer" /script>
@* For Reports service hosted in another application / Report Server use absolute URI: *@
@*<script src="https://demos.telerik.com/report-server/api/reports/resources/js/telerikReportViewer" /script>*@
````

1. Add                [Telerik Kendo UI Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)                to the __head__ element of the               __Pages/_Host.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly).               The Razor syntax for a server application differs and you need to escape the __@__ symbol as __@@__ :             

    
      ````html
<link rel="stylesheet" href="https://unpkg.com/@progress/kendo-theme-default@latest/dist/all.css" />
````

Alternatively you can use the                [Kendo UI Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling)                (Kendo UI Less-Based Themes are not compatible with Telerik UI for Blazor and should not be used together):             

    
      ````html
<link href="https://kendo.cdn.telerik.com/2020.3.1118/styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/2020.3.1118/styles/kendo.blueopal.min.css" rel="stylesheet" />
````

1. Add the dedicated __interop.js__ dependency at the end of the __body__ element of the               __Pages/_Host.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly):             

    
      ````
<script src="_content/Telerik.ReportViewer.Blazor/interop.js" defer /script>
@* Or this one if using the Telerik.ReportViewer.Blazor.Trial package *@
@*<script src="_content/Telerik.ReportViewer.Blazor.Trial/interop.js" defer /script>*@
````

1. If using Reports web service (either locally hosted or in another application) use the following snippet to place the viewer component in               a razor page like __Pages/Index.razor__. Note that when referencing the Reports service from another application               the ServiceUrl setting should be the absolute URI to the service. Remember to set the actual __ReportSource__ along with eventual parameters:             

    
      ````
@page "/"
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
                                  Report = "YOUR_REPORT_HERE.trdp"
                              })"
              Parameters="@(new ParametersOptions { Editors = new EditorsOptions { MultiSelect = EditorType.ComboBox, SingleSelect = EditorType.ComboBox } })"
              ScaleMode="@(ScaleMode.Specific)"
              Scale="1.0" />
````

1. If displaying reports from a Report Server instance use the following snippet to place the viewer component in               a razor page like __Pages/Index.razor__. Remember to set the actual __ReportServer__             and __ReportSource__ settings:             

    
      ````
@page "/"
@using Telerik.ReportViewer.Blazor
<style>
    #rv1 {
        position: relative;
        width: 1200px;
        height: 600px;
    }
</style>
<ReportViewer ViewerId="rv1"
              ReportServer="@(new ReportServerOptions {  Url = "https://demos.telerik.com/report-server/", Username = "demouser", Password = "demopass" })"
              ReportSource="@(new ReportSourceOptions()
                              {
                                  Report = "Published/Dashboard"
                              })"
              ScaleMode="@(ScaleMode.Specific)"
              Scale="1.0" />
````

1. Use the rest of the parameters exposed on the Blazor viewer component to setup its appearance and behavior as desired.             

1. Finally, run the project to see the rendered report.

