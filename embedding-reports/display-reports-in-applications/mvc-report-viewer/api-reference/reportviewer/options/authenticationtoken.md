---
title: AuthenticationToken
page_title: AuthenticationToken property
description: "Sets the encoded authentication token used to authenticate requests to the reporting service. Used for secured reporting services that require authentication tokens for request authorization."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/authenticationtoken
published: True
reportingArea: MVCWrapper
---

# The `AuthenticationToken` option of the HTML5 ASP.NET MVC Report Viewer

Sets the encoded authentication token used to authenticate requests to the reporting service. Used for secured reporting services that require authentication tokens for request authorization.

## Type

`System.String`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example of setting the AuthenticationToken for the Report Viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .AuthenticationToken("encoded-auth-token-value")
)
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/overview%})
* [CheckedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})
* [ClientEvents]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/clientevents%})

