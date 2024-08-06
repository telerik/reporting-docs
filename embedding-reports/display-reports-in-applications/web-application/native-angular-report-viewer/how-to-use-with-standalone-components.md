---
title: Integration with Angular Standalone Components
page_title: Using Native Angular Report Viewer with Standalone Components
description: "Learn how the Native Angular Report Viewer can be implemented in an Angular application that uses the Standalone Components approach."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-standalone-components
tags: how,to,use,native,angular,report,viewer,with,standalone,components
published: True
position: 5
---

# Integrating the Native Angular Report Viewer in a Standalone Component

This tutorial demonstrates how to add the native Angular Report Viewer component to a new Angular application that uses the Standalone Components approach which was made enabled by default for new Angular applications starting with the [Angular 17](https://blog.angular.dev/introducing-angular-v17-4d7033312e4b) release.

## Prerequisites

The following list describes the prerequisites for completing the tutorial:

* Review the Native Angular Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%}).
* [Angular CLI Project](https://angular.dev/tools/cli).
* A running application that hosts a Reporting REST service at address `/api/reports`. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).

### Steps:

1. Create a new Angular application using the [Angular CLI](https://angular.dev/tools/cli).
1. Enable Angular Animations in the project by following the [Enabling the animations module](https://angular.dev/guide/animations#enabling-the-animations-module) article. For example, the `provideAnimations` function can be invoked in the `bootstrapApplication` function call in `app.config.ts`:

	````TypeScript
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
import { provideAnimations } from '@angular/platform-browser/animations';

export const appConfig: ApplicationConfig = {
	providers: [provideRouter(routes), provideAnimations()]
};
````


1. Install the `Native Angular Report Viewer` NPM package with the following command:

	````powershell
npm install @progress/telerik-angular-native-report-viewer
````

	>If you receive a *403 Forbidden Error*, you need to register and log in at [npmjs.com](https://www.npmjs.com/) before performing this step.
	>
	>````powershell
npm login --registry=https://registry.npmjs.org --scope=@progress
````


1. Once installed, `import` the `ReportingAngularViewerModule` in one of your standalone components of choice - [Importing in Standalone components](https://angular.dev/guide/components/importing#standalone-components):

	````TypeScript
import { Component, ViewChild } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ReportingAngularViewerComponent, ReportingAngularViewerModule } from '@progress/telerik-angular-native-report-viewer'

@Component({
	selector: 'app-root',
	standalone: true,
	imports: [RouterOutlet, ReportingAngularViewerModule],
	templateUrl: './app.component.html',
	styleUrl: './app.component.scss'
	})
	export class AppComponent {
	title = 'Native Angular Report Viewer Demo';
	
	@ViewChild('viewer') public viewer!: ReportingAngularViewerComponent;
}
````


1. Use the report viewer selector - `reporting-angular-viewer` in the component's template:

	````HTML
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
````


1. Install the Angular `localize` package - [Add the localize package](https://angular.io/guide/i18n-common-add-package#add-the-localize-package). This is required for the report viewer's localization functionality

	````powershell
ng add @angular/localize
````


1. Install one of the [Kendo UI for Angular themes](https://www.telerik.com/kendo-angular-ui/components/styling/), e.g. the [Default Theme](https://www.telerik.com/kendo-angular-ui/components/styling/theme-default/)

	````powershell
npm install --save @progress/kendo-theme-default
````


1. Reference the theme in the project using one of the supported approaches - [Compiling Themes from SCSS Source Files](https://www.telerik.com/kendo-angular-ui/components/styling/#toc-compiling-themes-from-scss-source-files). In this example, we will use the approach with the `angular.json` configuration which consists of adding the desired theme inside the `styles` array - [Angular workspace configuration: Styles and scripts configuration](https://angular.io/guide/workspace-config#styles-and-scripts-configuration):

	````JSON
"styles": [
		"src/styles.scss",
		"node_modules/@progress/kendo-theme-default/dist/default-ocean-blue.scss"
	],
````


1. Run the application `start` script:

	````powershell
npm run start
````


## See Also

* [Angular CLI](https://angular.dev/tools/cli)
* [Native Angular Report Viewer Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%})
* [Enabling CORS for the Reporting REST Service]({%slug cannot-access-the-reporting-rest-service%})
* [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%})
* [Native Angular Report Viewer Commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands%})
* [Native Angular Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events%})
