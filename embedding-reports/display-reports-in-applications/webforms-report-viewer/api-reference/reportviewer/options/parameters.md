---
title: Parameters
page_title: Parameters property
description: "Gets or sets the parameters display configuration that defines the visual appearance and behavior of parameter input controls. Controls the parameter editor types and visual presentation styles for both single-select and multi-select parameter scenarios in the HTML5 viewer interface."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/parameters
published: True
reportingArea: WebForms
---

# The `Parameters` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the parameters display configuration that defines the visual appearance and behavior of parameter input controls. Controls the parameter editor types and visual presentation styles for both single-select and multi-select parameter scenarios in the HTML5 viewer interface.

## Type

[`Telerik.ReportViewer.Html5.WebForms.Parameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameters%})

## Examples

````XML
<!-- Example demonstrating usage of the ReportViewer.Parameters property -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer Parameters Property Example</title>
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
            <Parameters />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameters%})
