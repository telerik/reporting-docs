---
title: How to implement Telerik Reporting in ASP.NET Core 2.1 MVC
description: How to use Telerik Reporting in ASP.NET Core 2.1 MVC
type: how-to
page_title: How to run Telerik Reporting Engine and Viewer in ASP.NET Core 2.1 MVC
slug: how-to-implement-telerik-reporting-in-asp-net-core-mvc
position: 
tags: ASP.NET Core, Configuration
ticketid: 1399007
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116 and above</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>ASP.NET Core</td>
	</tr>
	<tr>
		<td>Preferred Language</td>
		<td>C Sharp</td>
	</tr>
</table>


## Description
How to implement the Telerik Reporting engine and viewer in ASP.NET Core MVC project?

## Solution
There are some specifics related to ASP.NET Core configuration that we will discuss in the beginning.  Please note that the configuration is mostly taken from the official documentation: [Configuration in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/index?view=aspnetcore-2.2).

App configuration in ASP.NET Core uses the new SDK-style project and utilizes **appsettings.json** as a configuration file. To work these settings in your ASP.NET Core application, it is recommended that you only instantiate a *ConfigurationService* in your application’s *Startup* class. Then, use [the Options pattern](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/options?view=aspnetcore-2.2) to access individual settings. For example, the **ConnectionStrings** setting should be configured in JSON-based format like for example:

```JSON
{
  ...
  "ConnectionStrings": [
    {
      "name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
      "connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
      "providerName": "System.Data.SqlClient"
    }
  ]
}
```
For more information about Telerik Reporting JSON-based configuration structure, please refer to the [Telerik Reporting Configuration Layout](../configuring-telerik-reporting#telerik-reporting-configuration-layout) help article.

We have to build the configuration in *Startup.cs* as we implement a sample *ConfigurationService* class which ensures reading the **appsettings.json** as config file and used in the ReportsController constructor:
```CSharp
public class ConfigurationService
{
    public IConfiguration Configuration { get; private set; }
 
    public IHostingEnvironment Environment { get; private set; }
    public ConfigurationService(IHostingEnvironment environment)
    {
        this.Environment = environment;
 
        var configFileName = System.IO.Path.Combine(environment.ContentRootPath, "appsettings.json");
        var config = new ConfigurationBuilder()
                        .AddJsonFile(configFileName, true)
                        .Build();
 
        this.Configuration = config;
    }
}
```
If we want to inject our configuration to our controllers, we'll need to register it with the runtime. We do so via *Startup.ConfigureServices*:
```CSharp
IServiceCollection services;
 
// This method gets called by the runtime. Use this method to add services to the container.
public void ConfigureServices(IServiceCollection services)
{
    this.services = services;
    this.services.Configure<CookiePolicyOptions>(options =>
    {
        // This lambda determines whether user consent for non-essential cookies is needed for a given request.
        options.CheckConsentNeeded = context => true;
        options.MinimumSameSitePolicy = SameSiteMode.None;
    });
    this.services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
    this.services.AddSingleton<ConfigurationService>();
}
```

In order to have access to *WebRootPath* in the ReportsController (I assume that the reports will be stored at *wwwroot/Reports* directory), we need to register it with the runtime. We do so via *Startup.Configure*:
```CSharp
public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{
    this.services.AddTransient(ctx => new ReportsController(new ConfigurationService(env)));
    ....
}
```
After the initial configuration is done, you can create ReportsController class which will look like:
```CSharp
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using Microsoft.AspNetCore.Mvc;
using Telerik.Reporting.Cache.File;
using Telerik.Reporting.Services;
using Telerik.Reporting.Services.AspNetCore;
 
namespace AspNetCoreMvcDemo.Controllers
{
    [Route("api/reports")]
    public class ReportsController : ReportsControllerBase
    {
        readonly string reportsPath = string.Empty;
 
        public ReportsController(ConfigurationService configSvc)
        {
            this.reportsPath = Path.Combine(configSvc.Environment.WebRootPath, "Reports");
 
            this.ReportServiceConfiguration = new ReportServiceConfiguration
            {
                ReportingEngineConfiguration = configSvc.Configuration,
                HostAppId = "Html5DemoAppCore",
                Storage = new FileStorage(),
                ReportResolver = new ReportTypeResolver()
                                    .AddFallbackResolver(new ReportFileResolver(this.reportsPath)),
            };
        }
 
        [HttpGet("reportlist")]
        public IEnumerable<string> GetReports()
        {
            return Directory
                .GetFiles(this.reportsPath)
                .Select(path =>
                    Path.GetFileName(path));
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

In the end, we should create the report viewer. As the [HTML5 ASP.NET MVC Report Viewer](../mvc-report-viewer-extension-overview) is a server-side wrapper for the [HTML5 JavaScript ReportViewer](../html5-report-viewer), it requires a reference to **Telerik.ReportViewer.Mvc.dll**. However, as this assembly is built against the *full .NET Framework*, the only possible approach is creating a pure HTML5 Viewer.

## Notes
The demo application could be downloaded from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/aspnetcoremvcdemo.zip?sfvrsn=32676553_2).

## See Also
For additional information, you could refer to the new conceptual documentation article [.NET Core Support](../use-reports-in-net-core-apps) that explains how to use reports in pure .NET Core application for Windows and Linux platforms.
