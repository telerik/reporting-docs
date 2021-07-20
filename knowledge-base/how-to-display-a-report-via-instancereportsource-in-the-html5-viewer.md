---
title: How to display a report via InstanceReportSource in the HTML5 Viewer
description: How to display a report via InstanceReportSource in the HTML5 Viewer.
type: how-to
page_title: How to display a report via InstanceReportSource in the HTML5 Viewer
slug: how-to-display-a-report-via-instancereportsource-in-the-html5-viewer
res_type: kb
---

## Description

How to display a report via InstanceReportSource in the HTML5 Viewer.  
  
## Solution
   
The [HTML5 Viewer](../html5-report-viewer) and [Reporting REST service](../telerik-reporting-rest-conception) use client-server technology, different than the MVC model. Whole data objects cannot be sent in a request to the server. Even if the content is serialized, it may reach technology limitations in the size of requests. The HTML5 viewer sends short string  messages describing which report, what parameters and rendering format to be used on the server. Reports are processed and rendered on the server.  
  
 The available MVC and WebForms wrappers of the HTML5 Viewer let you specify which report to be displayed though the viewer's *ReportSource.Report*and *ReportSource.Parameters,* in code in a declarative manner.   

- When you use a client-side **TypeReportSource** (Report = *TypeReportSource.TypeName* and Parameters = *TypeReportSource.Parameters*). The type name is an [assembly qualified name](https://docs.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname) of a report class.
- When you use a client-side **UriReportSource** (Report = *UriReportSource.Uri* and Parameters=*UriReportSource.Parameters*). The URI is a relative path to a file on the server where the Reporting REST service is hosted. The relative  path is mapped to the folder specified by the service's [ReportFileResolver](../m-telerik-reporting-services-servicestack-reportfileresolver--ctor-1).

 The HTML5 Javascript widget lets you specify directly the *reportSource.report* as string, and the *reportSource.parameters* as key-value pairs.  
  
**Each HTML5 Viewer provides means to let you send a custom string and parameters collection, in case of using a [custom resolver](../telerik-reporting-rest-service-report-resolver) for the reporting rest service. Such resolver is required if you need to create/customize a report before displaying it.**  

**After creating/modifying the report on the server, you can return an [InstanceReportSource](../t-telerik-reporting-instancereportsource) instance from the resolver's [Resolve method](../m-telerik-reporting-services-ireportsourceresolver-resolve).**  
  
## See Also  

[How to Set ReportSource for Report Viewers.](../report-sources-viewers)

[How to Implement a Custom Report Source Resolver](../telerik-reporting-rest-custom-report-resolver)

