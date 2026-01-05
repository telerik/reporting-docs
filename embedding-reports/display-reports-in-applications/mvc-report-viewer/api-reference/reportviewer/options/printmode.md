---
title: PrintMode
page_title: PrintMode property
description: "Sets the print mode of the viewer. Three modes exist currently: AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file. ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings. ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled. Controls the printing mechanism based on browser capabilities and user requirements for optimal print experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/printmode
published: True
reportingArea: MVCWrapper
---

# The `PrintMode` option of the HTML5 ASP.NET MVC Report Viewer

Sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file.
- ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled.
- Controls the printing mechanism based on browser capabilities and user requirements for optimal print experience.

## Type

[`Telerik.ReportViewer.Mvc.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/printmode%})

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!--
Example: Set the print mode of the Telerik Reporting HTML5 MVC Report Viewer to ForcePDFPlugin.
-->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PrintMode(PrintMode.ForcePDFPlugin)
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
* [PrintMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/printmode%})
