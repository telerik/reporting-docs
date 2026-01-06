---
title: ReportSource
page_title: ReportSource property
description: "Gets or sets the Telerik.ReportViewer.Html5.WebForms.ReportSource for the report displayed in the HTML5 viewer. Specifies the report to be displayed including its identifier, parameters, and source type for proper report loading and processing in the HTML5 environment."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: WebForms
---

# The `ReportSource` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource%}) for the report displayed in the HTML5 viewer. Specifies the report to be displayed including its identifier, parameters, and source type for proper report loading and processing in the HTML5 environment.

## Type

[`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource%})

## Examples

````XML
<!-- Example: Setting the ReportSource property of the Telerik ReportViewer to ForcePDFFile -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer ReportSource Example</title>
</head>
<body>
    <form runat="server">
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
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

* [ReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource%})


