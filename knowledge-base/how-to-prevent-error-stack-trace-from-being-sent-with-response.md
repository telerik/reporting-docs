---
title: How to prevent Internal Server Error Stack Trace from being sent with the HTTP Response
description: When ReportsController throws an uncaught exception the Stack trace is translated into the HTTP response (status code 500)
type: how-to
page_title: Catch ReportsController errors to suppress Stack Trace in response
slug: how-to-prevent-error-stack-trace-from-being-sent-with-response
position: 
tags: 
ticketid: 1365292
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
In some cases it is considered a security issue when through API calls to the REST service, it is possible to view Internal Server Errors Stack Traces in the HTTP response.

By default when a Web API controller throws an uncaught exception the Stack trace is translated into an HTTP response with status code 500, Internal Server Error - [Exception Handling in ASP.NET Web API](https://docs.microsoft.com/en-us/aspnet/web-api/overview/error-handling/exception-handling). 
Therefore, the Stack trace of any server side error will be passed with the response.
We have left the default exception-related behavior of our _ReportsController_ for debugging purposes.

## Solution
If necessary, the exceptions can be removed from the response.
For example, you may customize the way the Web API handles exceptions by creating an [exception filter](https://docs.microsoft.com/en-us/aspnet/web-api/overview/error-handling/exception-handling#exception-filters) and applying it to the _ReportsController_.  
  
Alternatively, you may consider overriding the public methods of the _ReportsController_ and catch and handle the exceptions there - check [ReportsControllerBase Methods](/api/telerik.reporting.services.webapi.reportscontrollerbase.html). For example, the implementation of _RegisterClient_ method may look like :  
  
```CSharp
public override HttpResponseMessage RegisterClient()
{
    try
    {
        return base.RegisterClient();
    }
    catch (System.Exception)
    {
        return new HttpResponseMessage(HttpStatusCode.NotImplemented);
    }
}
```
