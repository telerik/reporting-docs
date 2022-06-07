---
title: How to use HTML5 Report Viewer in Vue.js
description: How to use HTML5 Report Viewer in Vue.js
type: how-to
page_title: HTML5 Report Viewer in Vue.js
slug: how-to-use-html5-viewer-in-vue-js
position: 
tags: vue,viewer,report,reporting
ticketid:
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting R2 2020</td>
	</tr>
	<tr>
		<td>Framework</td>
		<td>Vue.js</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5</td>
	</tr>
</table>


## Description

The [HTML5 Report Viewer](../html5-report-viewer) is built upon HTML5, CSS, and JavaScript. This allows the viewer to be used in virtually any JavaScript framework.
[Vue.js](https://vuejs.org/) has been gaining a lot of traction and we would like to explore how the HTML5 Report Viewer could be implemented, together with its dependencies, in a Vue application.
The solution we are about to examine is a very basic approach to create a new Vue.js application, include the viewer's dependencies, and display the report viewer.

## Solution

The following guide assumes previous knowledge of Vue.js:

1. Start by creating a new Vue application using the following CLI command:

	```
	vue init webpack hello-world
	```

2. The viewer depends on **jQuery**. In the application folder run:

	```
	npm install jquery --save
	```
	
3. Open **build/webpack.base.conf.js** and add **plugins**:

	```
	const webpack = require('webpack')
	...
	```

	```
	module.exports = {
	  plugins: [
		new webpack.ProvidePlugin({
		  $: 'jquery',
		  jquery: 'jquery',
		  'window.jQuery': 'jquery',
		  jQuery: 'jquery'
		})
	  ]
	  ...
	```

4. If you are using **ESLint**, open **.eslintrc.js** and add **globals**:

	```
	module.exports = {
	  globals: {
		"$": true,
		"jQuery": true
	  },
	  ...
	```

5. Add the desired [Kendo UI Less-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling) to **index.html** in order to style the viewer:

	```
	<head>
	  <link href="https://kendo.cdn.telerik.com/2020.1.114/styles/kendo.common.min.css" rel="stylesheet" />
	  <link href="https://kendo.cdn.telerik.com/2020.1.114/styles/kendo.default.min.css" rel="stylesheet" />
	...
	```
	
6. Add [Kendo UI for jQuery](https://www.telerik.com/kendo-ui) JS library. An alternative approach is to add only the subset of Kendo widgets required for the proper work of the
HTML5 Report Viewer. The subset is available in the Telerik Reporting installation folder (*C:\Program Files (x86)\Progress\Telerik Reporting R2 2020\Html5\ReportViewer\js\telerikReportViewer.kendo-14.1.20.618.min.js*) 
and can be copied to the Vue application's **assets** folder (*src/assets/ReportViewer/js*). Then reference it in **App.vue**:

	```
	<script>
	import './assets/ReportViewer/js/telerikReportViewer.kendo-14.1.20.618.min.js'
	...
	```
	
	To avoid getting errors from **ESLint** for any report viewer dependencies, add them to **.eslintignore**:
	
	```
	src/assets/ReportViewer/
	src/components/ReportViewer.vue	
	```

7. Add the HTML5 Report Viewer JS library from the Telerik Reporting installation folder (*C:\Program Files (x86)\Progress\Telerik Reporting R2 2020\Html5\ReportViewer\js*) to **assets** (*src/assets/ReportViewer/js*).

8. Create a new report viewer component and configure the routes accordingly. The new component contains a *div* element to hold the report viewer object and applies CSS to this element. The component calls the **telerik_ReportViewer** method to create the report viewer with the specified configuration options. It is important that the **serviceUrl** option points to the URL of a working [Reporting REST Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}). How to implement this service is described [here]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1 %}).

	```
	<template>
	  <div class="hello">
		<h1>{{ msg }}</h1>
		<div id="reportViewer1">loading...</div>
	  </div>
	</template>

	<script>
	import '../assets/ReportViewer/js/telerikReportViewer-14.1.20.618.min.js'

	export default {
	  name: 'ReportViewer',
	  data () {
		return {
		  msg: 'Welcome to Your Vue.js App'
		}
	  },
	  mounted () {
		this.$nextTick(function () {
		  $('#reportViewer1')
			.telerik_ReportViewer({
			  serviceUrl: 'http://my.service.url/api/reports/',
			  reportSource: {
				report: 'Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary'
			  },
			  viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
			  scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
			  scale: 1.0,
			  sendEmail: { enabled: true }
			})
		})
	  }
	}
	</script>

	<!-- Add "scoped" attribute to limit CSS to this component only -->
	<style scoped>
	  body {
		  font-family: Verdana, Arial;
		  margin: 5px;
	  }

	  #reportViewer1 {
		  position: absolute;
		  top: 70px;
		  bottom: 10px;
		  left: 10px;
		  right: 10px;
		  overflow: hidden;
		  clear: both;
	  }
	</style>
	```

9. Run

	```
	npm run dev
	```
	
	![HTML5 Report Viewer in Vue.js](resources/vuer-webpack.png)
	
### See Also

[Download the final Vue.js application](resources/vuer-webpack.zip).
