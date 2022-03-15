---
title: Custom Report Viewer Template
page_title: Custom Report Viewer Template 
description: Custom Report Viewer Template
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/custom-report-viewer-template
tags: custom,report,viewer,template
published: True
position: 0
---

# Custom Report Viewer Template
The React Report Viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and it uses the same [styling](%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%}) mechanism.

# Adding Custom Report Viewer Template

1. The [template of the viewer](%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview%}) can be found in the installation folder of Telerik Reporting:
C:\Program Files (x86)\Progress\Telerik Reporting **Version** \Html5\ReportViewer\templates

1. Copy the file to your React application or REST service project, depending on your preferences.

1. Make the required changes in the file.

1. Set the **templateUrl** property of the viewer:

   ````js
<TelerikReportViewer
        ref={el => viewer = el}     
        templateUrl="telerikReportViewerTemplate-VERSION.html/"
        reportSource={{
          report: 'MyReport.trdp',
          parameters: {}
        }}
        >
````


## See Also

* [Templates Overview](%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview%})

* [Templates Strucure](%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-structure%})

* [Providing Custom Templates](%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%})
