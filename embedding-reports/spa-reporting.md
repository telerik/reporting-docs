---
title: SPA Reporting
page_title: Single Page Reporting Applications – Telerik Reporting
description: "Generate and deliver dynamic reports to Single Page Applications using Telerik Reporting."
slug: spa-reporting
tags: telerik, reporting, reports, web, spa, angular, react
published: True
position: 92
---

# Embedding Telerik Reporting in Single Page Web Reporting Applications

[Single-Page Applications (SPA)](https://en.wikipedia.org/wiki/Single-page_application) dynamically rewrite the web page content rather than loading entire new pages, making the website faster and feel more like a native app. This article summarizes the most popular approaches for integrating and using Telerik Reporting into SPA Reporting applications.

## Supported Operating Systems and Docker Containers

The Telerik Reporting REST Service for .NET and SPA Report Viewers let you deploy seamlessly your Web Reporting Applications in multiple environments.
The article [Available .NET Support for Operating Systems and Docker Containers]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}) elaborates on the specifics when deploying Telerik Reporting on different environments.

## Designing Reports in SPA Web Reporting Applications

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is an HTML/CSS/JS client-side jQuery widget that lets developers embed a report designer into their web reporting applications. It is ready for embedding in the SPA Reporting Applications to allow the users to create, edit, and preview their Telerik Web Reports directly from the browser.

### Web Report Designer Requirements

The Web Report Designer requires a Report Designer REST service, whose fully functional implementation resides in the `Telerik.WebReportDesigner.Services` assembly/package as explained in the section [Web Report Designer Implementation](#web-report-designer-implementation).

### Web Report Designer Implementation

The following tutorials elaborate on embedding the web report designer jQuery widget into SPA Reporting projects. The jQuery web designer widget requires a Web Report Designer REST service:

* [Integrate the Web Report Designer in Angular]({%slug display-web-report-designer-in-angular-application%})
* [How to use Web Report Designer in React Application]({%slug how-to-use-web-report-designer-in-react-js%})

## Generating Reports for Single Page Web Reporting Applications

The Single Page Applications hosting a Telerik Report Viewer require a [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to serve the report documents. The service provides an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully functional implementation of the service is available in the `Telerik.Reporting.Services.AspNetCore` assembly/package. It may be embedded in any ASP.NET Core and Blazor Server Reporting Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as a source of Report documents by Web Reporting, Desktop Reporting, and other third-party client applications.

### Implementation

There are different methods for configuring the Telerik Reporting REST Service in an ASP.NET Core or Blazor Server Reporting project:

* [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET {{site.mindotnetversion}}+ with Minimal API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})
* [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET {{site.mindotnetversion}} with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/host-reports-service-in-.net-with-controllers%})
* [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application in {{site.dotnetversions}} with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%})

## Displaying Reports in SPA Web Reporting Applications

The Telerik Reporting product comes with ready-to-use Report Viewers for the following SPA Frameworks:

* [Angular](https://angular.dev/overview)

	You may find two Report Viewer implementations for the Angular framework:
	
	+ The [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}) is a wrapper of the [pure HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript. The Angular Report Viewer does not use [Kendo UI for Angular](https://www.telerik.com/kendo-angular-ui) components and doesn't require a subscription for this suite.

	+ The [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) is a native Angular widget built on top of [Kendo UI for Angular](https://www.telerik.com/kendo-angular-ui) components and as such requires subscription for this suite.

* [React](https://react.dev/)

	The [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) is a wrapper of the [pure HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript.

### Requirements

The [globalization-invariant mode](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization) available in .NET restricts the application to use only the invariant culture. The Report Engine relies on instantiating cultures to support localization, formatting, and unit conversion, so enabling invariant globalization will break the engine's functionality. Refer to the [Only invariant culture is supported in globalization-invariant mode]({%slug only-invariant-culture-is-supported-in-globalization-invariant-mode-error%}) article for instructions on how to disable the `Invariant Globalization` mode.

### Implementation

* Angular

	+ The article [Integrating the Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%}) is s step-by-step tutorial on integrating the Angular HTML5 Report Viewer in an [Angular CLI application](https://angular.dev/tools/cli.

	+ Use the article [Integrating the Native Angular Report Viewer with the Reporting Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service%}) as a tutorial for embedding the Native Angular Report Viewer into your Angular Single Page Application.

* React

	Follow the instructions in [How to Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%}).

## See Also

* [Displaying Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%})
* [Telerik Report Viewer and Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
* [REST API Reference]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Embedding Telerik Reporting in ASP.NET Core Web Reporting Applications]({%slug asp-net-core-reporting%})
* [Embedding Telerik Reporting in Blazor Reporting Applications]({%slug blazor-reporting%})

