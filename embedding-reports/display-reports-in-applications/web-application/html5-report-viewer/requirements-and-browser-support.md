---
title: Requirements and Browser Support
page_title: Requirements and Browser Support for Telerik Reporting HTML5 Report Viewer
description: "Learn what are the Requirements for integrating the Telerik Reporting HTML5 Report Viewer in a web page and what Browsers it supports."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support
tags: requirements,and,browser,support
published: True
position: 1
previous_url: /html5-report-viewer-system-requirements, /using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support, /html5-report-viewer-widget-requirements
---

# Requirements and Browser Support for the HTML5 Report Viewer

## Requirements

1. Required Service:

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. Make sure to [enable Cross-Origin Requests (CORS)](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api) in the REST Service project.

1. Required JavaScript libraries and files:

	+ [jQuery](https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js) __minimum required version 1.9.1__. As the HTML5 Report Viewer uses Kendo UI widgets, conform the jQuery version according to the [Kendo UI requirements](https://docs.telerik.com/kendo-ui/intro/supporting/jquery-support). Note that the jQuery slim build is **not** supported.
	+ Reference to HTML5 Report Viewer JavaScript called __telerikReportViewer-{{site.buildversion}}.min.js__. By default, it is served from the Telerik Reporting REST Service.
	+ [Kendo UI](https://www.telerik.com/kendo-ui) {{site.kendosubsetversion}} or higher. Kendo UI Professional license is not required if you are only going to use the default widgets by the HTML5 Report Viewer. Telerik Reporting provides a JS file containing a subset of the used by default Kendo UI widgets called __telerikReportViewer.kendo-{{site.buildversion}}.min.js__. For more information refer to [Telerik Reporting License Agreement](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s) (point 4.2). By default, the subset is served from the Telerik Reporting REST Service.

1. Required HTML5 compliant browser. For more information see: [Browser Support](#browser-support).

## Important Settings while configuring HTML5 Report Viewer page

* __The HTML5 Viewer is designed to request its HTML template, HTML5 Report Viewer widget implementation and Kendo UI widgets subset from the resources of the Reporting REST Service.__
* The required CSS and JS files must be loaded before creating the HTML5 Viewer widget on the page.
* jQuery must be loaded only once by the page with the HTML5 Viewer.
* The report viewer JS should be referenced after any other Kendo widgets or bundles. If no Kendo widgets are utilized in the page the report viewer will automatically register a custom Kendo subset to enable the required Kendo widgets. For more information how the final page should look like, check the last step of [Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}) article.
* If you use a CDN to load the required CSS and JS files, verify the links are run over HTTP or HTTPS depending on the hosting of the application.
* If you will not add changes in the default template, you do not have to specify the HTML template viewer option. The HTML template includes links to the HTML5 Viewer's CSS template file and icon fonts, also available through the resources of the HTML5 Viewer. For more details, check [Styling and Appearance]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%}). 
* The viewer depends on the Promise object and will not load successfully if it is not available. Check [Promises/A+](https://promisesaplus.com/). Most modern browsers have native implementation and support for this object (see Browser Compatibility at [Promise - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)). If Promise object is not detected, the viewer will try to load a Promise polyfill from  [Polyfill.io](https://polyfill.io)  as CDN:  [https://cdn.polyfill.io/v2/polyfill.min.js?features=Promise](https://cdn.polyfill.io/v2/polyfill.min.js?features=Promise). If the browser security does not allow dynamic script loading or the client computer has no internet access, the CDN script might fail loading. In this case, you should load a Promises/A+ JS implementation of choice into your application. For example you can load locally the same polyfill we use: 

	````XML
<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=Promise" /script>
````


If you want to make sure that there are no Internet connection problems and the CDN service cannot be reached for some reason, download the content of the JavaScript file (open [https://cdn.polyfill.io/v2/polyfill.min.js](https://cdn.polyfill.io/v2/polyfill.min.js) in the browser that does not support promise natively, for example, IE) and serve it as a local JS file.

## Kendo Widgets Requirements

Since the HTML5 Report Viewer uses [Kendo UI](https://www.telerik.com/kendo-ui) for its default template it is possible to use it even with a custom build instead of using the shipped Kendo bundle. There are two ways to create a custom build - with  [Kendo UI Custom Download Builder](https://www.telerik.com/download/custom-download) and using [gulp build tool](https://docs.telerik.com/kendo-ui/intro/scripts/what-you-need#using-gulp).

Below you can find the list of widgets that the HTML5 Report Viewer requires in order to work properly. In case you edit the template and remove a widget you can subtract it from this list as well. Note that the widgets have other dependencies. The Touch widget is required only for the gestures. All widgets except the TreeView can be found in [Kendo UI Core](https://www.telerik.com/download/kendo-ui-core). The TreeView is in [Kendo UI Professional](https://www.telerik.com/try/kendo-ui).

Required widgets:

* Kendo TreeView (pro)
* Kendo ListView
* Kendo Menu
* Kendo PanelBar
* Kendo Window
* Kendo Editor
* Kendo DatePicker
* Kendo ComboBox
* Kendo MultiSelect
* Kendo Splitter
* Kendo Slider
* Kendo Tooltip
* Kendo Touch

## Browser Support

The HTML5 Report Viewer requires HTML5 compliant browser with support for JavaScript 1.8.5 (ECMAScript5) and CSS3. To ensure the report viewer correct behavior, always mark the web page with the `<!DOCTYPE html>` doctype.

List of Browsers covering the above requirements includes:

* Desktop

	+ Microsoft Edge
	+ Google Chrome
	+ Mozilla Firefox
	+ Opera 15.0+
	+ Safari 6.0+

* Mobile

	+ Safari for iOS
	+ Google Chrome for iOS
	+ Google Chrome for Android
	+ Android Browser
