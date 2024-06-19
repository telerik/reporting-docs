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
| Version | 18.1.24.514 |

## Description

After upgrading Telerik Reporting to a newer version, attempting to open a report results in an error indicating that the Reporting REST service cannot be accessed. The error message suggests verifying the service URL and enabling CORS if necessary. Additionally, navigating to `/api/reports/formats` produces an error due to multiple actions matching the request.

## Error Message

```
Cannot access the Reporting REST service. (serviceUrl = '/api/reports/'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)
```

```
<Error>
<Message>An error has occurred.</Message>
<ExceptionMessage>Multiple actions were found that match the request: Formats on type SmartBiz.Controllers.ReportsController GetClientsSessionTimeoutSeconds on type SmartBiz.Controllers.ReportsController Version on type SmartBiz.Controllers.ReportsController</ExceptionMessage>
<ExceptionType>System.InvalidOperationException</ExceptionType>
<StackTrace> at System.Web.Http.Controllers.ApiControllerActionSelector.ActionSelectorCacheItem.SelectAction(HttpControllerContext controllerContext) at System.Web.Http.ApiController.ExecuteAsync(HttpControllerContext controllerContext, CancellationToken cancellationToken) at System.Web.Http.Dispatcher.HttpControllerDispatcher.<SendAsync>d__1.MoveNext()</StackTrace>
</Error>
```

## Cause

The issue is likely caused by a greedy route in the route configuration, which interferes with the proper registration and functioning of the Reporting REST service routes. This can occur when the reporting routes are not prioritized in the route registration order.

## Solution

To resolve this issue, ensure that the reporting routes are registered before the default ones. This action gives them priority and prevents them from being overridden by other more general routes. Use the following steps:

1. Register the reporting routes before any default or other custom routes in your Web API configuration.

    ```csharp
    Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(config);

    config.Routes.MapHttpRoute(
        name: "DefaultApi",
        routeTemplate: "api/{controller}/{action}/{id}",
        defaults: new { id = RouteParameter.Optional }
    );
    ```

2. Ensure that the `ReportsControllerConfiguration.RegisterRoutes(HttpConfiguration)` method is invoked correctly in your project. This step is crucial for setting up the routes for the Reports controller. Avoid manually configuring these routes.

3. Verify that the route template includes the `{action}` part. Omitting this can cause issues due to multiple actions matching the same route template.

Following these recommendations should resolve the access issues to the Reporting REST service after upgrading Telerik Reporting.

## See Also

- [Telerik Reporting - REST Service](https://docs.telerik.com/reporting/t-telerik-reporting-services-webapi-reportscontrollerconfiguration-registerroutes)
- [Enable CORS](https://enable-cors.org/)
- [Multiple actions were found that match the request in Web API - Stack Overflow](https://stackoverflow.com/questions/14534167/multiple-actions-were-found-that-match-the-request-in-web-api)
