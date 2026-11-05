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

> note The Kendo UI scripts from the public CDNs are not prelicensed. Apply your Kendo UI for jQuery license as described in [Setting Up Your License Key](https://www.telerik.com/kendo-jquery-ui/documentation/intro/installation/using-license-code).

## HTML5 Report Viewer

Add the following Kendo UI assets to the page that hosts the viewer:

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
