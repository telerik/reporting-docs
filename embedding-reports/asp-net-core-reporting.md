---
title: ASP.NET Core Reporting
page_title: ASP.NET Core Reporting – Telerik Reporting
description: "ASP.NET Core Reporting is a framework for generating and delivering dynamic reports in web apps using ASP.NET Core technology."
slug: asp-net-core-reporting
tags: telerik, reporting, reports, web, asp, net, core
published: True
position: 90
---

# Embedding Telerik Reporting in ASP.NET Core Reporting Applications

[ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/introduction-to-aspnet-core) is an advanced Web technology that lets you build modern cross-platform client-side, server-side and combined applications. This article offers a brief overview of the most popular approaches for integrating and using Telerik Reporting into ASP.NET Core Web Reporting applications.

## Supported Operating Systems and Docker Containers

The ASP.NET Core Framework allows deploying seamlessly your Web Reporting Applications in multiple environments.
The article [Available .NET Support for Operating Systems and Docker Containers]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}) elaborates on the specifics when deploying Telerik Reporting on different environments.

## Displaying Reports in ASP.NET Core Web Reporting Applications

The [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) is an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript. This makes it the perfect widget for displaying Telerik Reporting Reports in all Web Reporting Applications.

### Requirements

.NET 6 introduced a [globalization-invariant mode](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization) which, if enabled, does not allow the creation of any culture except the invariant culture. The Report Engine relies on instantiating cultures to support localization, formatting, and unit conversion, so enabling invariant globalization will break the engine's functionality. Refer to the [Only invariant culture is supported in globalization-invariant mode]({%slug only-invariant-culture-is-supported-in-globalization-invariant-mode-error%}) article for instructions on how to disable the `Invariant Globalization` mode.

### Implementation

The article [Using the HTML5 Report Viewer in an ASP.NET Core application in .NET]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-in-.net-5-application%}) is a step-by-step tutorial on embedding the HTML5 Report Viewer in ASP.NET Core Web Reporting projects.

## Generating Reports in ASP.NET Core Web Reporting Applications

The [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) provide an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully functional implementation of the service is available in the `Telerik.Reporting.Services.AspNetCore` assembly/package. It may be embedded in any ASP.NET Core Reporting Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as a source of Report documents by Web Reporting, Desktop Reporting, and other third-party client applications.

### Implementation

There are different methods for configuring the Telerik Reporting REST Service in an ASP.NET Core Reporting project:

* [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET 6+ with Minimal API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})
* [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET 6 and .NET 8 with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/host-reports-service-in-.net-with-controllers%})
* [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application in .NET 6, .NET 8, and .NET 9 with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%})

## Designing Reports in ASP.NET Core Web Reporting Applications

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is an HTML/CSS/JS client-side widget that lets developers embed a report designer into their web reporting applications. It is ready for embedding in the ASP.NET Core Reporting Applications to allow the users to create, edit, and preview their Telerik Web Reports directly from the browser.

### Web Report Designer Requirements

The Web Report Designer requires a Report Designer REST service, whose fully functional implementation resides in the `Telerik.WebReportDesigner.Services` assembly/package as explained in the section [Web Report Designer Implementation](#web-report-designer-implementation).

### Web Report Designer Implementation

The tutorial [Setting up the Web Report Designer in .NET applications]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications%}) elaborates on implementing the web designer widget and its REST Service in ASP.NET Core Web Reporting projects.

## See Also

* [Displaying Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%})
* [Telerik Report Viewer and Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
* [REST API Reference]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Embedding Telerik Reporting in Blazor Reporting Applications]({%slug blazor-reporting%})
* [Embedding Telerik Reporting in Single Page Web Reporting Applications]({%slug spa-reporting%})
