---
title: Web Reporting Assets
page_title: Loading Report Viewer and Designer Assets
description: "Learn how to load Kendo UI scripts and themes from public CDNs and Telerik Reporting scripts from REST services for the HTML5 viewer and Web Report Designer."
slug: telerikreporting/getting-started/installation/cdn-assets
tags: html5,reportviewer,webreportdesigner,kendo,cdn,assets
published: True
position: 9
reportingArea: General
components: [general]
---

# HTML5 Report Viewer and Web Report Designer Assets

The HTML5 Report Viewer and Web Report Designer require Kendo UI assets and Telerik Reporting scripts. This article lists the public CDN URLs for the Kendo UI assets and the REST service endpoints that serve the Reporting scripts.

For applications that use only the default Reporting widgets, use the Reporting-supplied Kendo UI subsets instead of the full Kendo UI scripts listed below. The HTML5 Report Viewer loads its subset automatically from the Reporting REST Service when no Kendo UI bundle is present. For the Web Report Designer, replace the full Kendo UI script with a locally hosted copy of `webReportDesigner.kendo-{{site.buildversion}}.min.js`. Copy it from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\js` and load it in the same position. Keep the theme and other Reporting scripts. See [why the Reporting subsets avoid separate Kendo license validation](slug:kendo-jquery-license-warning-aspnetcore-reporting#cause).

> note The Kendo UI scripts from the public CDNs are not prelicensed. Apply your Kendo UI for jQuery license as described in [Setting Up Your License Key](https://www.telerik.com/kendo-jquery-ui/documentation/intro/installation/using-license-code).

## HTML5 Report Viewer

Load jQuery first (for example, `https://code.jquery.com/jquery-{{site.jqueryversion}}.min.js`), then add the following Kendo UI assets to the page that hosts the viewer:

- Kendo UI script: `https://cdn.jsdelivr.net/npm/@progress/kendo-ui@{{site.kendosubsetversion}}/umd/kendo.all.min.js`
- Ocean Blue theme: `https://cdn.jsdelivr.net/npm/@progress/kendo-theme-default@{{site.kendothemeversion}}/dist/default-ocean-blue.css`

Load the Report Viewer script from the REST service that processes your reports:

`/api/reports/resources/js/telerikReportViewer`

If your REST service uses a different path, replace `/api/reports` with that path.

## Web Report Designer

Load jQuery first (for example, `https://code.jquery.com/jquery-{{site.jqueryversion}}.min.js`), then add the following scripts in order. Use the REST service that hosts your Web Report Designer:

1. Kendo UI: `https://cdn.jsdelivr.net/npm/@progress/kendo-ui@{{site.kendosubsetversion}}/umd/kendo.all.min.js`
1. Report Viewer: `/api/reportdesigner/resources/js/telerikReportViewer`
1. Web Report Designer: `/api/reportdesigner/designerresources/js/webReportDesigner`

If your REST service uses a different path, replace `/api/reportdesigner` with that path.
