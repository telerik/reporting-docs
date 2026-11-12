---
title: Overview
page_title: HTML5 ASP.NET MVC Report Viewer at a Glance
description: "Learn about the HTML5 ASP.NET MVC Report Viewer, its requirements, supported browsers, and Reporting REST Service integration."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview
tags: overview
published: True
reportingArea: MVCWrapper
components: [mvcwrapper, general]
position: 0
previous_url: /mvc-report-viewer-extension-overview, /embedding-reports/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/
---

# Overview

The HTML5 ASP.NET MVC [Report Viewer](https://www.telerik.com/products/reporting/delivering-viewing-exporting-reports.aspx) provides a server-side wrapper for MVC applications. The MVC wrapper is built on the [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview).

The **HTML5 ASP.NET MVC Report Viewer** exposes all HTML5 Report Viewer options. The MVC wrapper renders the configured viewer on the page.

The viewer communicates with the [Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview) in a client-server setup.

>important The **HTML5 ASP.NET MVC Report Viewer** works only in `ASP.NET Framework 4.6.2+` projects. For [ASP.NET Core applications](https://dotnet.microsoft.com/en-us/apps/aspnet), use the [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview).

>note In an MVC project, the MVC wrapper generates HTML and JavaScript that initialize the HTML5 Report Viewer in the browser. The browser widget acts as the client for the Reporting REST Service, which does not run in the MVC context even when hosted in the same project. If reports need data modified in the MVC context, save that data to a data source the service can access.

## Requirements

The HTML5 ASP.NET MVC Report Viewer has the following requirements:

* ASP.NET MVC 4 or a later version, as described in the [ASP.NET MVC 4 documentation](https://learn.microsoft.com/en-us/aspnet/mvc/mvc4).
* A reference to `Telerik.ReportViewer.Mvc.dll`.
* The CSS and JavaScript files required by the [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support), loaded before you create the viewer.

## Browser Support

The HTML5 MVC Report Viewer is based on the [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview), so it has the same [supported browsers](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support#browser-support).

## Sample Project

To find the sample project, open the Telerik Reporting installation folder at `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\AspNetMvcIntegrationDemo`.
