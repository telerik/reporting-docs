---
title: Scale
page_title: Scale property
description: "Gets or sets the zoom level of the report where 1.0 equals 100% of the original report size. <remarks>Provides precise control over report magnification in the HTML5 viewer when using specific scaling mode or custom zoom requirements.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/scale
published: True
reportingArea: WebFormsWrapper
---

# Scale

Gets or sets the zoom level of the report where 1.0 equals 100% of the original report size. <remarks>Provides precise control over report magnification in the HTML5 viewer when using specific scaling mode or custom zoom requirements.</remarks>

## Type

`System.Double`

## Examples

````JavaScript
<!-- Example: Setting the Scale property of the Telerik ReportViewer to 1.0 -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer Scale Example</title>
</head>
<body>
    <form runat="server">
   <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Scale="1.0">
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

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
