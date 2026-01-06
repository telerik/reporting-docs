---
title: DocumentMapAreaPosition
page_title: DocumentMapAreaPosition property
description: "Gets or sets the positioning of the document map area within the HTML5 viewer interface. Controls the placement of the document map navigation panel relative to the report content area for optimal user experience and interface layout in HTML5 scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/documentmapareaposition
published: True
reportingArea: WebForms
---

# The `DocumentMapAreaPosition` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the positioning of the document map area within the HTML5 viewer interface. Controls the placement of the document map navigation panel relative to the report content area for optimal user experience and interface layout in HTML5 scenarios.

## Type

[`Telerik.ReportViewer.Html5.WebForms.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/documentmapareaposition%})

## Examples

````XML
<!-- Example: Setting the DocumentMapAreaPosition property on the Telerik HTML5 ReportViewer -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DocumentMapAreaPosition Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set DocumentMapAreaPosition to Left -->
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              DocumentMapAreaPosition="Left">
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

* [DocumentMapAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/documentmapareaposition%})


