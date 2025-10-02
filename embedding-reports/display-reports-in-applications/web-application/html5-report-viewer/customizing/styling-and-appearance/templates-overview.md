---
title: Templates Overview
page_title: Templates of the HTML5 Report Viewer at a Glance
description: "Learn more about the structure of the HTML5 Report Viewer Templates in Telerik Reporting and where the template files get deployed with the installation."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview
tags: templates,overview,html5,reporting,telerik,files
published: True
reporting_area: HTML5
position: 1
previous_url: /html5-report-viewer-template
---

# Templates of the HTML5 Report Viewer

The article elaborates on the structure of the HTML template file of the HTML5 Report Viewer. The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation - [Installation Directories]({%slug telerikreporting/installation%}#directories-and-asemblies).

The default viewer's template is divided into three areas:

* Report Pages Area - responsible for displaying the report pages, viewer’s status, and error messages.
* Parameters Area - responsible for displaying parameter editors for the visible report parameters.
* Document Map Area - displays the report’s document map and allows navigation in its content.

Besides these three areas, the viewer template contains top and side menus that provide the basic tools for navigating into the reports when the viewer is rendered on desktop or mobile devices.

All these elements of the HTML5 Report Viewer are provided through the __trv-report-viewer__ template and are loaded dynamically during the initialization of the __telerik_ReportViewer__ widget.

While loading the template content, the widget looks for elements marked with the data-role attribute and maps its value to a [jQuery plugin function](https://plugins.jquery.com/) that provides the element behavior. For example:

````HTML
<div class="trv-parameters-area k-widget" data-role="telerik_ReportViewer_ParametersArea"> … </div>
````

is mapped to:

````JavaScript
jQuery.fn.telerik_ReportViewer_ParametersArea(options)
````

If such a function exists, it is invoked onto the HTML element (that owns the data-role attribute) passing an options object with the following properties:

* __controller__ - a `telerikReportViewer.ReportViewerController` object that is responsible for the basic viewer operations;
* __commands__ - a `telerikReportViewer.CommandSet` object that contains all commands;
* __templates__ - an object that contains all templates loaded for the current report viewer instance. The id of the template is used as a property’s name, and the value is the template HTML content.

Using this declarative approach of describing the report viewer’s layout and behavior allows users to easily tweak any parts of it by simply modifying the templates. Following the above pattern, one can create their own data role and extend the default viewer behavior.

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
