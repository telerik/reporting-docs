---
title: Overview
page_title: Embedding Reports Basics
description: "Learn how you may design reports, render them in applications, and display the report documents in the dedicated report viewers with Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/overview
previous_url: /using-reports-in-applications/overview, /use-reports-in-applications, /embedding-reports/
tags: telerik, reporting, embedding, reports, overview
published: True
position: 0
reportingArea: General
---

# Embedding Reports Overview

You can add reports to diverse types of web and desktop applications. [The purpose of integrating Telerik Reporting](https://www.telerik.com/products/reporting/embedded-reporting.aspx) into applications is to deliver interactive reports directly to your business system. The integration allows users to view and effortlessly export the report document to various formats.

This article offers a brief overview of the most popular approaches to integrate and use Telerik Reporting.

## Displaying Reports in Applications

Telerik Reporting offers numerous ways to [Display Reports in Applications]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}). You can achieve this with the Report Viewer's UI components that are tailored for a specific technology, for example:

### Web Applications

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) - an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript.
* [HTML5 MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%}) - a server-side wrapper that allows you to configure the HTML5 Viewer in MVC applications.
* [HTML5 WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) - a server-side wrapper that allows you to configure the HTML5 Viewer in WebForms applications.
* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) - a native Angular component built with [Kendo UI for Angular](https://www.telerik.com/kendo-angular-ui) components.
* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}) - an Angular component that wraps the HTML5 Report Viewer.
* [ReactJS Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) - A ReactJS component that wraps the HTML5 Report Viewer.
* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) - a Blazor component that wraps the HTML5 Report Viewer.
* [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) - a native Blazor component built with [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) components.

### Desktop Applications

* [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) - a composite of standard Windows Forms controls that is suitable for WinForms and WPF projects.
* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%}) - a composite of Telerik UI for WPF controls that is suitable for WPF and WinForms projects.
* [WinUI Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%}) - a composite of Telerik UI for WinUI desktop controls that is suitable for WinUI 3 projects.

### Requirements

The [globalization-invariant mode](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/globalization) available in .NET restricts the application to use only the invariant culture. The Report Engine relies on instantiating cultures to support localization, formatting, and unit conversion, so enabling invariant globalization will break the engine's functionality. Refer to the [Only invariant culture is supported in globalization-invariant mode]({%slug only-invariant-culture-is-supported-in-globalization-invariant-mode-error%}) article for instructions on how to disable the `Invariant Globalization` mode.

## Adding the Report Engine

There are many ways to add the report engine. You can [Host the Report Engine Remotely]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), you can [Call the Report Engine via APIs]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}), or you can use the [Telerik Report Server](https://www.telerik.com/report-server):

### Generating Reports Remotely

[Telerik Reporting Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) - provide an Application Programming Interface (API) over HTTP to the report’s generation engine. It can be used by web and desktop report viewers as well as by any third-party client applications.

### Generating Reports Locally

If you choose the [Embedded Report Engine]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) path, you can utilize the report engine by desktop report viewers or using dedicated APIs for each specific report engine implementation.

### Telerik Report Server

Telerik Report Server is a server-based platform powered by Telerik Reporting that provides centralized storage for reports and comprehensive reports management.

Connect the Report Viewer to the Telerik Report Server’s engine:

* [Use HTML5 Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})
* [Use HTML5 ASP.NET MVC Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-report-server%})
* [Use HTML5 ASP.NET Web Forms Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-report-server%})
* [Use Windows Forms Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%})
* [Use WPF Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%})

## Generating Custom Reports

[Program the Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/overview%}) section provides information for advanced report authors on how to generate reports programmatically using the provided API:

* [Create Report Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-programmatically%})
* [Access Report Items Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/access-report-items-programmatically%})
* [Use Report Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%})
* [Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%})
* [Serialize Report Definition in XML]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%})

## Next Steps

If you are just starting with Telerik Reporting, look at our [First Steps]({%slug telerikreporting/getting-started/first-steps%}) article.

Wondering about specific report design? You might find helpful suggestions on how to present the data in [Report Structure]({%slug telerikreporting/designing-reports/report-structure/overview%}) section.

Are you into ASP.NET Core? See how to display reports in a .NET Core application for Windows, Linux, and macOS platforms here - [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}).

## See Also

* [Embedding Telerik Reporting in ASP.NET Core Web Reporting Applications]({%slug asp-net-core-reporting%})
