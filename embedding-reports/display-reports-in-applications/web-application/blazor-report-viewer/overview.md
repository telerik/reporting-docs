---
title: Overview
page_title: Blazor Report Viewer at a Glance
description: "Learn about the requirements and browser support of the Telerik Reporting Blazor HTML5 Wrapper Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview
tags: overview
published: True
position: 0
previous_url: /blazor-report-viewer, /using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview, /embedding-reports/display-reports-in-applications/web-application/blazor-report-viewer/
---

# Blazor Report Viewer Overview

>note Check out also the [Native Blazor Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) built on the top of Telerik UI for Blazor components.

The Blazor Viewer is a component that can be used in Blazor applications. It is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) which is the base for the rest of the Web-technologies report viewers as well.

## Requirements

1. Required Application Version:

	+ [Blazor Client or Server](https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor) Application

1. Required Service:

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to display reports. It can be hosted either in the same Blazor application or the viewer can reference a service hosted in another origin. In the latter case make sure to [enable Cross-Origin Requests (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors) in the REST Service project.

1. Required JavaScript libraries:

	+ [jQuery 3.7.1+](https://jquery.com/download/)

1. Required Stylesheets:

	+ [Telerik Kendo UI SASS-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) 

## Browser Support

The Blazor Report Viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus it has the same [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support) as the HTML5 Report Viewer.

## Demo Projects

Navigate to the installation folder of Telerik Reporting - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp` to find the Blazor-related projects. 
