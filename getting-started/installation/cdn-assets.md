---
title: Telerik Reporting CDN
page_title: Using the Telerik Reporting CDN in Web Apps
description: "Use the Telerik Reporting CDN to serve resources for the html5-based report viewers and the web report designer. Includes the minimal required kendo subsets."
slug: telerikreporting/getting-started/installation/cdn-assets
tags: how,to,add,the,telerik,cdn,reportviewer,script
published: True
position: 9
reportingArea: General
components: [general]
---

# HTML5 Report Viewer and Web Report Designer Assets

Use the [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/overview) to display reports in a web application. 

Use the [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) to create and edit reports in a browser. Both use scripts from a Telerik Reporting REST service.

## HTML5 Report Viewer

Add the following Kendo UI assets to the page that hosts the viewer:

- Kendo UI script: `https://cdn.jsdelivr.net/npm/@progress/kendo-ui@{{site.kendosubsetversion}}/umd/kendo.all.min.js`
- Ocean Blue theme: `https://cdn.jsdelivr.net/npm/@progress/kendo-theme-default@{{site.kendothemeversion}}/dist/default-ocean-blue.css`

Load the Report Viewer script from the REST service that processes your reports:

`/api/reports/resources/js/telerikReportViewer`

If your REST service uses a different path, replace `/api/reports` with that path.

## Web Report Designer

Add the following scripts to the page in this order. Use the REST service that hosts your Web Report Designer:

1. Kendo UI: `https://cdn.jsdelivr.net/npm/@progress/kendo-ui@{{site.kendosubsetversion}}/umd/kendo.all.min.js`
1. Report Viewer: `/api/reportdesigner/resources/js/telerikReportViewer`
1. Web Report Designer: `/api/reportdesigner/designerresources/js/webReportDesigner`

If your REST service uses a different path, replace `/api/reportdesigner` with that path.
