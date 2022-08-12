---
title: Overview
page_title: Embedding Reports Overview
description: "Learn more about using Telerik Reporting reports in applications."
slug: telerikreporting/using-reports-in-applications/overview
previous_url: /using-reports-in-applications/overview, /use-reports-in-applications
tags: telerik, reporting, embedding, reports, overview
published: True
position: 0
---

# Embedding Reports Overview

You can add reports to diverse types of web and desktop applications. The purpose of integrating Telerik Reporting into applications is to deliver interactive reports directly to your business system. The integration allows users to view and effortlessly export the report document to various formats. 

This article offers a brief overview of the most popular approaches to integrate and use Telerik Reporting.

## Displaying Reports in Applications

Telerik Reporting offers numerous ways to [Display Reports in Applications]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}). You can achieve this with the Report Viewer's UI components that are tailored for a specific technology, for example:

### Web Applications

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) - an HTML/CSS/JS client-side widget suitable for any web application that works with JavaScript. 

* [HTML5 MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%}) - a server-side wrapper that allows you to configure the HTML5 Viewer in MVC applications. 

* [HTML5 WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) - a server-side wrapper that allows you to configure the HTML5 Viewer in WebForms applications. 

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}) - an Angular component that wraps the HTML5 Report Viewer. 

* [ReactJS Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) - A ReactJS component that wraps the HTML5 Report Viewer. 

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) - a Blazor component that wraps the HTML5 Report Viewer. 

### Desktop Applications

* [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) - a composite of standard Windows Forms controls that is suitable for WinForms and WPF projects. 

* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%}) - a composite of Telerik UI for WPF controls that is suitable for WPF and WinForms projects. 

* [WinUI Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%}) - a composite of Telerik UI for WinUI desktop controls that is suitable for WinUI 3 projects. 

## Adding the Report Engine

There are many ways to add the report engine. You can [Host the Report Engine Remotely]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/overview%}), you can [Call the Report Engine via APIs]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}), or you can use the [Telerik Report Server](https://www.telerik.com/report-server): 

### Generating Reports Remotely

* [Telerik Reporting Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) - provide an Application Programming Interface (API) over HTTP to the report’s generation engine. It can be used by web and desktop report viewers as well as by any third-party client applications. 

* [Telerik Reporting WCF Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}) - is based on [Windows Communication Foundation (WCF)](https://docs.microsoft.com/en-us/previous-versions/dotnet/netframework-4.0/dd456779(v=vs.100)?redirectedfrom=MSDN) and is designed for the purposes of the [Telerik Silverlight Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%}). 

### Generating Reports Locally

If you choose the [Embedded Report Engine]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) path, you can utilize the report engine by desktop report viewers or using dedicated APIs for each specific report engine implementation. 

### Telerik Report Server

Telerik Report Server is a server-based platform powered by Telerik Reporting that provides a centralized storage for reports and comprehensive reports management. 

Connect the Report Viewer to the Telerik Report Server’s engine: 

* [How To: Use HTML5 Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})

* [How To: Use HTML5 ASP.NET MVC Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-report-server%})

* [How To: Use HTML5 ASP.NET Web Forms Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-report-server%})

* [How To: Use Windows Forms Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%})

* [How To: Use WPF Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%})

## Generating Custom Reports

[Program the Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/overview%}) section provides information for advanced report authors on how to generate reports programmatically using the provided API: 

* [How To Create Report Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-programmatically%})

* [How To Access Report Items Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/access-report-items-programmatically%})

* [How To Use Report Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%})

* [How To Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%})

* [How To Serialize Report Definition in XML]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%})

## Next Steps

If you are just starting with Telerik Reporting, look at our [First Steps]({%slug telerikreporting/getting-started/first-steps%}) article. 

Wondering about specific report design? You might find helpful suggestions on how to present the data in [Report Structure]({%slug telerikreporting/designing-reports/report-structure/overview%}) section. 

Are you into ASP.NET Core? See how to display reports in a.NET Core application for Windows, Linux, and macOS platforms here - [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}).
