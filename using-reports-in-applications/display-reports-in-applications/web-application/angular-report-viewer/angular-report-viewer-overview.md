---
title: Angular Report Viewer Overview
page_title: Angular Report Viewer Overview | for Telerik Reporting Documentation
description: Angular Report Viewer Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview
tags: angular,report,viewer,overview
published: True
position: 0
---

# Angular Report Viewer Overview



Integrate the Angular Report Viewer component in your Angular applications regardless of the module loader that you use         (__WebPack__  or __SystemJS__ ).       

The Angular component is built on top of the         [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is the base for all Web-technologies report viewers as well.       

## Requirements

To successfully integrate the Angular Report Viewer component, ensure the following:         

1. Required Application Version:             

   + Angular 4+ application                 

1. Required Service:             

   + The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%})                   in order to display reports. Make sure to                    [enable Cross-Origin Requests (CORS)](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api)  in the REST Service project.                 

1. Required JavaScript libraries:

   +  [jQuery 3.2.1+](https://jquery.com/download/) 

1. The                [Angular Report Viewer package](https://www.npmjs.com/package/@progress/telerik-angular-report-viewer)                requires the following peer dependencies:             

   + @angular/common                 

   + @angular/core                 

   + rxjs                 

   + jquery                 

1. Required references to Telerik Kendo UI styles:

   +  [Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling) ; or                 

   +  [Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes) 

## Browser Support

The Angular viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}),           thus the client browser should conform to the HTML5 Report Viewer [Browser Support](143e5c03-e69d-416f-9ac0-85c397b22b8e#browser-support).         

# See Also


 * [How to Use Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%})

 * [How to Use Angular Report Viewer with SystemJS]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-systemjs%})
