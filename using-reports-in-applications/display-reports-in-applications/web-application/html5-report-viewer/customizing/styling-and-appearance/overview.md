---
title: Styling and Appearance Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview
tags: overview
published: True
position: 0
---

# Styling and Appearance Overview



The article elaborates on the styles used by the HTML5 Report Viewer, and how they can be loaded manually in order to be modified.

## 

The styling and appearance of the HTML5 Report Viewer is controlled entirely through a set of CSS3 styles organized in classes with predefined names.          

>tip All path references in the article should be adapted according             to your project setup. For more information please refer to the MSDN article              [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx) The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation -             [Installation Directories](6E821131-83F3-45A4-BB6E-1530223D1E38#directories-and-asemblies).           


All viewer related classes are supplied by a single CSS stylesheet referenced in the report viewer HTML template.           The template is provided by the Reporting REST service. To force a custom template with  a custom or default CSS specify           the __templateUrl__  of the HTML5 Viewer widget option. For reference you can use the templates           located in __%programfiles(x86)%\Progress\Reporting [VERSION]\Html5\ReportViewer\templates__ :         

	
````js
<script type="text/javascript">
        $("#reportViewer1")
            .telerik_ReportViewer({
                serviceUrl: "/api/reports/",
                templateUrl: /ReportViewer/templates/telerikReportViewerTemplate-x.x.x.x.html
                ......
            });
</script>
````



In addition the Kendo UI CSS needs to be supplied in order for the Kendo UI widgets to be operational:         

	
````html
          <link href="/kendo/styles/kendo.common.min.css" rel="stylesheet" />
````



While these classes provide layout settings the HTML5 Report Viewer depends on the Kendo UI themes for its colors (theme):         

	
````html
          <link href="/kendo/styles/kendo.blueopal.min.css" rel="stylesheet" />
````



The default template depends on Telerik Web UI font, that is provided by the Reporting REST service.         

Additionally we provide a template that depends on  [Font Awesome](http://fortawesome.github.io/Font-Awesome/)  for the menu icons.           Font Awesome is not part of the Telerik HTML5 Report Viewer distribution and could be obtained from            [http://fortawesome.github.io/Font-Awesome/](http://fortawesome.github.io/Font-Awesome/) .         

>note Please note that you are not required nor limited to use our font or Font Awesome.             The distributed templates provide only a base/reference implementation of the report viewer’s content             that can be modified according to your needs.           


In order to use Font Awesome you have to specify the font awesome template. The template is located in           (%programfiles(x86)%\Progress\Reporting [VERSION]\Html5\ReportViewer\templates):         

	
````js
<script type="text/javascript">
        $("#reportViewer1")
            .telerik_ReportViewer({
                templateUrl: /ReportViewer/templates/telerikReportViewerTemplate-FA-x.x.x.x.html
                ....
</script>
````



The default viewer template and stylesheet depend on CSS media queries to adapt its layout according to the device and display.           In order the media queries to be activated properly the browser’s viewport needs to be initialized like this:         

	
````html
          <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
````



# See Also


 * [HTML5 Report Viewer - Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})

 * [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})
