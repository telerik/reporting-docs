---
title: Authorization in REST Service Controller
description: "Learn the recommended approaches for setting up authorization in Telerik Reporting REST Service controller."
type: how-to
page_title: Setting up authorization in Reporting REST Service controller
slug: reporting-rest-service-authorization
tags: RESTService,Viewers
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

On an attempt to add the `[Authorize]` attribute above the ReportsController class, the report viewer no longer displays.

## Solution

By design, the ReportsController methods for the resources are marked with the `[AllowAnonymous]` attribute _(i.e. they do not require authorization)_. The resource requests are left unauthorized because they are made by the browser and an authentication token for them cannot be sent by the viewers. However, all resources are generated with unique random IDs that cannot be guessed directly.

When the authorization attribute is set to the entire ReportsController, the methods not requiring authentication by default will be overridden and will require an authorization token that is not sent by the viewer when requesting formats or resources.

Thus, we can suggest two possible approaches:

1. Set the authorize attribute for the ReportsController methods - [REST service methods]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%}), instead of the whole class. These methods are virtual and you can override them like the following:

	For __ASP.NET Core__

	````CSharp
[RESTAuthorize]
	public override IActionResult CreateDocument(string clientID, string instanceID, [FromBody] CreateDocumentArgs args)
	{
		return base.CreateDocument(clientID, instanceID, args);
	}
````

	For __ASP.NET__

	````CSharp
[RESTAuthorize]
	public override HttpResponseMessage CreateDocument(string clientID, string instanceID, CreateDocumentArgs args)
	{
		return base.CreateDocument(clientID, instanceID, args);
	}
````


1. It would be also possible to introduce some custom logic that adds the appropriate header (Token) to the requests for formats and resources. For example, the [jQuery ajaxPrefilter](http://api.jquery.com/jquery.ajaxprefilter/) event to add the appropriate header - [Add custom auth headers to html reportviewer](https://www.telerik.com/forums/add-custom-auth-headers-to-html-reportviewer-0aafdd471455).

## Notes

How to use the authorize attribute is not related to Telerik Reporting directly. Please refer to the [Token-Based Authentication for Web Service APIs in C# MVC .NET](https://www.primaryobjects.com/2015/05/08/token-based-authentication-for-web-service-apis-in-c-mvc-net/) article that gives additional information on how to implement the validation process.

## See Also

* [Request to '/api/reports/.../{documentId}' Is Not Authorized]({%slug why-get-document-request-is-unauthorized%})
