---
title: Blazor Reporting
page_title: Blazor Reporting – Telerik Reporting
description: "Blazor Reporting is a framework for generating and delivering dynamic reports in web apps using Blazor technology."
slug: blazor-reporting
tags: telerik, reporting, reports, web, blazor
published: True
position: 91
---

# Embedding Reporting in Blazor Applications

This article offers an overview of the most popular approaches for integrating Telerik Reporting into Blazor Web Reporting applications.

## Supported Operating Systems and Docker Containers

The Blazor technology allows deploying seamlessly your Web Reporting Applications in multiple environments.
The article [Available .NET Support for Operating Systems and Docker Containers]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}) elaborates on the specifics when deploying Telerik Reporting on different environments.

## Displaying Reports in Blazor Web Reporting Applications

Telerik Reporting provides two Web Report Viewers suitable for Blazor Web Reporting applications:

* The [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) is a wrapper of the [pure HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript. The Blazor Report Viewer does not use [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) components and doesn't require a subscription for this suite.

* The [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) is a native Blazor widget built on top of [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) components and as such requires subscription for this suite.

### Requirements

.NET 6 introduced a [globalization-invariant mode](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization) which, if enabled, does not allow the creation of any culture except the invariant culture. The Report Engine relies on instantiating cultures to support localization, formatting, and unit conversion, so enabling invariant globalization will break the engine's functionality. Refer to the [Only invariant culture is supported in globalization-invariant mode]({%slug only-invariant-culture-is-supported-in-globalization-invariant-mode-error%}) article for instructions on how to disable the `Invariant Globalization` mode.

### Implementation

* Follow the instructions in [Integrating the Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer%}) to embed the Blazor HTML5 Report Viewer in your Web Reporting client application.

* The article [Using Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer%}) is a step-by-step tutorial on embedding the Native Blazor Report Viewer in Web Reporting projects.

## Generating Reports in Blazor Web Reporting Applications

The [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) provide an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully functional implementation of the service is available in the  `Telerik.Reporting.Services.AspNetCore` assembly/package. It may be embedded in any Blazor Server Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as a source of Report documents by Web Reporting, Desktop Reporting, and other third-party client applications.

### Implementation

There are different methods for configuring the Telerik Reporting REST Service in a Blazor Server Reporting project:

* [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET 6+ with Minimal API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})
* [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET 6 and .NET 8 with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/host-reports-service-in-.net-with-controllers%})
* [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application in .NET 6, .NET 8 and .NET 9 with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%})

## Designing Reports in Blazor Web Reporting Applications

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is an HTML/CSS/JS client-side widget that lets developers embed a report designer into their web reporting applications. It is ready for embedding in the Blazor Reporting Applications to allow the users to create, edit, and preview their Telerik Web Reports directly from the browser.

### Web Report Designer Requirements

The Web Report Designer requires a Report Designer REST service, whose fully functional implementation resides in the `Telerik.WebReportDesigner.Services` assembly/package as explained in the section [Web Report Designer Implementation](#web-report-designer-implementation).

### Web Report Designer Implementation

The tutorial [How to set up Reporting in Blazor applications]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-blazor-application%}) elaborates on implementing the web designer widget and its REST Service in Blazor Web Reporting projects.

## See Also

* [Displaying Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%})
* [Telerik Report Viewer and Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
* [REST API Reference]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Embedding Telerik Reporting in ASP.NET Core Web Reporting Applications]({%slug asp-net-core-reporting%})
* [Embedding Telerik Reporting in Single Page Web Reporting Applications]({%slug spa-reporting%})
