---
title: How to implement the ReportsController in an application
page_title: How to implement the ReportsController in an application | for Telerik Reporting Documentation
description: How to implement the ReportsController in an application
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application
tags: how,to,implement,the,reportscontroller,in,an,application
published: True
position: 4
---

# How to implement the ReportsController in an application



The Telerik Reporting REST Web API service is represented by the abstract  [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase)          class. This abstract class requires  [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver)          and  [IStorage](/reporting/api/Telerik.Reporting.Cache.Interfaces.IStorage)  implementations.         In order to add the reports controller to your application follow the steps:       

## 

1. Add references to the following Telerik Reporting assemblies (required)               and set their __Copy Local__  properties to true in Visual Studio:             
   + Telerik.Reporting                 

   + Telerik.Reporting.Services.WebApi (located in the installation Bin folder)                 

    >Without setting Telerik Reporting references' Copy Local to true the assemblies may not be loaded correctly on running the application.

1. Add references to the following Telerik Reporting assemblies (optional)               and set their __Copy Local__  properties to true in Visual Studio:             
   + Telerik.Reporting.Cache.Database.dll - only if  [DatabaseStorage](/reporting/api/Telerik.Reporting.Cache.Database.DatabaseStorage)  caching mechanism is intended.                   For more details check [Reporting REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).                   The assembly has dependencies on Telerik Data Access which can be checked in the version                   corresponding [Upgrade article]({%slug telerikreporting/upgrade/overview%});                 

   + Telerik.Reporting.OpenXmlRendering - depends on [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}). Required if you need to export in OpenXML formats (DOCX, PPTX, XLSX);                 

   + Telerik.Reporting.XpsRendering  - required if you need to export in XPS format;                 

   + Telerik.Reporting.Adomd.dll - required if you use [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) components in reports.                   The assembly has dependencies on *Microsoft.AnalysisServices.AdomdClient.dll*  v.10.0.0.0 or [above with proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%});                 

    >Without setting Telerik Reporting references' Copy Local to true the assemblies may not be loaded correctly on running the application.

1. Inherit this base class in your hosting application (usually in the Controllers folder of a MVC application).                 __ReportsControllerBase configuration in code:__ 
   + Set the  [ReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration)                    property. The __ReportSourceResolver__  and __Storage__  configuration settings are required.                   See the  [IReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.IReportServiceConfiguration)  interface                   for more details.                 

{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=ReportsControllerImplementation}}
  ````C#
using System.Web;
using Telerik.Reporting.Services;
using Telerik.Reporting.Services.WebApi;

public class ReportsController : ReportsControllerBase
{
    static readonly ReportServiceConfiguration configurationInstance =
        new ReportServiceConfiguration
        {
            HostAppId = "Application1",
            ReportSourceResolver = new UriReportSourceResolver(HttpContext.Current.Server.MapPath("~/Reports"))
                .AddFallbackResolver(new TypeReportSourceResolver()),
            Storage = new Telerik.Reporting.Cache.File.FileStorage(),
        };

    public ReportsController()
    {
        this.ReportServiceConfiguration = configurationInstance;
    }

    #region SendMailMessage_Implementation
    protected override HttpStatusCode SendMailMessage(MailMessage mailMessage)
    {
        using (var smtpClient = new SmtpClient("smtp.companyname.com", 25))
        {
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);
        }

        return HttpStatusCode.OK;
    }
````

{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=ReportsControllerImplementation}}
  ````VB
Imports System.Web
Imports Telerik.Reporting.Cache.Interfaces
Imports Telerik.Reporting.Services
Imports Telerik.Reporting.Services.WebApi
Imports System.Net
Imports System.Net.Mail

Public Class ReportsController
    Inherits ReportsControllerBase

    Shared ReadOnly configurationInstance As ReportServiceConfiguration

    Shared Sub New()

        Dim resolver = New UriReportSourceResolver(HttpContext.Current.Server.MapPath("~/Reports")) _
                       .AddFallbackResolver(New TypeReportSourceResolver())

        Dim reportServiceConfiguration As New ReportServiceConfiguration()
        reportServiceConfiguration.HostAppId = "Application1"
        reportServiceConfiguration.ReportSourceResolver = resolver
        reportServiceConfiguration.Storage = New Telerik.Reporting.Cache.File.FileStorage()
        configurationInstance = reportServiceConfiguration
    End Sub

    Public Sub New()
        Me.ReportServiceConfiguration = configurationInstance
    End Sub

    Protected Overrides Function CreateCache() As ICache
        Return Telerik.Reporting.Services.Engine.CacheFactory.CreateFileCache()
    End Function

    '#Region SendMailMessage_Implementation
    Protected Overrides Function SendMailMessage(ByVal mailMessage As MailMessage) As HttpStatusCode
        Using smtpClient = New SmtpClient("smtp.companyname.com", 25)
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network
            smtpClient.EnableSsl = True
            smtpClient.Send(mailMessage)
        End Using

        Return HttpStatusCode.OK
    End Function
````

 [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase)  inherits                    [System.Web.Http.ApiController](http://msdn.microsoft.com/en-us/library/system.web.http.apicontroller.aspx)                    and implements all necessary API actions.                 The provided sample implementation will resolve .trdx|.trdp report definitions from the Reports subfolder of the hosting ASP.NET application root.                   Other option is to reference a reports library and provide report                    [type assembly qualified name](http://msdn.microsoft.com/en-us/library/system.type.assemblyqualifiedname.aspx)                    from the service clients.                 

   >Do not forget to add all necessary (i.e., referred from the report definitions) connection strings to the application configuration file.                   

   >The above implementation uses the  [FileStorage](/reporting/api/Telerik.Reporting.Cache.File.FileStorage)                      method in order to create a storage object instance. All Visual Studio item templates for adding the Reporting REST service use the default                      __FileStorage__  constructor. The second overload of the FileStorage constructor allows you to                     specify a folder, and it is recommended for usage in production environment.                   
        __ReportsControllerBase configuration in configuration file:__ 
   + To configure the Telerik Reporting REST service from the application configuration file, set the value of the                    [ReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration)  property to an instance of the                    [ConfigSectionReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration)  class.                 

{{source=CodeSnippets\MvcCS\Controllers\ReportsControllerConfigSection.cs region=ReportsControllerConfigSectionImplementation}}
  ````C#
public class ReportsController : ReportsControllerBase
{
    static Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration configSectionConfigurationInstance =
        new Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration();

    public ReportsController()
    {
        this.ReportServiceConfiguration = configSectionConfigurationInstance;
    }
}
````

{{source=CodeSnippets\MvcVB\Controllers\ReportsControllerConfigSection.vb region=ReportsControllerConfigSectionImplementation}}
  ````VB
Public Class ReportsController
    Inherits ReportsControllerBase

    Shared configSectionConfigurationInstance As New Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration()

    Public Sub New()
        Me.ReportServiceConfiguration = configSectionConfigurationInstance
    End Sub
End Class
````

   + Then add the __restReportService__  configuration element containing the service settings to the                   [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}).                 

{{source=CodeSnippets\MvcCS\ReportServiceConfigurationSnippets\ConfigSectionConfiguration.xml}}
  ````XML
<Telerik.Reporting>
  <restReportService hostAppId="Application1" reportSharingTimeout="10" clientSessionTimeout="10">
    <reportResolver provider="type" />
    <storage provider="file" />
  </restReportService>
</Telerik.Reporting>
````

For more information see [restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%}).                 


