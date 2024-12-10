---
title: ASP.NET Reporting
page_title: ASP.NET Reporting – Telerik Reporting
description: "ASP.NET Reporting is a framework for generating and delivering dynamic reports in web apps using ASP.NET technology."
slug: asp-net-reporting
tags: telerik, reporting, reports, web, asp, net
published: True
position: 9
---

# Embedding Telerik Reporting in ASP.NET Reporting Applications

ASP.NET is a mature Microsoft Web technology for building client-side, server-side, and combined applications. This article offers a brief overview of the most popular approaches to integrate and use Telerik Reporting in ASP.NET Web Reporting applications.

## Displaying Reports in ASP.NET Web Reporting Applications

The [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) is an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript. This makes it the perfect widget for displaying Telerik Reporting Reports in all Web Reporting Applications.

We provide also dedicated wrappers of the pure HTML5 Report Viewer for the most popular ASP.NET MVC and Web Forms frameworks:

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%})
* [HTML5 ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

### Implementation

The article [Using the HTML5 Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}) is a step-by-step tutorial on embedding the HTML5 Report Viewer in ASP.NET Web Reporting projects.

The steps for integrating the viewers in ASP.NET MVC and Web Forms projects are as follows:

* [Using HTML5 ASP.NET __MVC__ Report Viewer With Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-rest-service%})
* [Using the HTML5 ASP.NET __Web Forms__ Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service%})

## Generating Reports in ASP.NET Web Reporting Applications

The [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) provide an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully functional implementation of the service is available in the assembly/package [Telerik.Reporting.Services.WebApi](/api/telerik.reporting.services.webapi). It may be embedded in any ASP.NET Reporting Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as a source of Report documents by Web Reporting, Desktop Reporting, and other third-party client applications.

### Implementation

The article [Telerik Reporting REST Service ASP.NET Web API Implementation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview%}) elaborates on the requirements, implementation, and hosting of the REST Service.

## Designing Reports in ASP.NET Web Reporting Applications

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is an HTML/CSS/JS client-side widget that lets developers embed a report designer into their web reporting applications. It is ready for embedding in the ASP.NET Reporting Applications to allow the users to create, edit, and preview their Telerik Web Reports directly from the browser.

### Web Report Designer Requirements

The Web Report Designer requires a Report Designer REST service, whose fully functional implementation resides in the assembly/package [Telerik.WebReportDesigner.Services](/api/telerik.webreportdesigner.services) as explained in the section [Web Report Designer Implementation](#web-report-designer-implementation).

### Web Report Designer Implementation

The tutorial [Configuring the Web Report Designer in ASP.NET Framework application]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application%}) elaborates on implementing the web designer widget and its REST Service in ASP.NET Web Reporting projects.

## See Also

* [Displaying Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%})
* [Telerik Report Viewer and Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
* [REST API Reference]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Embedding Telerik Reporting in ASP.NET Core Web Reporting Applications]({%slug asp-net-core-reporting%})
* [Embedding Telerik Reporting in Blazor Reporting Applications]({%slug blazor-reporting%})
* [Embedding Telerik Reporting in Single Page Web Reporting Applications]({%slug spa-reporting%})
