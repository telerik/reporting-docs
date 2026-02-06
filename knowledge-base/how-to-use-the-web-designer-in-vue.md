---
title: How to use the Web Report Designer in Vue.js
description: How to integrate the Web Report Designer in Vue.js
type: how-to
page_title: Display the Web Report Designer in a Vue.js application
slug: how-to-use-the-web-designer-in-vue
tags: vue,web,report,designer,reporting
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Framework</td>
		<td>Vue.js</td>
	</tr>
</table>

## Description

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is built upon HTML5, CSS, JavaScript, jQuery and Kendo.

This allows the viewer to be used in virtually any JavaScript framework, such as [Vue.js](https://vuejs.org/).

The solution we are about to examine is a very basic approach to create a new Vue.js application, include the designer's dependencies, and display it in the application.

## Solution

> The following guide assumes previous knowledge of Vue.js

- Start by [creating a new Vue application](https://vuejs.org/guide/quick-start.html) using the following CLI command:

  ```bash
  npm init vue@latest
  ```

- Add a reference to jQuery in `index.html`:

  ```HTML
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  ```

- Add a reference to the Kendo JS library in `index.html`:

  ```HTML
  <script src="https://kendo.cdn.telerik.com/2022.1.301/js/kendo.all.min.js"></script>
  ```

- Add references to the Web Report Designer and Report Viewer JS resources, again to `index.html`:

  ```HTML
  <script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
  <script src="https://demos.telerik.com/reporting/api/reportdesigner/designerresources/js/webReportDesigner"></script>
  ```

- Create a new web report designer component and configure the routes accordingly. The new component contains a `div` element to hold the web report designer object and applies CSS to this element.

  The component calls the `telerik_webReportDesiger` method to initialize the web report designer widget with the specified configuration options.

  It is important that the `serviceUrl` option points to the URL of a working [Reporting REST Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}).

  How to implement this service is described in the article [How to Host Reports Service in ASP.NET Core 3.1]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1 %}).

  ```HTML
  <template>
    <div id="wrd1">...</div>
  </template>

  <script>
  export default {
    name: "WebReportDesigner",
    mounted() {
  	this.$nextTick(function () {
  	  $("#wrd1")
  		.telerik_WebReportDesigner({
  		  toolboxArea: {
  			layout: "list", //Change to "grid" to display the contents of the Components area in a flow grid layout.
  		  },
  		  serviceUrl: "https://demos.telerik.com/reporting/api/reportdesigner/",
  		  report: "Barcodes Report.trdx",
  		})
  		.data("telerik_WebDesigner");
  	});
    },
  };
  </script>

  <!-- Add "scoped" attribute to limit CSS to this component only -->
  <style scoped>
  #wrd1 {
    position: relative;
    height: 880px;
  }
  </style>
  ```

- Run the app

  ```bash
  npm run dev
  ```

## See Also

- [Download the final Vue.js application](resources/reporting-vue.zip)
