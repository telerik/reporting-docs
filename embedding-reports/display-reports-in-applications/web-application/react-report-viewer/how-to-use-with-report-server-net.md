---
title: Using with Report Server for .NET
page_title: Using the React Report Viewer with a Report Server for .NET instance
description: "Understand the prerequisites and steps necessary to add the React Report Viewer component to a new React application. Learn how to display a report coming from a Telerik Report Server for .NET."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-with-report-server-net
tags: how, to, use, react, report, viewer, with, report, server. net
published: True
reportingArea: React
position: 2
---

# How to Use React Report Viewer with Report Server for .NET

This tutorial demonstrates how to add the React Report Viewer component to a new React application and display a report coming from the Telerik Report Server.

## Prerequisites

The following list describes the prerequisites for this tutorial:

The article explains how to set up the HTML5 Report Viewer to work with the Telerik Report Server for .NET. The user account that will authenticate with the Report Server may be any User, including the Guest User, provided there is an enabled Token in its [Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) collection.

## Prerequisites

* Review the React Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}#requirements).
* Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
* Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
* Report Server for .NET should contain at least one report that can be accessed by the User account.

## Steps

1. Install the `@progress/telerik-react-report-viewer` NPM package by running:

	````powershell
npm install @progress/telerik-react-report-viewer
````


1. Style the viewer using the desired Kendo UI [Sass-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) by adding references to the Sass-based CSS files in the `<head>` element of _public/index.html_:

	````HTML
<link href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" rel="stylesheet" />
````

	>note To get the Sass-based Kendo UI themes, you can use either the pre-built CSS files, the Kendo UI CDN, or the NPM packages ([Getting the Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/installation)).

1. In the `.JSX` file where the report viewer will be used, create a `reportSource` object specifying the category and the name of the report that will be displayed. For example, if the category is **Samples** and the report is **Dashboard**, the syntax will look as follows:

	````JS
const reportSource = {
		report: 'Samples/Dashboard',
		parameters: {}
	}
````


1. In the same file, define a `viewerContainerStyle` object with the CSS styles that must be applied to the viewer's container, such as size, position, etc.

	````JS
const viewerContainerStyle = {
		position: 'absolute',
		inset: '5px'
	}
````


1. In the same file, define a `reportServer` object with a `url` string pointing to the Report Server for .NET, and a `getPersonalAccessToken` callback, which will be executed when the report viewer requests from the server to render the report.

	````JS
const reportServer = { 
		url: 'http://dnikolovlap:81/',
		getPersonalAccessToken: () => fetch('/rs-token').then(response => response.text())
	}
````

	In this example, the `getPersonalAccessToken` callback makes a request to a */rs-token* endpoint that returns the token used to authorize access to using the Report Server for .NET REST API.

	This is the **recommended** approach, but if an endpoint cannot be exposed, the token can be hardcoded in the callback: `getPersonalAccessToken: () => Promise.resolve('TOKEN_STRING')`


1. In the same file, import the `TelerikReportViewer` component from `@progress/telerik-react-report-viewer` so that the objects that we defined above can be passed to the viewer:

	````JS
import { TelerikReportViewer } from '@progress/telerik-react-report-viewer';

	export function ReportViewer() {
	
		const reportServer = { 
			url: 'http://reportServerUrl:port/',
			getPersonalAccessToken: () => fetch('/rs-token').then(response => response.text())
		}
	
		const reportSource = {
			report: 'Samples/Dashboard',
			parameters: {}
		}
	
		const viewerContainerStyle = {
			position: 'absolute',
			inset: '5px'
		}
		
		return (
				<TelerikReportViewer
					reportServer={reportServer}
					reportSource={reportSource}
					viewerContainerStyle={viewerContainerStyle} />
		)
	}
````


1. Run the application:

	````powershell
npm run start
````


## See Also

* [Telerik Report Server](https://docs.telerik.com/report-server/introduction)
* [React Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
* [How to Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%})
