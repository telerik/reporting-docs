---
title: Overview
page_title: Angular Report Viewer Integration - Telerik Reporting
description: "Integrate the Angular Report Viewer component into your Angular apps, regardless of the module loader you use."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview
tags: angular,report,viewer,overview
published: True
reportingArea: AngularWrapper
position: 0
previous_url: /angular-report-viewer, /using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview, /embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/
---

# Angular Report Viewer Overview

> The current Angular Report Viewer version is `{{site.spaviewerversion}}` and should be used with `Reporting REST Service {{site.buildversion}}` or `Telerik Report Server {{site.reportserverversion}}`.

Integrate the Angular Report Viewer component in your Angular Reporting applications regardless of the module loader that you use.

>note Check out also the [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%}) built on the top of Telerik UI for Angular components.

The Angular component is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is the base for other Web-technologies report viewers as well.

## Requirements

To successfully integrate the Angular Report Viewer component, ensure the following are fulfilled in your Angular Reporting application:

1. Required Application Version:

	+ [Angular 16+](https://v17.angular.io/guide/update-to-version-16) Application

1. Required Service:

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. Make sure to [enable Cross-Origin Requests (CORS)](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api) in the REST Service project so that its routes are accessible from the Angular application.

1. Required JavaScript libraries:

	+ [Node.js](https://nodejs.org/) - The required version will depend on the version of the Angular project - [Angular versions under active support](https://angular.io/guide/versions)

1. The [Angular Report Viewer package](https://www.npmjs.com/package/@progress/telerik-angular-report-viewer) requires the following peer dependencies:

	+ `@angular/common: "16 - 19"`
	+ `@angular/core: "16 - 19"`
	+ `"jquery": "^1.10.0 || ^2.2.0 || ^3.7.0"`

1. Required references to Telerik Kendo UI styles:

	+ [Kendo UI Sass-Based Themes v10.2.0](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)

## Browser Support

The Angular viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus it has the same [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support) as the HTML5 Report Viewer.

## Types of Reports

The Angular Report Viewer can display both `declarative` and `type` [report definitions]({%slug on-telerik-reporting%})#report-definition). All report definitions must be accessible server-side by the Reporting REST Service.

Report definitions created in run-time, fetched from custom storage, etc. may also be displayed in the viewer. This requires a [Custom IReportSourceResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) associating the [client-side ReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%}) `Report` property with the [server-side ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources) passed to the Reporting engine.

## Preview, Export, Print, and Share Reports

The Angular Report Viewer enables users to Preview, Export, and Print their reports from your Angular Reporting application. The functionalities are triggered from the corresponding [Toolbar Menu buttons]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}#toolbar).

The [Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%}) functionality gives the option to share the previewed report documents with anyone.

## Report Parameters

The Parameters Area provides an intuitive UI for user interactions. The HTML5-based Report Viewers use [Kendo UI widgets](https://www.telerik.com/kendo-ui) for parameter editors out-of-the-box. Based on the type of the report parameter, a suitable editor UI is created.

List of the default widgets for different report parameters' types:

* DateTime: [Kendo UI DatePicker widget](https://docs.telerik.com/kendo-ui/controls/editors/datepicker/overview). Even though the time part cannot be selected via the Kendo UI DatePicker widget UI it is still passed to the report engine as a default time part (12:00:00 AM) with the `DateTime` value. If needed, the viewer can be [customized]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/overview%}) to use a [Kendo UI DateTimePicker](https://demos.telerik.com/kendo-ui/datetimepicker/index) or another widget which allows selecting the time part explicitly. When a `DateTime` value is selected in the parameters area of the HTML5 Report Viewer it is interpreted as UTC `DateTime` on the server where the report is processed and rendered. For example, entering 1/1/2000 12:00:00 AM in a DateTimePicker report parameter widget and rendering the report will result in the following `DateTime` value on the server and in the rendered report - 1/1/2000 12:00:00 AM considered as a UTC time.
* Integer | Float | String: [Kendo UI ListView widget](https://docs.telerik.com/kendo-ui/controls/data-management/listview/overview). The default editor could be easily changed to [Kendo UI ComboBox](https://docs.telerik.com/kendo-ui/api/javascript/ui/combobox) (for single select parameters) and [Kendo UI MultiSelect](https://docs.telerik.com/kendo-ui/api/javascript/ui/multiselect) (for multi-select parameters) editors. For more information, check __parameters__ option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) article.

When one or more [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) have their `Visible` property turned on, a parameter area is shown as part of the report viewer. This helps the report developer to easily provide input methods for the end users. Based on the type of parameters, a suitable editor UI is created. The parameter layout on the parameter area is formatted automatically. The order is determined by the order in which parameters appear in the [ReportParameters collection editor]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/reportparameter-collection-editor%}). The end user can enter or select values in the editors.

When one or more visible report parameters have the `AutoRefresh` property turned off a __Preview__ button appears. In this case, to preview the report, the end user can click the **Preview** button. If all parameters have default values, the report runs automatically on the first view. You can show or hide the parameters area from the __Parameters__ button in the report viewer’s toolbar.

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
* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
