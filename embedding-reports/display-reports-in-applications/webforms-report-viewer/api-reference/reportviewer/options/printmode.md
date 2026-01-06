---
title: PrintMode
page_title: PrintMode property
description: "Gets or sets the print mode of the viewer. Three modes exist currently: AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file. ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings. ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled. Controls the printing workflow to ensure optimal print experience across different browsers and PDF plugin configurations in HTML5 environments. Available modes include AutoSelect for intelligent method selection, ForcePDFPlugin for direct plugin usage, and ForcePDFFile for download-based printing."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/printmode
published: True
reportingArea: WebForms
---

# The `PrintMode` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file.
- ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled.
- Controls the printing workflow to ensure optimal print experience across different browsers and PDF plugin configurations in HTML5 environments.
- Available modes include AutoSelect for intelligent method selection, ForcePDFPlugin for direct plugin usage, and ForcePDFFile for download-based printing.

## Type

[`Telerik.ReportViewer.Html5.WebForms.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/printmode%})

## Examples

````XML
<!-- Example: Setting the PrintMode property of the Telerik HTML5 ReportViewer to ForcePDFFile -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer PrintMode Example</title>
</head>
<body>
    <form runat="server">
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PrintMode="ForcePDFFile">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [PrintMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/printmode%})


