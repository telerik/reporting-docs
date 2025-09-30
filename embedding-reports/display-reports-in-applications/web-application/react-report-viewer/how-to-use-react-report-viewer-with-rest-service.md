---
title: Using with REST Service
page_title: Using the React Report Viewer with a Reporting REST Service
description: "Understand the prerequisites and steps necessary to add the React Report Viewer component to a new React application. Learn how to display a report coming from a Telerik Reporting REST Service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service
tags: how, to, use, react, report, viewer, with, rest, service
published: True
reporting_area: React
position: 1
previous_url: /react-report-viewer-with-rest-service
---

# How to Use React Report Viewer with REST Service

This tutorial demonstrates how to add the React Report Viewer component to a new React application and display a report coming from the Telerik Reporting REST Service.

## Prerequisites

The following list describes the prerequisites for this tutorial:

- Review the React Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}#requirements).
- A running application that hosts a Reporting REST service at address /api/reports. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).
- Copy of the "Product Catalog.trdp" report file from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples` placed in the folder used by the [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver) in the Reporting REST service implementation.
- Entry with the default connection string used by Telerik Reporting sample reports in the configuration file of the project hosting the Reporting REST service. For example:

      __web.config__ file:

      ````XML

  <connectionStrings>
  		<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
  					connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
  					providerName="System.Data.SqlClient" />
  	</connectionStrings>

`````

	__appsettings.json__ file:

	````JSON
{
		"ConnectionStrings": [
			{
				"name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
				"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
				"providerName": "System.Data.SqlClient"
			}
		]
	}
`````

## Using React Report Viewer in React application

### Steps:

1.  Create new React application using the [Creating a React App](https://react.dev/learn/creating-a-react-app) tutorial.

        ````powershell

    npx create-react-app my-app-with-viewer
    cd my-app-with-viewer

`````


1. Install the `@progress/telerik-react-report-viewer` NPM package by running:

	````powershell
npm install @progress/telerik-react-report-viewer
`````

1.  Once installed, import the `TelerikReportViewer` component in the `index.js` file:

        ````JavaScript

    import { TelerikReportViewer } from '@progress/telerik-react-report-viewer'

`````


1. Add the React Report Viewer to the React component:

	````JavaScript
export function ReportViewer() {

	let viewer;

	const reportSource = {
					report: 'Report Catalog.trdp',
					parameters: {}
				};

	const viewerContainerStyle = {
					position: 'absolute',
					inset: '5px'
				};

	return (
	<>
		<TelerikReportViewer
				ref={el => viewer = el}
				serviceUrl="http://localhost:59657/api/reports/"
				reportSource={reportSource}
				viewerContainerStyle={viewerContainerStyle}
				viewMode="INTERACTIVE"
				scaleMode="SPECIFIC"
				scale={1.0}
				enableAccessibility={false} />
		<button id="refresh-button" onClick={ () => viewer.refreshReport() }>Refresh</button>
		<button onClick={ () => viewer.commands.print.exec() }>Print</button>
	<>
	)
}
`````

1.  Style the viewer using the desired Kendo UI [Sass-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) by adding references to the Sass-based CSS files in the `<head>` element of _public/index.html_:

        ````HTML

    <link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />

`````

	>note To get the Sass-based Kendo UI themes, you can use either the pre-build CSS files, the Kendo UI CDN, or the NPM packages ([Getting the Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/installation)).

1. Run the application:

	````powershell
npm run start
`````

## Sample Project

Navigate to the installation folder of Telerik Reporting - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\React\Create-React-App` to find the sample project.

## See Also

- [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%})
- [React Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
- [How to Use React Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server%})
