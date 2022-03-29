---
title: How to use Web Report Designer in React Application
description: How to use Web Report Designer in React Application
type: how-to
page_title: Adding the Web Report Designer in React Application
slug: how-to-use-web-report-designer-in-react-js
position: 
tags: react,viewer,report,reporting,webreportdesigner
ticketid:1558188
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>R3 2019+</td>
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


The Telerik [Web Report Designer]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview}) is an HTML5/JavaScript/CSS3 jQuery-based widget that allows integration into your web applications built on virtually any JavaScript framework.

With it, your users can create or modify existing declarative (TRDX, TRDP and TRBP) reports directly from your React application. 
The solution we are about to demonstrate is a very basic approach to create a new React application, include the web report designer's dependencies and lastly, display the web report designer.

## Solution

The following guide assumes previous knowledge of React:

1. Start by creating a new React application using following CLI commands:

    ````
npx create-react-app my-app
    cd my-app
    npm start
````
  
    *Note:* You’ll need to have **Node >= 6** and **npm >= 5.2** on your machine.
  
2. Create a new .NET or .NET Core Web Application that will host the Rest Service for the web report desiger.  The required steps depending on the framework can be found in:
    - [How to set up in .NET 5 and .NET Core 3.1 applications]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications})
    - [How to set up in .NET Framework application]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application})

You can also find a demo projects with the .NET Core imeplementation in the installation folder of Telerik Reporting -> Examples -> CSharp -> .NET 6 -> ReportingRestServiceCorsDemo subfolder.
  
For this example, we will use the REST service from our [online demos](https://demos.telerik.com/reporting).

4. The deisner depends on **jQuery**. Add a CDN link to jQuery library in **public/index.html**:
       
    ````JS
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
````
    
    

3. Also in the head, add a reference for Kendo all:

   ````JS
<script src="https://kendo.cdn.telerik.com/2020.3.1118/js/kendo.all.min.js"></script>
````
    
  
4. Refer the JavaScript of the web report designer and the viewer also in **index.html** as:
  
  	````JS
<script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
	<script src="https://demos.telerik.com/reporting/api/reportdesigner/designerresources/js/webReportDesigner-16.0.22.225.min.js/"></script>
````
    

5. Create a new web report designer component (*components/ReportDesigner.js*) and configure the routes accordingly. The new component would contain the following template, scripts, and styles:
   
   ````JS 
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
  
7. In the required page (for example *App.js*), render the React component:
  
   ````JS
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
npm start
````
	

## Additional resources
You can find the sample application in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/WebReportDesigner%20in%20React%20Application/src).


## See Also
[Create a New React App](https://reactjs.org/docs/create-a-new-react-app.html)
