---
title: React Report Viewer Overview
page_title: React Report Viewer Overview 
description: React Report Viewer Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview
tags: react,report,viewer,overview
published: True
position: 0
---

# React Report Viewer Overview

You can integrate the React Report Viewer component in your React applications. Notethat the viewer is introduced in R1 2022.       

The React component is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is the base for all Web-technologies report viewers as well. 

## Requirements

To successfully integrate the React Report Viewer component, ensure the following: 

1. Required Application Version: 

   + React 17.0.2+ application 

1. Required Service: 

   + The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. Make sure to [enable Cross-Origin Requests (CORS)](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api)  in the REST Service project. 

1. Required JavaScript libraries:

   +  [jQuery 3.2.1+](https://jquery.com/download/) 

1. The [React Report Viewer package](https://www.npmjs.com/package/@progress/telerik-react-report-viewer) requires the following peer dependencies:             

   + react-dom 17.0.2+ 

   + react-scripts 4.0.3+ 

   + jquery 

1. Required references to Telerik Kendo UI styles:

   +  [Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling); or                 

   +  [Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes) 

## Browser Support

The React viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus the client browser should conform to the HTML5 Report Viewer [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support). 

# See Also

* [How to Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%})

* [How to Use React Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server%})

