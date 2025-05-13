---
title: Overview
page_title: Styling and Appearance of the HTML5 Report Viewer at a Glance
description: "Learn how the styling and appearance of the HTML5 Report Viewer can be changed in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview
tags: overview
published: True
reporting_area: HTML5
position: 0
previous_url: /html5-report-viewer-styling-and-appearance, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/
---

# Styling and Appearance of the HTML5 Report Viewer

The article elaborates on the styles used by the HTML5 Report Viewer and how they can be loaded manually to be modified.

The styling and appearance of the HTML5 Report Viewer are controlled entirely through a set of CSS3 styles organized in classes with predefined names.

> All path references in the article should be adapted according to your project setup. For more information, please refer to the MSDN article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)). The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation - [Installation Directories]({%slug telerikreporting/installation%}#directories-and-asemblies).

All viewer-related classes are supplied by a single CSS stylesheet referenced in the report viewer HTML template. The template is provided by the Reporting REST service. To force a custom template with  a custom or default CSS, specify the __templateUrl__ of the HTML5 Viewer widget option. For reference, you can use the templates located in __%programfiles(x86)%\Progress\Reporting {{site.suiteversion}}\Html5\ReportViewer\templates__:

{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\AddTemplate.html}}

In addition, the Kendo UI CSS needs to be supplied for the Kendo UI widgets to be operational. While these classes provide layout settings, the HTML5 Report Viewer depends on the Kendo UI themes for its colors (theme):

{{source=CodeSnippets\BlazorAppSnippets\wwwroot\manual-setup\AddKendoStyles.html}}

The default template depends on the Telerik Web UI font provided by the Reporting REST service. 

The default viewer template and stylesheet also depend on CSS media queries to adapt their layout according to the device and display. For the media queries to be activated properly, the browser’s viewport needs to be initialized like this:

{{source=CodeSnippets\BlazorAppSnippets\wwwroot\manual-setup\InitializeViewport.html}}

## See Also

- [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
- [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})
