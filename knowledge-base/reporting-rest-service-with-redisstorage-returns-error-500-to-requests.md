---
title: Reporting REST service with RedisStorage returns error 500 to requests
description: Reporting REST service with RedisStorage returns error 500 to requests. 
type: how-to
page_title: Reporting REST service with RedisStorage returns error 500 to requests
slug: reporting-rest-service-with-redisstorage-returns-error-500-to-requests
res_type: kb
---  

## Description
Reporting REST service with RedisStorage returns error 500. As a result on cache entries are recorded in the Redis instance.  
  

## Solution   
  
 Details how to configure the RedisStorage are available in [How to: Use Redis storage](../telerik-reporting-rest-howto-use-redis-storage).   

 Note that the Redis storage requires *StackExchange.Redis.StrongName.dll*,and *Telerik.Reporting.Cache.StackExchangeRedis.dll* built against *StackExchange.Redis.StrongName.dll v1.0.316.0*.   
 If you use a newer version of S*tackExchange.Redis.StrongName.dll*, you will need a [binding redirect](https://msdn.microsoft.com/en-us/library/eftw1fys%28v=vs.110%29.aspx) for the assembly in the Reporting REST service project's configuration file.  
  
  
 Another reason can be a connectivity issue. Test connecting to the Redis instance in code to verify the connection string and that the Redis instance is running and accessible.  
  
 The Reporting REST service's configuration in code would look like:  

````cs
public class ReportsController : ReportsControllerBase
    {
        static ReportServiceConfiguration configurationInstance;
  
        static ReportsController()
        {
            //This is the folder that contains the XML (trdx/trdp) report definitions
            //In this case this is the Reports folder
            var appPath = HttpContext.Current.Server.MapPath("~/");
            var reportsPath = Path.Combine(appPath, "Reports");
  
            //Add resolver for trdx report definitions,
            //then add resolver for class report definitions as fallback resolver;
            //finally create the resolver and use it in the ReportServiceConfiguration instance.
            var resolver = new ReportFileResolver(reportsPath).AddFallbackResolver(new ReportTypeResolver());
  
            //Setup the ReportServiceConfiguration      
            configurationInstance = new ReportServiceConfiguration
            {
                HostAppId = "Html5App",
                Storage = new RedisStorage(ConnectionMultiplexer.Connect("RedisConnectionStringHERE")),           
                ReportResolver = resolver,
                // ReportSharingTimeout = 0,
                // ClientSessionTimeout = 15,
            };
        }
  
        public ReportsController()
        {
            //Initialize the service configuration
            this.ReportServiceConfiguration = configurationInstance;
        }  
    }
````
````vb
Public Class ReportsController
    Inherits ReportsControllerBase
    Shared configurationInstance As ReportServiceConfiguration
 
    Shared Sub New()
        'This is the folder that contains the XML (trdx/trdp) report definitions
        'In this case this is the Reports folder
        Dim appPath = HttpContext.Current.Server.MapPath("~/")
        Dim reportsPath = Path.Combine(appPath, "Reports")
 
        'Add resolver for trdx report definitions,
        'then add resolver for class report definitions as fallback resolver;
        'finally create the resolver and use it in the ReportServiceConfiguration instance.
        Dim resolver = New ReportFileResolver(reportsPath).AddFallbackResolver(New ReportTypeResolver())
 
        'Setup the ReportServiceConfiguration      
            ' ReportSharingTimeout = 0,
            ' ClientSessionTimeout = 15,
        configurationInstance = New ReportServiceConfiguration() With { _
            Key .HostAppId = "Html5App", _
            Key .Storage = New RedisStorage(ConnectionMultiplexer.Connect("RedisConnectionStringHERE")), _
            Key .ReportResolver = resolver _
        }
    End Sub
 
    Public Sub New()
        'Initialize the service configuration
        Me.ReportServiceConfiguration = configurationInstance
    End Sub
End Class
````

