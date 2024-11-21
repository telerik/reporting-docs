---
title: ASP.NET Core Reporting
page_title: ASP.NET Core Reporting – Telerik Reporting
description: “ASP.NET Core Reporting is a framework for generating and delivering dynamic reports in web apps using ASP.NET Core technology.”
slug: asp-net-core-reporting
tags: telerik, reporting, embedding, reports, overview
published: True
position: 0
---

# Overview

[ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/introduction-to-aspnet-core) is an advanced Web technology that lets you build modern cross-platform client-side, server-side and combined applications. This article offers a brief overview of the most popular approaches to integrate and use Telerik Reporting in ASP.NET Core Web Reporting appications.

## Supported Operating Systems and Docker Containers

The article [Available .NET Support for Operating Systems and Docker Containers]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}) elaborates on the specifics when deploying Telerik Reporting on different environments.

## Displaying Reports in ASP.NET Core Reporting Applications

The [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) is an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript. This makes it the perfect widget for displaying Telerik Reporting Reports in all Web Reporting Applications.

### Requirements

.NET 6 introduced a [globalization-invariant mode](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization) which, if enabled, does not allow the creation of any culture except the invariant culture. The Report Engine relies on instantiating cultures to support localization, formatting, and unit conversion, so enabling invariant globalization will break the engine's functionality. Refer to the [Only invariant culture is supported in globalization-invariant mode]({%slug only-invariant-culture-is-supported-in-globalization-invariant-mode-error%}) article for instructions on how to disable the `Invariant Globalization` mode.

### Implementation

The article [Using the HTML5 Report Viewer in an ASP.NET Core application in .NET]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-in-.net-5-application%}) is a step-by-step tutorial on embedding the HTML5 Report Viewer in ASP.NET Core Reporting projects.

## Generating Reports in ASP.NET Core Reporting Applications

The [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) provide an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully-functional implementation of the service is available in the assembly/package `Telerik.Reporting.Services.AspNetCore`. It may be embedded in any ASP.NET Core Reporting Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as source of Report documents by Web Reporting, Desktop Reporting and other third-party client applications.
