---
title: Multiple actions were found that match the request
description: "Learn how to fix the error about multiple actions matching the same request caused by the greedy routes of the Reporting service."
type: troubleshooting
page_title: Multiple actions were found that match the request
slug: resolve-reporting-rest-service-access-issues
tags: telerik, reporting, rest, service, access, error, upgrade, cors
res_type: kb
ticketid: 1655171
---

## Environment

| Product | Progress® Telerik® Reporting |
| --- | --- |
| Project Type | ASP.NET Framework |

## Description

After implementing the [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in an ASP.NET Framework application - [Telerik Reporting REST Service ASP.NET Web API Implementation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview%}), when the application starts, the error page is displayed with details about a problem with the [ReportsController](/api/telerik.reporting.services.webapi.reportscontrollerbase).

## Error Message

````HTML
<Error>
    <Message>An error has occurred.</Message>
    <ExceptionMessage>Multiple actions were found that match the request: Formats on type Controllers.ReportsController GetClientsSessionTimeoutSeconds on type Controllers.ReportsController Version on type     Controllers.ReportsController</ExceptionMessage>
    <ExceptionType>System.InvalidOperationException</ExceptionType>
    <StackTrace> at System.Web.Http.Controllers.ApiControllerActionSelector.ActionSelectorCacheItem.SelectAction(HttpControllerContext controllerContext) at System.Web.Http.ApiController.ExecuteAsync(HttpControllerContext controllerContext, CancellationToken cancellationToken) at System.Web.Http.Dispatcher.HttpControllerDispatcher.<SendAsync>d__1.MoveNext()</StackTrace>
</Error>
````

## Cause

The issue is likely caused by a greedy route in the route configuration, which interferes with the proper registration and functioning of the Reporting REST service routes. This can occur when the reporting routes are not prioritized in the route registration order.

## Solution

To resolve this issue, ensure that the reporting routes are registered before the default ones. This action gives them priority and prevents them from being overridden by other more general routes. Use the following steps:

1. Register the reporting routes before any default or other custom routes in your Web API configuration:

    ````CSharp
    Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(config);

    config.Routes.MapHttpRoute(
        name: "DefaultApi",
        routeTemplate: "api/{controller}/{action}/{id}",
        defaults: new { id = RouteParameter.Optional }
    );
````


1. Verify that the [`routeTemplate`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.routing.template.routetemplate?view=aspnetcore-8.0) includes the `{action}` part. Omitting this can cause issues due to multiple actions matching the same route template.

## See Also

- [Hosting Telerik Reporting REST Service in ASP.NET]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%})
- [Multiple actions were found that match the request in Web API - Stack Overflow](https://stackoverflow.com/questions/14534167/multiple-actions-were-found-that-match-the-request-in-web-api)
