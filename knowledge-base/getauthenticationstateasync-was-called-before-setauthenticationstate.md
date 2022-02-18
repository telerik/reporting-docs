---
title: GetAuthenticationStateAsync was called before SetAuthenticationState
description: Such an error might occur 
type: troubleshooting
page_title: GetAuthenticationStateAsync was called before SetAuthenticationState
slug: getauthenticationstateasync-was-called-before-setauthenticationstate
position: 
tags: 
ticketid: 1487514
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

Error 'GetAuthenticationStateAsync was called before SetAuthenticationState.' is thrown in a [Custom Report Source Resolver](../reporting/telerik-reporting-rest-custom-report-resolver) that uses **GetAuthenticationStateAsync**.

## Error Message
GetAuthenticationStateAsync was called before SetAuthenticationState.

## Cause\Possible Cause(s)
The Telerik Reporting REST Service is recommended to be in a Singleton scope. However, the AuthenticationProvider requires utilizing the Scoped option. You can find more information in [Accessing an authenticated user outside of a view in Blazor](https://stackoverflow.com/questions/59744356/accessinging-an-authenticated-user-outside-of-a-view-in-blazor) Stack Overflow thread.

## Solution
We support accessing the current user inside the CustomReportSourceResolver using our own mechanism as described in [ASP.NET Core. How to use information from HttpContext in Custom Report Resolver](./core-how-to-pass-information-from-httpcontext-to-reporting-engine). The correct user and claims are passed to the GetIdentity() method. Although that not all dependencies are passed using dependency injection, note that this is only a proof that the approach works. 
