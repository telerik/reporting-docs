---
title: How to use Web Report Designer in React Application
description: "Learn how the Web Report Designer can be integrated into a React JS application with a few simple steps."
type: how-to
page_title: Implementing the Web Report Designer in React Application
slug: how-to-use-web-report-designer-in-react-js
tags: react,viewer,report,reporting,webreportdesigner
ticketid: 1558188
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>R3 SP1 2022+</td>
	</tr>
	<tr>
		<td>Framework</td>
		<td>React</td>
	</tr>
	<tr>
		<td>Report Designer</td>
		<td>Web Report Designer</td>
	</tr>
</table>

## Description

The Telerik [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is an HTML5/JavaScript/CSS3 jQuery-based widget that allows integration into your web applications built on virtually any JavaScript framework.

With it, users can create or modify existing declarative (TRDX, TRDP, and TRBP) reports directly from inside the React application. 
The solution we are about to demonstrate is a very basic approach to creating a new React application, including the web report designer's dependencies and displaying the web report designer.

## Solution

The following guide assumes previous knowledge of React:

1. Start by creating a new React application using the following CLI commands:

	````
npx create-react-app my-app
	cd my-app
	npm run start
````


	>note You’ll need to have **Node >= 6** and **npm >= 5.2** on your machine.

2. Create a new .NET or .NET Core Web Application that will host the Rest Service for the web report designer. The required steps depending on the framework can be found in:

	- [Setting up the Web Report Designer in .NET and .NET Core 3.1 applications]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications%})

	- [How to set up the Web Report Designer service in .NET Framework application]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application%})

	You can also find demo projects with the .NET Core implementation in the installation folder of `Telerik Reporting` -> `Examples` -> `CSharp` -> `.NET 6` -> `ReportingRestServiceCorsDemo` subfolder.

	For this example, we will use the REST service from our [online demos](https://demos.telerik.com/reporting).

4. The designer depends on **jQuery**. Add a CDN link to the jQuery library in `public/index.html`:

	````HTML
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
````


3. Also in the head, add a reference for Kendo all:

	````HTML
<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js"></script>
````


4. Refer the JavaScript of the web report designer and the viewer also in `public/index.html` as:

	````HTML
<script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
	<script src="https://demos.telerik.com/reporting/api/reportdesigner/designerresources/js/webReportDesigner-{{buildversion}}.min.js"></script>
````


5. Create a new web report designer component (`components/ReportDesigner.js`) and configure the routes accordingly. The new component would contain the following template, scripts, and styles:

	````TypeScript
import React, { Component } from 'react';

	export default class ReportDesigner extends Component {

		componentDidMount() {
			window.jQuery('#reportDesigner1')
				.telerik_WebReportDesigner({
					toolboxArea: {
						layout: "list" //Change to "grid" to display the contents of the Components area in a flow grid layout.
					},
					serviceUrl: "https://demos.telerik.com/reporting/api/reportdesigner/",
					report: "Barcodes report.trdx"
				}).data("telerik_WebDesigner");
		}

		render() {
			return <div id="reportDesigner1"></div>
		}
	}
````


7. In the required page (for example `App.js`), render the React component:

	````TypeScript
import React, { Component } from 'react';
	import './App.css';

	import ReportDesigner from './components/ReportDesigner';

	class App extends Component {
		render() {
			return (
				<div className="App">
					<ReportDesigner />
				</div>
			);
		}
	}

	export default App;
````


8. Run

	````XML
npm run start
````


## Notes

If you do not wish to load the scripts for the designer and viewer in the `index.html` since it would increase the initial load time, the scripts may be loaded in the component itself. In this scenario, steps 3 through 5 can be skipped.

To load the `jQuery` and `Kendo` subsets in the component where the Web Report Designer will be used, the following packages must be installed:

````powershell
> npm install jquery
> npm install @progress/kendo-ui
```` 

Then, the component needs to be edited as follows:

````TypeScript
import React, { Component } from 'react';
import * as $ from 'jquery';
import '@progress/kendo-ui';

export default class ReportDesigner extends Component {

    componentDidMount() {
        window.jQuery = $;
        window.$ = $;
        this.loadScriptPromise("https://demos.telerik.com/reporting/api/reportdesigner/designerresources/js/webReportDesigner/").then(a => {
            $('#reportDesigner1')
            .telerik_WebReportDesigner({
                toolboxArea: {
                    layout: "list" //Change to "grid" to display the contents of the Components area in a flow grid layout.
                },
                serviceUrl: "https://demos.telerik.com/reporting/api/reportdesigner/",
                report: "Barcodes report.trdx"
            }).data("telerik_WebDesigner");
        })

	this.loadScriptPromise("https://demos.telerik.com/reporting/api/reportdesigner/resources/js/telerikReportViewer/")
    }

    render() {
        return <div id="reportDesigner1"></div>
    }

    loadScriptPromise(scriptUrl) {
        return new Promise(resolve => {
          const scriptElement = document.createElement('script');
          scriptElement.src = scriptUrl;
          scriptElement.onload = resolve;
          document.body.appendChild(scriptElement);
        });
      }
}
````

## Additional resources

You can find the sample application in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/WebReportDesigner%20in%20React%20Application).

## See Also

* [Create a New React App](https://react.dev/learn/start-a-new-react-project)
