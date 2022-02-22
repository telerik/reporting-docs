---
title: How to Implement and use custom IReportResolver
page_title: How to Implement and use custom IReportResolver 
description: How to Implement and use custom IReportResolver
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-implement-and-use-custom-ireportresolver
tags: how,to,implement,and,use,custom,ireportresolver
published: True
position: 4
---

# How to Implement and use custom IReportResolver



The client programs invoke the report rendering from the service using a string report description. Based on the report description the service’s report resolvers try to create an IReportDocument instance needed by the ReportProcessor.       

The IReportDocument interface represents a report document. This includes a single Report or ReportBook. The IReportDocument returned by the report resolver will be further handled by the ReportProcessor.       

The service includes default report resolvers that are capable to resolve IReportDocument from relative and physical path that points to trdp or trdx file (report definition serialized in XML) or from assembly qualified name. This way we cover most of the scenarios. However if you have requirements that are not covered by the default report resolvers, such as retrieving report definitions stored in database or building a report book based on the report description, you can plug into the Telerik Reporting Service report resolving workflow.       

The report resolvers implement the IReportResolver interface. This interface has only one method Resolve with a string argument - the report description. In custom resolver implementations you should use that description as you like in order to map it to IReportDocument instance.       

If you use the Silverlight report viewer the report description is provided by the __ReportViewer.Report property__.       

## Extending Telerik Reporting WCF service with custom IReportResolver implementation:

1. 

###                Prerequisites:
              

* Web application                     

* Reference to System.ServiceModel.dll assembly                     

* Reference to Telerik.Reporting.Service.dll assembly                     

* Telerik Reports definitions to be exposed through the Reporting Service                     

1. 

###                Steps to implement and use custom IReportResolver:
              

1. Implement the Telerik.Reporting.Service.IReportResolver                     

{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.cs region=ReportResolverBasic}}
````C#
class ReportResolver : IReportResolver
{
    public ReportSource Resolve(string report)
    {
        //TODO implement custom report resolving mechanism
        throw new NotImplementedException();
    }
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.vb region=ReportResolverBasic}}
````VB
Class ReportResolver
    Implements IReportResolver
    Public Function Resolve(report As String) As ReportSource Implements IReportResolver.Resolve
        'TODO implement custom report resolving mechanism
        Throw New NotImplementedException()
    End Function
End Class
````

1. In order to utilize your IReportResolver implementation, create a Telerik.Reporting.Service subclass and in your subclass constructor pass your IReportResolver implementation to the Telerik.Reporting.ServiceBase.ReportResolver property:                     

{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.cs region=ReportServiceReportResolverBasic}}
````C#
class CustomReportService : ReportService
{
    static readonly IReportResolver resolver = new ReportResolver();

    public CustomReportService()
    {
        this.ReportResolver = resolver;
    }
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.vb region=ReportServiceReportResolverBasic}}
````VB
Class CustomReportService
    Inherits ReportService
    Shared ReadOnly resolver As IReportResolver = New ReportResolver()

    Public Sub New()
        Me.ReportResolver = resolver
    End Sub
End Class
````

1. Even if you use your own IReportResolver implementation you can still fallback to the default IReportResolver implementations as shown in the following walkthrough.             

###                Steps to implement and use custom IReportResolver with fallback mechanism:
              

1. Add to your IReportResolver implementation a constructor with parameter IReportDocument parentResolver. Then use the parentResolver if the custom report resolving mechanism fails.                     

{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.cs region=ReportResolverWithFallBack}}
````C#
class ReportResolverWithFallBack : IReportResolver
{
    readonly IReportResolver parentResolver;

    public ReportResolverWithFallBack(IReportResolver parentResolver)
    {
        this.parentResolver = parentResolver;
    }

    public ReportSource Resolve(string report)
    {
        ReportSource reportDocument = null;
        reportDocument = this.CustomReportResolver(report);

        if (null == reportDocument && null != this.parentResolver)
        {
            reportDocument = this.parentResolver.Resolve(report);
        }

        return reportDocument;
    }

    public ReportSource CustomReportResolver(string report)
    {
        //TODO implement custom report resolving mechanism
        return null;
    }
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.vb region=ReportResolverWithFallBack}}
````VB
Class ReportResolverWithFallBack
    Implements IReportResolver
    ReadOnly parentResolver As IReportResolver

    Public Sub New(parentResolver As IReportResolver)
        Me.parentResolver = parentResolver
    End Sub

    Public Function Resolve(report As String) As ReportSource Implements IReportResolver.Resolve
        Dim reportDocument As IReportDocument = Nothing
        reportDocument = Me.CustomReportResolver(report)

        If reportDocument Is Nothing AndAlso Me.parentResolver IsNot Nothing Then
            reportDocument = Me.parentResolver.Resolve(report)
        End If

        Return reportDocument
    End Function

    Public Function CustomReportResolver(report As String) As ReportSource
        'TODO implement custom report resolving mechanism
        Return Nothing
    End Function
End Class
````

1. Add to Telerik.Reporting.Service subclass the IReportResolver implementations in a chain. Thus the custom one will be executed first, if it fails the second one and so on.                     

{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.cs region=ReportServiceReportResolverWithFallBack}}
````C#
class ReportServiceWithResolverFallback : ReportService
{
    static readonly IReportResolver resolvers = new ReportResolverWithFallBack(
                                                  new ReportTypeResolver(
                                                   new ReportFileResolverWeb(null)));
    public ReportServiceWithResolverFallback()
    {
        this.ReportResolver = resolvers;
    }
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.vb region=ReportServiceReportResolverWithFallBack}}
````VB
Class ReportServiceWithResolverFallback
    Inherits ReportService
    Shared ReadOnly resolvers As IReportResolver = New ReportResolverWithFallBack(New ReportTypeResolver(New ReportFileResolverWeb(Nothing)))
    Public Sub New()
        Me.ReportResolver = resolvers
    End Sub
End Class
````

    You can use for fallback the default IReportResolver implementations:                     
   + ReportTypeResolver - Resolves IReportDocument from assembly qualified name

   + ReportFileResolver - Resolves IReportDocument from physical path to trdp or trdx file

   + ReportFileResolverWeb - Resolves IReportDocument from a relative path to trdp or trdx file


1. 

###Hosting Telerik.Reporting.Service.ReportService subclass in IIS.

1. Add.svc file (e.g. ReportService.svc) to reference your Telerik.Reporting.Service.ReportService subclass. The file would contain the following line only:                     

    
    ````XML
<%@ServiceHost Service="CSharp.SilverlightDemo.Web.CustomReportService, CSharp.SilverlightDemo.Web" %>
````

1. Register the Reporting Service endpoints with service name your Telerik.Reporting.Service.ReportService subclass  in the web.config:                     

{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\HostedSubclassService.xml}}
````C#
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
    <system.serviceModel>
        <services>
            <service name="CSharp.SilverlightDemo.Web.CustomReportService"
                     behaviorConfiguration="ReportServiceBehavior">
                <endpoint
                       address=""
                       binding="basicHttpBinding"
                       contract="Telerik.Reporting.Service.IReportService">
                    <identity>
                        <dns value="localhost" />
                    </identity>
                </endpoint>
                <endpoint
                        address="resources"
                        binding="webHttpBinding"
                        behaviorConfiguration="WebBehavior"
                        contract="Telerik.Reporting.Service.IResourceService"/>
                <endpoint
                        address="mex"
                        binding="mexHttpBinding"
                        contract="IMetadataExchange" />
            </service>
        </services>
        <behaviors>
            <serviceBehaviors>
                <behavior name="ReportServiceBehavior">
                    <serviceMetadata httpGetEnabled="true" />
                    <serviceDebug includeExceptionDetailInFaults="false" />
                </behavior>
            </serviceBehaviors>
            <endpointBehaviors>
                <behavior name="WebBehavior">
                    <webHttp />
                </behavior>
            </endpointBehaviors>
        </behaviors>
    </system.serviceModel>
</configuration>
````

The custom resolver's Resolve method is called on each interaction with the report in the Silverlight ReportViewer e.g.,             changing report parameters' values or hitting refresh. To avoid unexpected results the recommended             [report sources]({%slug telerikreporting/designing-reports/report-sources/overview%}) to work with are __UriReportSource__           and __TypeReportSource__.           



