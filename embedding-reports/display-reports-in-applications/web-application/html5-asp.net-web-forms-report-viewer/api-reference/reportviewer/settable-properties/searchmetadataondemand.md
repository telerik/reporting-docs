---
title: SearchMetadataOnDemand
page_title: SearchMetadataOnDemand property
description: "Gets or sets a value indicating whether search metadata is delivered on-demand or preloaded with the report in the HTML5 viewer. <remarks>When enabled, search metadata is loaded only when needed, reducing initial load time but potentially increasing search operation latency. When disabled, search metadata is preloaded for faster search operations.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/searchmetadataondemand
published: True
reportingArea: WebFormsWrapper
---

# SearchMetadataOnDemand

Gets or sets a value indicating whether search metadata is delivered on-demand or preloaded with the report in the HTML5 viewer. <remarks>When enabled, search metadata is loaded only when needed, reducing initial load time but potentially increasing search operation latency. When disabled, search metadata is preloaded for faster search operations.</remarks>

## Type

`System.Boolean`

## Examples

````JavaScript
<!-- Example: Set the SearchMetadataOnDemand property to enable on-demand search metadata delivery in the HTML5 WebForms ReportViewer. -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SearchMetadataOnDemand Example</title>
</head>
<body>
    <form runat="server">
 <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              SearchMetadataOnDemand="true">
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
