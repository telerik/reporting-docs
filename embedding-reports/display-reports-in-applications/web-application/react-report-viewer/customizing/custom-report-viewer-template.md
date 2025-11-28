---
title: Custom Template
page_title: Customizing the Report Viewer Template
description: "Understand how the template of the React Report Viewer component works and learn how to customize it with the provided steps and sample code snippet."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/custom-report-viewer-template
tags: react, custom, report, viewer, template
published: True
reportingArea: React
position: 0
previous_url: /react-report-viewer-template
---

# Custom Report Viewer Template

The React Report Viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and it uses the same [styling]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%}) mechanism.

## Adding a Custom Report Viewer Template

1. The [template of the React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview%}) can be found in the installation folder of Telerik Reporting - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer\templates`.
1. Copy the file to your React application `assets` folder or the REST Service project, depending on your preferences.
1. Make the required changes in the file.
1. Set the **templateUrl** property of the viewer:

```HTML
    <TelerikReportViewer templateUrl="/api/customtemplates/customTelerikReportViewerTemplate/"/>
```

## See Also

- [Templates Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview%})

- [Templates Strucure]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-structure%})

- [Providing Custom Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%})
