---
title: Integration with Reporting REST Service
page_title: Using Native Angular Report Viewer with a Reporting REST Service
description: "Learn how the Native Angular Report Viewer can be implemented in an Angular application that connects to a Reporting service with a few simple steps."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service
tags: how,to,use,angular,report,viewer,with,angular,cli
published: True
reporting_area: NativeAngular
position: 3
---

# Integrating the Native Angular Report Viewer with the Reporting Service

This tutorial demonstrates how to add the native Angular Report Viewer component to a new Angular application.

## Prerequisites

The following list describes the prerequisites for completing the tutorial:

- Review the Native Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%}).
- [Angular CLI Project](https://angular.io/cli).
- A running application that hosts a Reporting REST service at address `/api/reports`. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).

### Steps:

1.  Create a new Angular application using the [Angular CLI](https://angular.io/cli).
1.  Install the Native Angular Report Viewer NPM package with the following command:

        ````powershell
        npm install @progress/telerik-angular-native-report-viewer
        ````

        >If you receive a *403 Forbidden Error*, you need to register and log in at [npmjs.com](https://www.npmjs.com/) before performing this step.
        >
        >````powershell
        >npm login --registry=https://registry.npmjs.org --scope=@progress
		>````

1.  Once installed, import the `ReportingAngularViewerModule` in [your application root module](https://angular.io/guide/ngmodules#!#angular-modularity):

    ```TypeScript
    import { ReportingAngularViewerModule } from '@progress/telerik-angular-native-report-viewer';

    @NgModule({
    	declarations: [
    		AppComponent
    	],
    	imports: [
    		BrowserModule,
    		AppRoutingModule,
    		BrowserAnimationsModule,
    		ReportingAngularViewerModule
    	],
    	providers: [],
    	bootstrap: [AppComponent]
    })
    ```

1.  Use the report viewer selector - `reporting-angular-viewer` in the component's template:

    ```HTML
    <reporting-angular-viewer
    	#report
    	[reportSource]="{
    		report: 'Report Catalog.trdx',
    		parameters: {}
    	}"
    	serviceUrl="https://demos.telerik.com/reporting/api/reports"
    	viewMode="interactive"
    	[keepClientAlive]="true">
    </reporting-angular-viewer>
    ```

1.  Install the Angular `localize` package - [Add the localize package](https://angular.io/guide/i18n-common-add-package#add-the-localize-package). This is required for the report viewer's localization functionality

    ```powershell
    ng add @angular/localize
    ```

1.  Install one of the [Kendo UI for Angular themes](https://www.telerik.com/kendo-angular-ui/components/styling/), e.g. the [Default Theme](https://www.telerik.com/kendo-angular-ui/components/styling/theme-default/)

    ```powershell
    npm install --save @progress/kendo-theme-default
    ```

1.  Reference the theme in the project using one of the supported approaches - [Compiling Themes from SCSS Source Files](https://www.telerik.com/kendo-angular-ui/components/styling/#toc-compiling-themes-from-scss-source-files). In this example, we will use the approach with the `angular.json` configuration which consists of adding the desired theme inside the `styles` array - [Angular workspace configuration: Styles and scripts configuration](https://angular.io/guide/workspace-config#styles-and-scripts-configuration):

    ```JSON
    "styles": [
    	"src/styles.scss",
    	"node_modules/@progress/kendo-theme-default/dist/default-ocean-blue.scss"
    ],
    ```

1.  Run the application `start` script:

    ```powershell
    npm run start
    ```

## See Also

- [Angular CLI](https://angular.io/cli)
- [Native Angular Report Viewer Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%})
- [Enabling CORS for the Reporting REST Service]({%slug cannot-access-the-reporting-rest-service%})
- [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%})
- [Native Angular Report Viewer Commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands%})
- [Native Angular Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events%})
