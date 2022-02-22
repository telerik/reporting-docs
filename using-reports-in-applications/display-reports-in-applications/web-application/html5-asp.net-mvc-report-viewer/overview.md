---
title: HTML5 ASP.NET MVC Report Viewer Overview
page_title: Overview 
description: Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview
tags: overview
published: True
position: 0
---

# HTML5 ASP.NET MVC Report Viewer Overview



The HTML5 MVC Report Viewer provides server-side wrapper which can be used in MVC applications. The MVC wrapper is built on top of the         [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}).       

The HTML5 ASP.NET MVC Report Viewer exposes all the HTML5 Report Viewer options.         The MVC wrapper renders the widget with the configured options on the page.       

The viewer works like the HTML5 Report Viewer in a client-server pair with the [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).       

>The MVC wrapper of the HTML5 Report Viewer can be used in MVC projects, where the MVC project appears as the client for the Reporting REST Service.           Even if the Reporting REST Service is added in the same MVC project, the service does not operate in the MVC context.           If data modified in the MVC context is needed, it has to be saved in the data source, from where the Reporting REST service can access it.         


## Requirements

* The ASP.NET MVC Report Viewer is built on and requires                [                ASP.NET MVC 4              ](http://www.asp.net/mvc/mvc4)                or newer framework.             

* A reference to __Telerik.ReportViewer.Mvc.dll__ 

* The ASP.NET MVC Report Viewer is a server-side wrapper of the [              HTML5 JavaScript Report Viewer            ]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and you should conform to the HTML5 Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).               The CSS and JS files must be loaded on the page before creating the HTML5 Viewer.             

## Browser Support

The extension is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) thus should conform           to the HTML5 Report Viewer [Browser Support](143e5c03-e69d-416f-9ac0-85c397b22b8e#BrowserSupport).         

## Examples

You can find a complete sample project with the HTML5 MVC Report Viewer in the Telerik Reporting installation path. For example,           __C:\Program Files (x86)\Progress\Telerik Reporting {VERSION}\Examples\CSharp\MvcDemo__.

