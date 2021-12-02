---
title: Display Reports in Applications Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/overview
tags: overview
published: True
position: 0
---

# Display Reports in Applications Overview

We provide UI components called Report Viewers that you can use to display reports in applications. The Report Viewers cover various technologies         (Angular, HTML5/JS, WPF, ASP.NET, Windows Forms, etc.) and allow you to display a report document in the application's UI and to interact with it.       

This document provides a brief overview of the different Telerik Report Viewer flavors. If you are interested in the Report Viewer for a specific technology,         follow the corresponding link to learn more.         

## Report Viewers Overview

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})  
  The HTML5 Viewer is an HTML/CSS/JS client-side widget that doesn't require any assembly references. The viewer operates as a client of the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) or  [Telerik Report Server](https://www.telerik.com/report-server).  
  The HTML5 Viewer is suitable for any web application that works with JavaScript. For some of the most popular web technologies, we provide dedicated wrappers. We have also successfully tested the viewer in the following technologies for which there are no dedicated wrappers:             

   + *ReactJS*. A basic approach for displaying the Html5 Report Viewer in a React application is described in the [How to use HTML5 Report Viewer in React Application](../../knowledge-base/how-to-use-html5-viewer-in-react-js) KB article                 

   + *Vue.js*. A step-by-step example for integrating the viewer in Vue.js application                    can be found in the                      [How to use HTML5 Report Viewer in Vue.js](../../knowledge-base/how-to-use-html5-viewer-in-vue-js)                    KB article                 

   + *ASP.NET Core*. The exact implementation depends on the framework version. Use the following resources for the recommended approach:                 

     + [How to Use HTML5 Report Viewer in an ASP.NET Core in .NET 5 application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-in-.net-5-application%})
     + [How To: Use HTML5 Report Viewer in an ASP.NET Core 3.1 application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-3.1-application%})  
     + [How To: Use HTML5 Report Viewer in an ASP.NET Core 2.1 and 2.2 application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-2.1-and-2.2-application%})  
     + [How to implement Telerik Reporting in ASP.NET Core 2.1 MVC](../../knowledge-base/how-to-implement-telerik-reporting-in-asp-net-core-mvc)  

   + *AngularJS* 

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%})  
  The HTML5 ASP.NET MVC Report Viewer is a helper allowing you to configure the HTML5 Viewer via server-side code. The helper renders the JavaScript object and required scripts on the page. The HTML5 ASP.NET MVC Report Viewer is suitable for ASP.NET MVC4|MVC5 projects.             

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})  
  The HTML5 ASP.NET WebForms Report Viewer is a server-side wrapper allowing you to configure the HTML5 Viewer via server-side code.               The control renders the JavaScript object and required scripts on the page. The HTML5 ASP.NET WebForms Report Viewer is suitable for ASP.NET WebForms projects.             

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})  
  The Angular Report Viewer provides a component which wraps the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}).             

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})  
  The Blazor Report Viewer is a component which can be used in Blazor applications. It is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}).             

* [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})  
  The WinForms Report Viewer is suitable for WinForms and WPF projects. The viewer is built with standard Microsoft controls. It can operate with an embedded reporting engine or as a client of [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) or [Telerik Report Server](http://www.telerik.com/report-server).             

* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})  
  The WPF Report Viewer is suitable for WPF and WinForms projects. The viewer is built with Telerik UI for WPF controls providing better               look and feel, and functionality. It can operate with an embedded reporting engine or as a client of [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) or [Telerik Report Server](http://www.telerik.com/report-server).             

* [Silverlight Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%})  
  The Silverlight Report Viewer is suitable for Silverlight projects. The viewer is built with Telerik UI for Silverlight controls providing better look and feel, and functionality. The viewer operates as a client of [Telerik Reporting WCF service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}).             

* [ASP.NET WebForms Report Viewer (obsolete)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})  
  The old ASP.NET WebForms Report Viewer is a server-side control suitable for ASP.NET WebForms projects. The viewer is obsolete as of Q3 2015 and we recommend using the [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).             
