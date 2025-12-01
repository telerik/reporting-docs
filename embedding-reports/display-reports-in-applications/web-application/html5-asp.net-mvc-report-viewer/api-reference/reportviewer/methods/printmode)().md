---
title: PrintMode)()
page_title: The PrintMode)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the PrintMode)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/printmode)()
tags: printmode)
published: True
reportingArea: MVCWrapper
position: 19
---

# The `PrintMode)()` method of the ASP.NET MVC Report Viewer

Sets the print mode of the viewer. Three modes exist currently: AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file. ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings. ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled. <remarks>Controls the printing mechanism based on browser capabilities and user requirements for optimal print experience.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
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

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

