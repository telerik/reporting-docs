---
title: How to setup authorization in REST Service controller
description: How to setup authorization in REST Service controller
type: how-to
page_title: How to setup authorization in REST Service controller
slug: reporting-rest-service-authorization
position: 
tags: RESTService,Viewers
ticketid:
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

On attempt to add `[Authorize]` attribute above the ReportsController class, the report viewer no longer displays.

## Solution

By design, the ReportsController methods are internally authorized except the requests for available document formats ([GET /api/reports/formats]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%})) and for resources. The formats request is used only for test purposes and all resources are generated with unique random IDs. 

When authorization attribute is set to the entire ReportsController, the methods not requiring authentication by default will be overridden and would require authorization token that is *not* sent by the viewer when requesting formats or resources.

Thus, we can suggest two possible approaches: 

1. Set the authorize attribute for the ReportsController methods - [REST service methods]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%}), instead of the whole class. These methods are virtual and you can override them like the following:

	For ASP.NET Core

	````CSharp
[RESTAuthorize]
        public override IActionResult CreateDocument(string clientID, string instanceID, [FromBody] CreateDocumentArgs args)
        {
            return base.CreateDocument(clientID, instanceID, args);
        }
````

	For ASP.NET Framework

	````CSharp
[RESTAuthorize]
        public override HttpResponseMessage CreateDocument(string clientID, string instanceID, CreateDocumentArgs args)
        {
            return base.CreateDocument(clientID, instanceID, args);
        }
````


2. It would be also possible to introduce some custom logic that adds the appropriate header (Token) to the requests for formats and resources. For example, the [jQuery ajaxPrefilter](http://api.jquery.com/jquery.ajaxprefilter/) event to add the appropriate header ([Add custom auth headers to html reportviewer](https://www.telerik.com/forums/add-custom-auth-headers-to-html-reportviewer-0aafdd471455)).


## Notes

How to use the authorize attribute is not related to Telerik Reporting directly. Please refer to the [Token-Based Authentication for Web Service APIs in C# MVC .NET](http://www.primaryobjects.com/2015/05/08/token-based-authentication-for-web-service-apis-in-c-mvc-net/) article that gives additional information on how to implement the validation process.
