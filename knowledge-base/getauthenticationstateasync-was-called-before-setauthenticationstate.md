---
title: GetAuthenticationStateAsync was called before SetAuthenticationState
description: Such an error might occur when you try to authenticate the REST service 
type: troubleshooting
page_title: GetAuthenticationStateAsync was Called before SetAuthenticationState
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
We support accessing the current user inside the CustomReportSourceResolver using our own mechanism as described in [ASP.NET Core. How to use information from HttpContext in Custom Report Resolver](./core-how-to-pass-information-from-httpcontext-to-reporting-engine). For example:

````Csharp
public class CustomReportSourceResolver : IReportSourceResolver
{
      public Telerik.Reporting.ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
	{
		 var userClass = new ServiceClass(UserIdentity.Current);
	 if (!string.IsNullOrEmpty(report))
	 {
	     using var context = new DataContext(userClass);
	     report = (from table in context.Reports where table.Name == report select table.Definition).First();
	 }
	 ReportSource updatedReport;
	 if (string.IsNullOrEmpty(report))
	 {
	     throw new System.Exception("Unable to load a report with the specified ID: " + report);

	 }
	 else
	 {
	     XmlReportSource retreivedReport = new Telerik.Reporting.XmlReportSource { Xml = report };
	     var conStrMan = new ReportConnectionStringManager(userClass);
	     updatedReport = conStrMan.UpdateReportSource(retreivedReport);
	 }

	 return updatedReport;
	}
}
````

In this way, you are able to get the user and pass it to your AuthenticationProvider.
