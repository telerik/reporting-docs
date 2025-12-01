---
title: Telerik Reporting CDN
page_title: Using the Telerik Reporting CDN in Web Apps
description: "Use the Telerik Reporting CDN to serve resources for the html5-based report viewers and the web report designer. Includes the minimal required kendo subsets."
slug: telerikreporting/getting-started/installation/cdn-assets
tags: how,to,add,the,telerik,cdn,reportviewer,script
published: True
position: 9
reportingArea: General
---

# HTML5 Report Viewer and Web Report Designer Assets

In order to run any of the [HTML5-based report viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}), you need to add a reference to the JavaScript file of the viewer.
When it comes to the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}), in addition to the viewer's script,
you also have to add the designer's scripts.

## Previous Approach

You could serve the files from the Telerik Reporting REST service or add them locally to your project by coping them from the installation folder
of Telerik Reporting:

`C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5`

## Current Recommendation

Now, these resources are served also by the Telerik Reporting CDN and we recommend it as a first-choice option.
To serve a resource from the CDN, you can construct the URL as follows:

`https://reporting.cdn.telerik.com/{{site.buildversion}}/js/*NameOfFile*`

For example:

`https://reporting.cdn.telerik.com/{{site.buildversion}}/js/webReportDesigner.min.js`
