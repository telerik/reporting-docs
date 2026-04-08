---
title: Using with Report Server for .NET
page_title: Using the Angular Wrapper Report Viewer with a Report Server for .NET instance
description: "Understand the prerequisites and steps necessary to add the Angular Wrapper Report Viewer component to a new Angular application. Learn how to display a report coming from a Telerik Report Server for .NET."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-with-report-server-net
tags: how, to, use, angular, wrapper, report, viewer, with, report, server. net
published: True
reportingArea: AngularWrapper
position: 4
---

# How to Use Angular Wrapper Report Viewer with Report Server for .NET

The article explains how to set up the Angular Wrapper Report Viewer to work with the Telerik Report Server for .NET.

The user account that will authenticate with the Report Server may be any User, including the Guest User, provided there is an enabled Token in its [Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) collection.

## Prerequisites

- Review the Angular Wrapper Report Viewer [Requirements](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview#requirements).
- Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
- Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
- Report Server for .NET should contain at least one report that can be accessed by the User account.

## Steps

1. Install the Telerik Angular Report Viewer NPM package by running:

	```powershell
	npm install @progress/telerik-angular-report-viewer
	```

	> If you receive a _403 Forbidden Error_, you need to register and log in at [npmjs.com](https://www.npmjs.com/) before performing this step.
	>
	> ```powershell
	> npm login --registry=https://registry.npmjs.org --scope=@progress
	> ```

1. Once installed, import the `TelerikReportingModule` in [your application root module](https://angular.io/guide/ngmodules#!#angular-modularity) or [standalone component](https://angular.dev/guide/components):

	{{source=CodeSnippets\Blazor\Docs\TypeScript\AngularViewerWithReportServerNet.ts region=AngularViewerImportWithReportServerNet}}

1. Style the viewer using the desired Kendo UI [Sass-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) by adding references to the Sass-based CSS files in the `<head>` element of _index.html_:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\AngularViewerUseWithReportServerNet.html region=AngularViewerSteps3}}

	> To get the Sass-based Kendo UI themes, you can use either the pre-built CSS files or the NPM packages ([Getting the Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview#getting-the-themes)).

	If you use the **styleUrls** attribute to reference the CSS, it is required to set the view encapsulation to **None**:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\AngularViewerWithReportServerNet_1.ts region=AngularViewerImportWithReportServerNetDisableEncapsulation}}

1. In the class of the component(e.g. `AppComponent`) where the viewer will be displayed, define a `viewerContainerStyle` object property that will be used to set the container styling:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\AngularViewerWithReportServerNet.ts region=AngularViewerImportWithReportServerNetContainerStyle}}

1. In the same component class, define a `reportSource` object property specifying the category and the name of the report that will be displayed. For example, if the category is **Samples** and the report is **Dashboard**, the syntax will look as follows:

	{{source=CodeSnippets\Blazor\Docs\TypeScript\AngularViewerWithReportServerNet_1.ts region=AngularViewerImportWithReportServerRestService}}

1. In the same component class, define a `reportServer` object property with a `url` string pointing to the Report Server for .NET, and a `getPersonalAccessToken` callback, which will be executed when the report viewer requests from the server to render the report.

	{{source=CodeSnippets\Blazor\Docs\TypeScript\AngularViewerWithReportServerNet_1.ts region=AngularViewerImportWithReportServerReportServer}}

	In this example, the `getPersonalAccessToken` callback makes a request to a _/rs-token_ endpoint that returns the token used to authorize access to using the Report Server for .NET REST API.

	This is the **recommended** approach, but if an endpoint cannot be exposed, the token can be hardcoded in the callback: `getPersonalAccessToken: () => Promise.resolve('TOKEN_STRING')`

1. In the HTML template of the component, define the `<tr-viewer>` element, and pass the defined properties to their corresponding properties of the Angular Wrapper Report Viewer:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\AngularViewerUseWithReportServerNet.html region=AngularViewerSteps4}}

1. Run the application:

	```powershell
	ng serve
	```

## See Also

- [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview)
- [Angular Wrapper Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview)
