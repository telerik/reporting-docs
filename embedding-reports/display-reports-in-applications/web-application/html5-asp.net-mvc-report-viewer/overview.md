---
title: Overview
page_title: HTML5 ASP.NET MVC Report Viewer at a Glance
description: "Learn about the requirements of the HTML5 ASP.NET MVC Report Viewer, what are the supported browsers and its specifics."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview
tags: overview
published: True
reportingArea: MVCWrapper
position: 0
previous_url: /mvc-report-viewer-extension-overview, /embedding-reports/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/
---

# HTML5 ASP.NET MVC Report Viewer Overview

The HTML5 MVC [Report Viewer](https://www.telerik.com/products/reporting/delivering-viewing-exporting-reports.aspx) provides a server-side wrapper that can be used in MVC applications. The MVC wrapper is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}).

The **HTML5 ASP.NET MVC Report Viewer** exposes all the HTML5 Report Viewer options. The MVC wrapper renders the widget with the configured options on the page.

The viewer works like the HTML5 Report Viewer in a client-server pair with the [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).

> The **HTML5 ASP.NET MVC Report Viewer** can be used only in `ASP.NET Framework 4.6.2+` projects. When using [ASP.NET Core applications](https://dotnet.microsoft.com/en-us/apps/aspnet), use the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) instead.

> The MVC wrapper of the HTML5 Report Viewer can be used in MVC projects, where the MVC project appears as the client for the Reporting REST Service. Even if the Reporting REST Service is added to the same MVC project, the service does not run in the MVC context. If data modified in the MVC context is needed, it has to be saved in the data source, from where the Reporting REST service can access it.

## Requirements

* The ASP.NET MVC Report Viewer is built on and requires [ASP.NET MVC 4](https://learn.microsoft.com/en-us/aspnet/mvc/mvc4) or a newer framework.
* A reference to `Telerik.ReportViewer.Mvc.dll`.
* The ASP.NET MVC Report Viewer is a server-side wrapper of the [HTML5 JavaScript Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and you should conform to the HTML5 Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}). The CSS and JS files must be loaded on the page before creating the HTML5 Viewer.

## Browser Support

The HTML5 MVC Report Viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus it has the same [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support) as the HTML5 Report Viewer.

## Sample Project

Navigate to the installation folder of Telerik Reporting - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\AspNetMvcIntegrationDemo` to find the sample project. 
