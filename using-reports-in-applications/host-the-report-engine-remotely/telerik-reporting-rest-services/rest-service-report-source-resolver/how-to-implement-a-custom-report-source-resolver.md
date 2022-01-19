---
title: How to Implement a Custom Report Source Resolver
page_title: How to Implement a Custom Report Source Resolver | for Telerik Reporting Documentation
description: How to Implement a Custom Report Source Resolver
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver
tags: how,to,implement,a,custom,report,source,resolver
published: True
position: 1
---

# How to Implement a Custom Report Source Resolver



This article explains how to create a custom report source resolver for the __Telerik Reporting REST service__.         In this example, the resolver purpose will be to return a  [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource)  with an XML         report definition obtained from an SQL Server database.       

## How to implement a custom report source resolver:

1. Create a class which implements the  [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver)                interface. Its  [Resolve](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver#Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary{System_String_System_Object}_)                 method will be called whenever the engine needs to create a                [ReportSource](/reporting/api/Telerik.Reporting.ReportSource)  instance based on the parameter named *report*.               The value of the *report* parameter will be initialized with the value of the __Report__ property of the report viewer's ReportSource object.             

{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_Implementation}}
````C#
class CustomReportSourceResolver : IReportSourceResolver
{
    public Telerik.Reporting.ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
    {
        var cmdText = "SELECT Definition FROM Reports WHERE ID = @ReportId";

        var reportXml = string.Empty;
        using (var conn = new System.Data.SqlClient.SqlConnection(@"server=(local)\sqlexpress;database=REPORTS;integrated security=true;"))
        {
            var command = new System.Data.SqlClient.SqlCommand(cmdText, conn);
            command.Parameters.Add("@ReportId", System.Data.SqlDbType.Int);
            command.Parameters["@ReportId"].Value = reportId;

            try
            {
                conn.Open();
                reportXml = (string)command.ExecuteScalar();
            }
            catch (System.Exception ex)
            {
                System.Diagnostics.Trace.WriteLine(ex.Message);
            }
        }

        if (string.IsNullOrEmpty(reportXml))
        {
            throw new System.Exception("Unable to load a report with the specified ID: " + reportId);
        }

        return new Telerik.Reporting.XmlReportSource { Xml = reportXml };
    }
}
````
{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_Implementation}}
````VB
Class CustomReportSourceResolver
    Implements IReportSourceResolver
    Public Function Resolve(reportId As String, operationOrigin As OperationOrigin, currentParameterValues As IDictionary(Of String, Object)) As Telerik.Reporting.ReportSource Implements Telerik.Reporting.Services.IReportSourceResolver.Resolve
        Dim cmdText = "SELECT Definition FROM Reports WHERE ID = @ReportId"

        Dim reportXml = ""
        Using conn = New System.Data.SqlClient.SqlConnection("server=(local)\sqlexpress;database=REPORTS;integrated security=true;")
            Dim command = New System.Data.SqlClient.SqlCommand(cmdText, conn)
            command.Parameters.Add("@ReportId", System.Data.SqlDbType.Int)
            command.Parameters("@ReportId").Value = reportId

            Try
                conn.Open()
                reportXml = DirectCast(command.ExecuteScalar(), String)
            Catch ex As System.Exception
                System.Diagnostics.Trace.WriteLine(ex.Message)
            End Try
        End Using

        If String.IsNullOrEmpty(reportXml) Then
            Throw New System.Exception(Convert.ToString("Unable to load a report with the specified ID: ") & reportId)
        End If

        Dim reportSource As New Telerik.Reporting.XmlReportSource()
        reportSource.Xml = reportXml
        Return reportSource
    End Function
End Class
````

1. Find the __ReportSourceResolver property__ in the  [ReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration)  settings of the               implementation of the  [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase)                class, and set it to an instance of the custom report source resolver or to a chain of resolver instances including the custom one:             

{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_ReportsController_Implementation}}
````C#
public class CustomResolverReportsController : ReportsControllerBase
{
    static ReportServiceConfiguration configurationInstance;

    static CustomResolverReportsController()
    {
        var resolver = new UriReportSourceResolver(HttpContext.Current.Server.MapPath("~/Reports"))
         .AddFallbackResolver(new TypeReportSourceResolver()
             .AddFallbackResolver(new CustomReportSourceResolver()));

        configurationInstance = new ReportServiceConfiguration
        {
            HostAppId = "Application1",
            ReportSourceResolver = resolver,
            Storage = new Telerik.Reporting.Cache.File.FileStorage(),
        };
    }

    public CustomResolverReportsController()
    {
        this.ReportServiceConfiguration = configurationInstance;
    }
}
````
{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_ReportsController_Implementation}}
````VB
Public Class CustomResolverReportsController
    Inherits Telerik.Reporting.Services.WebApi.ReportsControllerBase

    Shared configurationInstance As ReportServiceConfiguration

    Shared Sub New()
        Dim resolver = New UriReportSourceResolver(HttpContext.Current.Server.MapPath("~/Reports")) _
                    .AddFallbackResolver(New TypeReportSourceResolver() _
                                         .AddFallbackResolver(New CustomReportSourceResolver()))

        Dim reportServiceConfiguration As New ReportServiceConfiguration()
        reportServiceConfiguration.HostAppId = "Application1"
        reportServiceConfiguration.ReportSourceResolver = resolver
        reportServiceConfiguration.Storage = New Telerik.Reporting.Cache.File.FileStorage()
        configurationInstance = reportServiceConfiguration
    End Sub

    Public Sub New()
        Me.ReportServiceConfiguration = configurationInstance
    End Sub
End Class
````

1. Request the report from the HTML5 Report Viewer on the client:

    
    ````JavaScript
<script type="text/javascript">
    $(document).ready(function () {
            $("#reportViewer1").telerik_ReportViewer({
                serviceUrl: "api/reports/",
                reportSource: { report: 1 }
        });
    });
</script>
````

    where x.x.x.x is the version of the HTML5 ReportViewer/Telerik Reporting (e.g. 8.1.14.618).

1. To create the database use the following script:

    
    ````SQL
USE [master]
GO
CREATE DATABASE [Reports]
CONTAINMENT = NONE
ON  PRIMARY
(NAME = N'Reports', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Reports.mdf', SIZE = 4096KB ,

MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB)
LOG ON
(NAME = N'Reports_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Reports_log.ldf', SIZE = 1024KB

, MAXSIZE = 2048GB, FILEGROWTH = 10%)
GO
USE [Reports]
GO
CREATE TABLE [dbo].[Reports](
[ID] [int] NOT NULL,
[Definition] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
````


1. To enter some data into the database you can manually edit the __Reports__ table.               XML report definitions can be obtained from the sample __.trdx__ report files installed               together with the product and are located in               __[Telerik_Reporting_Install_Dir]\Report Designer\Examples__.                 In newer versions, all sample reports of the Standalone Report Designer are in TRDP format. You can use the              *Standalone Report Designer - File - Save As* option to convert them to TRDX files.             

## How to implement and use custom IReportSourceResolver with fallback mechanism:

1. Add to your IReportSourceResolver implementation a constructor with parameter IReportSourceResolver parentResolver.               Then use the parentResolver if the custom report source resolving mechanism fails.             

{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportSourceResolverFallBack_Implementation}}
````C#
class CustomReportSourceResolverWithFallBack : IReportSourceResolver
{
    readonly IReportSourceResolver parentResolver;

    public CustomReportSourceResolverWithFallBack(IReportSourceResolver parentResolver)
    {
        this.parentResolver = parentResolver;
    }

    public ReportSource Resolve(string report, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
    {
        ReportSource reportDocument = null;
        reportDocument = this.ResolveCustomReportSource(report, operationOrigin, currentParameterValues);

        if (null == reportDocument && null != this.parentResolver)
        {
            reportDocument = this.parentResolver.Resolve(report, operationOrigin, currentParameterValues);
        }

        return reportDocument;
    }

    public ReportSource ResolveCustomReportSource(string report, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
    {
        //TODO implement custom report resolving mechanism
        return null;
    }
}
````
{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportSourceResolverFallBack_Implementation}}
````VB
Class CustomReportSourceResolverWithFallBack
    Implements IReportSourceResolver
    ReadOnly parentResolver As IReportSourceResolver

    Public Sub New(parentResolver As IReportSourceResolver)
        Me.parentResolver = parentResolver
    End Sub

    Public Function Resolve(report As String, operationOrigin As OperationOrigin, currentParameterValues As IDictionary(Of String, Object)) As Telerik.Reporting.ReportSource Implements IReportSourceResolver.Resolve
        Dim reportDocument As IReportDocument = Nothing
        reportDocument = Me.ResolveCustomReportSource(report, operationOrigin, currentParameterValues)

        If reportDocument Is Nothing AndAlso Me.parentResolver IsNot Nothing Then
            reportDocument = Me.parentResolver.Resolve(report, operationOrigin, currentParameterValues)
        End If

        Return reportDocument
    End Function

    Public Function ResolveCustomReportSource(report As String, operationOrigin As OperationOrigin, currentParameterValues As IDictionary(Of String, Object)) As ReportSource
        'TODO implement custom report resolving mechanism
        Return Nothing
    End Function
End Class
````

1. Add to the ReportServiceConfiguration the IReportSourceResolver implementations in a chain. Thus the custom one will be executed               first, if it fails the second one and so on.             

{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomResolverWithFallback_ReportsController_Implementation}}
````C#
public class CustomResolverWithFallbackReportsController : ReportsControllerBase
{
    static ReportServiceConfiguration configurationInstance;

    static CustomResolverWithFallbackReportsController()
    {
        var resolver = new CustomReportSourceResolverWithFallBack(new TypeReportSourceResolver()
             .AddFallbackResolver(new UriReportSourceResolver(HttpContext.Current.Server.MapPath("~/Reports"))));

        configurationInstance = new ReportServiceConfiguration
        {
            HostAppId = "Application1",
            ReportSourceResolver = resolver,
            Storage = new Telerik.Reporting.Cache.File.FileStorage(),
        };
    }

    public CustomResolverWithFallbackReportsController()
    {
        this.ReportServiceConfiguration = configurationInstance;
    }
}
````
{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomResolverWithFallback_ReportsController_Implementation}}
````VB
Public Class CustomResolverWithFallbackReportsController
    Inherits Telerik.Reporting.Services.WebApi.ReportsControllerBase

    Shared configurationInstance As ReportServiceConfiguration

    Shared Sub New()
        Dim resolver = New CustomReportSourceResolverWithFallBack(New TypeReportSourceResolver() _
             .AddFallbackResolver(New UriReportSourceResolver(HttpContext.Current.Server.MapPath("~/Reports"))))

        Dim reportServiceConfiguration As New ReportServiceConfiguration()
        reportServiceConfiguration.HostAppId = "Application1"
        reportServiceConfiguration.ReportSourceResolver = resolver
        reportServiceConfiguration.Storage = New Telerik.Reporting.Cache.File.FileStorage()
        configurationInstance = reportServiceConfiguration
    End Sub

    Public Sub New()
        Me.ReportServiceConfiguration = configurationInstance
    End Sub
End Class
````

    You can use for fallback the default IReportSourceResolver implementations:             
   + TypeReportSourceResolver - Resolves IReportDocument from assembly qualified name

   + UriReportSourceResolver - Resolves IReportDocument from physical path to trdp or trdx file


