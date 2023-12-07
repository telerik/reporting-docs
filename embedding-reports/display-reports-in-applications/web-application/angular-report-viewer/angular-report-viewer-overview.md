---
title: Overview
page_title: Integrating the Angular Report Viewer
description: "Learn about the requirements of the Angular Report Viewer, what module loaders can be used, and what are the supported browsers."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview
tags: angular,report,viewer,overview
published: True
position: 0
previous_url: /angular-report-viewer, /using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview, /embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/
---

# Angular Report Viewer Overview

> The current Angular Report Viewer version is `{{site.spaviewerversion}}` and should be used with `Reporting REST Service {{site.buildversion}}` or `Telerik Report Server {{site.reportserverversion}}`.

Integrate the Angular Report Viewer component in your Angular applications regardless of the module loader that you use (`WebPack` or `SystemJS`).

>note Check out also the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) built on the top of Telerik UI for Angular components.

The Angular component is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is the base for other Web-technologies report viewers as well.

## Requirements

To successfully integrate the Angular Report Viewer component, ensure the following:

1. Required Application Version:

	+ Angular 13+ application

1. Required Service:

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. Make sure to [enable Cross-Origin Requests (CORS)](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api)  in the REST Service project.

1. Required JavaScript libraries:

	+ [jQuery 3.2.1+](https://jquery.com/download/)
	+ [Node.js](https://nodejs.org/) - The required version will depend on the version of the Angular project - [Angular versions under active support](https://angular.io/guide/versions)

1. The [Angular Report Viewer package](https://www.npmjs.com/package/@progress/telerik-angular-report-viewer) requires the following peer dependencies:

	+ `@angular/common: ">=13.0.0"`
	+ `@angular/core: ">=13.0.0"`
	+ `rxjs: ">=6.5.0"`

1. Required references to Telerik Kendo UI styles:

	+ [Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling); or
	+ [Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)

## Browser Support

The Angular viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus the client browser should conform to the HTML5 Report Viewer [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support).

## See Also

* [How to Use Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%})
* [How to Use Angular Report Viewer with SystemJS]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-systemjs%})
* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
