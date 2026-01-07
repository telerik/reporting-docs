---
title: reportServer
page_title: reportServer property
description: "Configuration for Telerik Report Server. Report Server for .NET supports Token (getPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (url only, if enabled on server). Properties: url (string, required), getPersonalAccessToken (function, optional, Report Server for .NET only), username (string, optional), password (string, optional)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/reportserver
published: True
reportingArea: HTML5
---

# The `reportServer` option of the HTML5 Report Viewer

Configuration for Telerik Report Server. Report Server for .NET supports Token (getPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (url only, if enabled on server). Properties: url (string, required), getPersonalAccessToken (function, optional, Report Server for .NET only), username (string, optional), password (string, optional).

## Type

[`ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportserver%})

## Examples

````JavaScript
// Use Report Server for .NET with Token authentication.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET with Token
  reportServer: {
    url: "https://myserver/",
    getPersonalAccessToken: function() {
      return Promise.resolve("<personal-access-token>");
    }
  }
});
````

````JavaScript
// Use Report Server for .NET with username/password.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET with username/password
  reportServer: {
    url: "https://myserver/",
    username: "user",
    password: "pass"
  }
});
````

````JavaScript
// Use Report Server for .NET Framework 4.6.2 with username/password.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET Framework 4.6.2
  reportServer: {
    url: "https://myserver/",
    username: "user",
    password: "pass"
  }
});
````

````JavaScript
// Use Report Server for .NET Framework 4.6.2 with Guest account.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET Framework 4.6.2 (Guest must be enabled on server)
  reportServer: {
    url: "https://myserver/"
  }
});
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/overview%})
* [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/reportsource%})
* [scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/scale%})

