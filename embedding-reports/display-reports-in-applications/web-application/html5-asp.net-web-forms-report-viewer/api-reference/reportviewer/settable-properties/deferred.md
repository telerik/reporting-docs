---
title: Deferred
page_title: Deferred property
description: "Gets or sets a value indicating whether the HTML5 viewer's JavaScript initialization is deferred until a specific point in the page lifecycle. <remarks>When enabled, allows for more controlled initialization timing of the HTML5 viewer, which can be useful for complex page scenarios or custom loading sequences.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/deferred
published: True
reportingArea: WebFormsWrapper
---

# Deferred

Gets or sets a value indicating whether the HTML5 viewer's JavaScript initialization is deferred until a specific point in the page lifecycle. <remarks>When enabled, allows for more controlled initialization timing of the HTML5 viewer, which can be useful for complex page scenarios or custom loading sequences.</remarks>

## Type

`System.Boolean`

## Examples

````JavaScript
<!-- Example demonstrating the use of the Deferred property of the Telerik HTML5 WebForms ReportViewer.
This property controls whether the viewer's JavaScript initialization is deferred. -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Deferred Initialization Example</title>
</head>
<body>
    <form runat="server">
     <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Deferred="false">
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
