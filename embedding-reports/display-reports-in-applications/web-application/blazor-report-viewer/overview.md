---
title: Blazor Report Viewer Overview
page_title: Blazor Report Viewer Overview
description: Blazor Report Viewer Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview
tags: overview
published: True
position: 0
previous_url: /blazor-report-viewer
---

# Blazor Report Viewer Overview

>note Check out also the [Native Blazor Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) built on the top of Telerik UI for Blazor components.

The Blazor Viewer is a component which can be used in Blazor applications. It is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) which is the base for the rest of the Web-technologies report viewers as well. 

## Requirements

1. Required Application Version: 

	+ Blazor 3.1+ application 

1. Required Service: 

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. It can be hosted either in the same Blazor application or the viewer can reference a service hosted in another origin. In the later case make sure to [enable Cross-Origin Requests (CORS)](https://docs.microsoft.com/en-us/aspnet/core/security/cors?view=aspnetcore-3.1) in the REST Service project. 

1. Required JavaScript libraries:

	+ [jQuery 3.2.1+](https://jquery.com/download/) 

1. References to [Telerik Kendo UI Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes). (Alternatively, the [Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling) can be used instead, but they are not compatible with Telerik UI for Blazor.) 

## Browser Support

The Blazor viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus the client browser should conform to the HTML5 Report Viewer [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support). 

## Demo

The complete example can be found in the installation folder of Telerik Reporting: C:\Program Files (x86)\Progress\Telerik Reporting __Version__\Examples\CSharp\. 
