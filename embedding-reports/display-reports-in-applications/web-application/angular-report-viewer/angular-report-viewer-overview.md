---
title: Overview
page_title: Angular Report Viewer Integration - Telerik Reporting
description: "Integrate the Angular Report Viewer component into your Angular apps, regardless of the module loader you use."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview
tags: angular,report,viewer,overview
published: True
position: 0
previous_url: /angular-report-viewer, /using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview, /embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/
---

# Angular Report Viewer Overview

> The current Angular Report Viewer version is `{{site.spaviewerversion}}` and should be used with `Reporting REST Service {{site.buildversion}}` or `Telerik Report Server {{site.reportserverversion}}`.

Integrate the Angular Report Viewer component in your Angular Reporting applications regardless of the module loader that you use (`WebPack` or `SystemJS`).

>note Check out also the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) built on the top of Telerik UI for Angular components.

The Angular component is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is the base for other Web-technologies report viewers as well.

## Requirements

To successfully integrate the Angular Report Viewer component, ensure the following are fulfilled in your Angular Reporting application:

1. Required Application Version:

	+ Angular 15+ Application

1. Required Service:

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. Make sure to [enable Cross-Origin Requests (CORS)](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api) in the REST Service project.

1. Required JavaScript libraries:

	+ [Node.js](https://nodejs.org/) - The required version will depend on the version of the Angular project - [Angular versions under active support](https://angular.io/guide/versions)

1. The [Angular Report Viewer package](https://www.npmjs.com/package/@progress/telerik-angular-report-viewer) requires the following peer dependencies:

	+ `@angular/common: ">=15.0.0"`
	+ `@angular/core: ">=15.0.0"`
	+ `"jquery": "^1.10.0 || ^2.2.0 || ^3.7.0"`

1. Required references to Telerik Kendo UI styles:

	+ [Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling)
	+ [Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)

## Browser Support

The Angular viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus the client browser should conform to the HTML5 Report Viewer [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support).

## Types of Reports

The Angular Report Viewer can display both `declarative` and `type` [report definitions]({%slug on-telerik-reporting%})#report-definition). All report definitions should be accessible server-side by the Reporting REST Service.

Report definitions created in run-time, fetched from custom storages, etc. may also be displayed in the viewer. This requires a [Custom IReportSourceResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) associating the [client-side ReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%}) Report property with the [server-side ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources) passed to the Reporting engine.

## Preview, Export, Print, and Share Reports

The Angular Report Viewer enables users to Preview, Export, and Print their reports from your Angular Reporting application. The functionalities are triggered from the corresponding [Toolbar Menu buttons]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}#toolbar).

The [Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%}) functionality gives the option to share the previewed report documents with anyone.

## Report Parameters

The parameters pane provides an intuitive UI for user input. The HTML5-based Angular Report Viewer uses [Kendo UI widgets](https://www.telerik.com/kendo-ui) for its default parameter editors, creating a suitable editor UI based on the type of the parameter.

The **parameters area** is shown when at least one [report parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) has its _Visible_ property set to _True_. The parameter layout on the parameter area is formatted automatically. The order is determined by the order in which parameters appear in the [ReportParameters collection editor]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/reportparameter-collection-editor%}).

When at least one visible report parameter has the _AutoRefresh_ property turned off a __Preview__ button appears. In this case, to preview the report, the end user should click the _Preview_ button. If all parameters have default values, the report runs automatically on the first view. You can show or hide the parameters area from the __Parameters__ button in the report viewer’s toolbar.

For more details, visit the [Report Parameters section of the HTML5 Viewer Overview article]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}#report-parameters).

## Localization

The Angular Report Viewer may be localized with the mechanism provided by the _HTML5 Report Viewer_ that it wraps. Details may be found in the dedicated article [Angular Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization%}).

## API

The Angular Report Viewer exposes the following client APIs:

* [Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%})
* [Properties]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/properties%})
* [Methods]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/methods%})
* [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/events%})

## See Also

* [How to Use Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%})
* [How to Use Angular Report Viewer with SystemJS]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-systemjs%})
* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
