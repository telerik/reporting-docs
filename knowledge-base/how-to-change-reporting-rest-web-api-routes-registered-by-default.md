---
title: How to change the registered by default Telerik Reporting REST Web API routes
description: How to modify the registered by default Telerik Reporting REST Web API routes.
type: how-to
page_title: How to edit the registered by default Telerik Reporting REST Web API routes
slug: how-to-change-reporting-rest-web-api-routes-registered-by-default
res_type: kb
---

## Environment
 
<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>R3 SP1 2017 and later</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
    </tbody>
</table>
 
## Description   

In order to use the HTML5 Report Viewer, you need to have a running [Telerik Reporting REST service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}), where one of the possible implementations of the Reporting REST Service is Web API based. 
  
To ease the routes registering, there is the **ReportsControllerConfiguration.RegisterRoutes method**, which directly adds the required routes into the **GlobalConfiguration.Configuration**. The created routes follow a convention for [Routing in ASP.NET Web API](http://www.asp.net/web-api/overview/web-api-routing-and-actions/routing-in-aspnet-web-api "Routing in ASP.NET Web API") and their route templates contain "**api**" word to distinguish them from routes to custom controllers.  
  
 Since **Telerik Reporting** **R3 2017 SP1**, it is possible to change the first path segment included in the route template using the [ReportsControllerConfiguration.RegisterRoutes(HttpConfiguration, String)](../m-telerik-reporting-services-webapi-reportscontrollerconfiguration-registerroutes-1) method overload. 

For example, "*api*" is the default literal path segment in the "*api/{controller}*" route template. Use this overload and pass a unique path segment (e.g. "*reportingapi*") to avoid collisions with other Web API services.  
  
> If you are using a version of Telerik Reporting prior to R3 2017 SP1, the above method overload is not available and you will need to register the routes manually as you verify all needed routes are modified respectively.  
  
## Solution 
    
 The routes registered by default are as follows:  

```cs
config.Routes.MapHttpRoute(
    name: "Resources",
    routeTemplate: "api/{controller}/resources/{folder}/{resourceName}",
    defaults: new { action = "Resources" });
 
 
config.Routes.MapHttpRoute(
    name: "Clients",
    routeTemplate: "api/{controller}/clients/{clientID}",
    defaults: new { action = "Clients", clientID = RouteParameter.Optional });
 
config.Routes.MapHttpRoute(
    name: "Instances",
    routeTemplate: "api/{controller}/clients/{clientID}/instances/{instanceID}",
    defaults: new { action = "Instances", instanceID = RouteParameter.Optional });
 
config.Routes.MapHttpRoute(
    name: "DocumentResources",
    routeTemplate: "api/{controller}/clients/{clientID}/instances/{instanceID}/documents/{documentID}/resources/{resourceID}",
    defaults: new { action = "DocumentResources" });
 
config.Routes.MapHttpRoute(
    name: "DocumentActions",
    routeTemplate: "api/{controller}/clients/{clientID}/instances/{instanceID}/documents/{documentID}/actions/{actionID}",
    defaults: new { action = "DocumentActions" });
 
config.Routes.MapHttpRoute(
    name: "DocumentPages",
    routeTemplate: "api/{controller}/clients/{clientID}/instances/{instanceID}/documents/{documentID}/pages/{pageNumber}",
    defaults: new { action = "DocumentPages" });
 
config.Routes.MapHttpRoute(
    name: "DocumentInfo",
    routeTemplate: "api/{controller}/clients/{clientID}/instances/{instanceID}/documents/{documentID}/info",
    defaults: new { action = "DocumentInfo" });
 
config.Routes.MapHttpRoute(
    name: "Documents",
    routeTemplate: "api/{controller}/clients/{clientID}/instances/{instanceID}/documents/{documentID}",
    defaults: new { action = "Documents", documentID = RouteParameter.Optional });
 
config.Routes.MapHttpRoute(
    name: "Parameters",
    routeTemplate: "api/{controller}/clients/{clientID}/parameters",
    defaults: new { action = "Parameters" });
 
config.Routes.MapHttpRoute(
    name: "ApiDefault",
    routeTemplate: "api/{controller}/{action}");
```

## Notes

The actual routes for the used Telerik Reporting version can be extracted from the **GlobalConfiguration.Configuration** after using the **ReportsControllerConfiguration.RegisterRoutes** method.

### See Also

[How To: Add Telerik Reporting REST Web API to Web Application](../telerik-reporting-rest-host-http-service-using-web-hosting)
