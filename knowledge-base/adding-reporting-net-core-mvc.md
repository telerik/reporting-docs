---
title: Adding Telerik Reporting in ASP .Net Core 3.1 MVC Project
description: Learn how to add Telerik Reporting in ASP .Net Core 3.1 MVC project.
type: how-to
page_title: How to Add Telerik Reporting in ASP.Net Core 3.1 MVC Project
slug: adding-reporting-net-core-mvc
position: 
tags: 
ticketid: 1454516
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.115+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>.Net Framework</td>
			<td>.NET Core 3.0</td>
		</tr>
	</tbody>
</table>


## Description
This KB article lists all necessary steps for integrating a Telerik Report in .NET Core MVC 3.1 project. 
It is based on [How To: Host Reports Service In ASP.NET Core 3+](../telerik-reporting-rest-service-aspnetcore-mvc-core3).
The same approach can be applied for .NET Core MVC 3.0 project.
 

## Solution
1. Add the following NuGet packages:
- Telerik.Reporting.Services.AspNetCore
- Microsoft.AspNetCore.Mvc.NewtonsoftJson

2. Add a folder with the reports.

3. Add the **ReportsController**:

```CSharp
namespace WebApplication1.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using System.Net;
    using System.Net.Mail;
    using Telerik.Reporting.Services;
    using Telerik.Reporting.Services.AspNetCore;

    [Route("api/reports")]
    public class ReportsController : ReportsControllerBase
    {
        public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
            : base(reportServiceConfiguration)
        {
        }

        protected override HttpStatusCode SendMailMessage(MailMessage mailMessage)
        {
            throw new System.NotImplementedException("This method should be implemented in order to send mail messages");

            //using (var smtpClient = new SmtpClient("smtp01.mycompany.com", 25))
            //{
            //    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //    smtpClient.EnableSsl = false;

            //    smtpClient.Send(mailMessage);
            //}
            //return HttpStatusCode.OK;
        }
    }
}
```
4. Add a new class named **ConfigurationHelper**:

```CSharp
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace WebApplication1
{
    static class ConfigurationHelper
    {
        public static IConfiguration ResolveConfiguration(IWebHostEnvironment environment)
        {
            var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "appsettings.json");
            return new ConfigurationBuilder()
                .AddJsonFile(reportingConfigFileName, true)
                .Build();
        }
    }
}
```
5. Add the required configurations in the **Startup.cs** from [Setup the Startup.cs file for the Reports service](../telerik-reporting-rest-service-aspnetcore-mvc-core3#setup-the-startup-cs-file-for-the-reports-service):

```CSharp
public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddControllersWithViews();
        services.AddControllers();
        services.Configure<IISServerOptions>(options =>
        {
            options.AllowSynchronousIO = true;
        });
        services.AddRazorPages()
         .AddNewtonsoftJson();
        // Configure dependencies for ReportsController.
        services.TryAddSingleton<IReportServiceConfiguration>(sp =>
            new ReportServiceConfiguration
            {
                ReportingEngineConfiguration = ConfigurationHelper.ResolveConfiguration(sp.GetService<IWebHostEnvironment>()),
                HostAppId = "ReportingCore3App",
                Storage = new FileStorage(),
                ReportResolver = new ReportFileResolver(
                    System.IO.Path.Combine(sp.GetService<IWebHostEnvironment>().ContentRootPath, "Reports"))
            });
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseExceptionHandler("/Home/Error");
        }
        app.UseStaticFiles();

        app.UseRouting();

        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllers();
            endpoints.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");
        });
    }
}

```
6. The view has to look as follows:

```Javascript
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link href="https://kendo.cdn.telerik.com/2019.1.115/styles/kendo.common.min.css" rel="stylesheet" id="common-css" />
    <link href="https://kendo.cdn.telerik.com/2019.1.115/styles/kendo.blueopal.min.css" rel="stylesheet" id="skin-css" />

    <style>
        body {
            margin: 5px;
            font-family: Verdana, Arial, sans-serif;
        }

        #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 160px;
            bottom: 5px;
            overflow: hidden;
            clear: both;
        }
    </style>

    <title>Telerik HTML5 Report Viewer Demo</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

</head>
<body>

    <div id="reportViewer1">
        loading...
    </div>

</body>
</html>

@section scripts
    {
    <script src="/api/reports/resources/js/telerikReportViewer"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#reportViewer1")
                .telerik_ReportViewer({
                    // The URL of the service which will serve reports.
                    // The URL corresponds to the name of the controller class (ReportsController).
                    // For more information on how to configure the service please check http://www.telerik.com/help/reporting/telerik-reporting-rest-conception.html.
                    serviceUrl: "api/reports/",

                    // The URL for the report viewer template. The template can be edited -
                    // new functionalities can be added and unneeded ones can be removed.
                    // For more information please check http://www.telerik.com/help/reporting/html5-report-viewer-templates.html.
                    // templateUrl: 'ReportViewer/templates/telerikReportViewerTemplate.html',

                    //ReportSource - report description
                    reportSource: {

                        // The report can be set to a report file name (.trdx or .trdp report definition)
                        // or CLR type name (report class definition).
                        report: "Product Sales.trdp",
                        // Parameters name value dictionary
                        //parameters: {}
                    },

                    //parameters: {
                    //    editors: {
                    //        singleSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,
                    //        multiSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,
                    //    }
                    //},

                    // Specifies whether the viewer is in interactive or print preview mode.
                    // PRINT_PREVIEW - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.
                    // INTERACTIVE - Displays the report in its original width and height without paging. Additionally interactivity is enabled.
                    viewMode: telerikReportViewer.ViewModes.INTERACTIVE,

                    // Sets the scale mode of the viewer.
                    // Three modes exist currently:
                    // FIT_PAGE - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
                    // FIT_PAGE_WIDTH - The report will be zoomed in or out so that the width of the screen and the width of the report match.
                    // SPECIFIC - Uses the scale to zoom in and out the report.
                    scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,

                    // Zoom in and out the report using the scale
                    // 1.0 is equal to 100%, i.e. the original size of the report
                    scale: 1.0,

                    //Enables or disables the accessibility features of the report viewer and its contents.
                    enableAccessibility: false,

                    //If set to true shows the Send Mail Message toolbar button
                    sendEmail: { enabled: true }
                });
        });
    </script>
}
```
7. If you are using [SQL DataSource](../sqldatasource) with Shared connection string, add a connection string in appsettings.json file:

```Javascript
"ConnectionStrings": [
  {
    "name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
    "connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
    "providerName": "System.Data.SqlClient"
  }
]
```

## Demo application
The demo can be found in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/.NET%20Core%203.1%20MVC).
