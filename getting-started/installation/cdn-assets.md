---
title: Web Reporting Assets
page_title: Loading Report Viewer and Designer Assets
description: "Learn how to load Kendo UI and HTML5 Report Viewer scripts and themes from public CDNs, and Web Report Designer scripts from a Telerik Reporting REST service."
slug: telerikreporting/getting-started/installation/cdn-assets
tags: html5,reportviewer,webreportdesigner,kendo,cdn,assets
published: True
position: 9
reportingArea: General
components: [general]
---

# HTML5 Report Viewer and Web Report Designer Assets

Use CDN-hosted scripts for the HTML5 Report Viewer. For the Web Report Designer, load its viewer and designer scripts from the REST service that hosts it.

For Web Report Designer applications that use only the default Reporting widgets, you can use the Reporting-supplied Kendo UI subset instead of the full Kendo UI script shown below. 

Replace it with a locally hosted copy of `webReportDesigner.kendo-{{site.buildversion}}.min.js`. 

Copy the file from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\js` and load it in place of the Kendo UI script. Keep the theme and other Reporting scripts. 

See [why the Reporting subsets avoid separate Kendo license validation](slug:kendo-jquery-license-warning-aspnetcore-reporting#cause).

> note The separate Kendo UI script from the public CDN used for the Web Report Designer is not prelicensed. Apply your Kendo UI for jQuery license as described in [Setting Up Your License Key](https://www.telerik.com/kendo-jquery-ui/documentation/intro/installation/using-license-code).

## HTML5 Report Viewer

Add the following assets to the page in order. The Kendo UI script provides the viewer's Kendo UI assets, so do not also load a separate Kendo UI script.

- Ocean Blue theme stylesheet:

	```html
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@progress/kendo-theme-default@{{site.kendothemeversion}}/dist/default-ocean-blue.css">
	```

- jQuery:

	```html
	<script src="https://code.jquery.com/jquery-{{site.jqueryversion}}.min.js"></script>
	```

- Kendo UI script for the Report Viewer:

	```html
	<script src="https://cdn.jsdelivr.net/npm/@progress/telerik-jquery-report-viewer@{{site.spaviewerversion}}./dist/js/telerikReportViewer.kendo.min.js"></script>
	```

- Report Viewer script:

	```html
	<script src="https://cdn.jsdelivr.net/npm/@progress/telerik-jquery-report-viewer@{{site.spaviewerversion}}./dist/js/telerikReportViewer.min.js"></script>
	```

## Web Report Designer

Load jQuery first (for example, `https://code.jquery.com/jquery-{{site.jqueryversion}}.min.js`), then add the following scripts in order. Use the REST service that hosts your Web Report Designer:

1. Kendo UI: `https://cdn.jsdelivr.net/npm/@progress/kendo-ui@{{site.kendosubsetversion}}/umd/kendo.all.min.js`
1. Report Viewer: `/api/reportdesigner/resources/js/telerikReportViewer`
1. Web Report Designer: `/api/reportdesigner/designerresources/js/webReportDesigner`

If your REST service uses a different path, replace `/api/reportdesigner` with that path.
