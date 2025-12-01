---
title: EnableAccessibility
page_title: EnableAccessibility property
description: "Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents. <remarks>When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/enableaccessibility
published: True
reportingArea: WebFormsWrapper
---

# EnableAccessibility

Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents. <remarks>When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies.</remarks>

## Type

`System.Boolean`

## Examples

````JavaScript
<!-- Example: Set EnableAccessibility property to true for the Report Viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EnableAccessibility Example</title>
</head>
<body>
    <form runat="server">
        <!-- Sets EnableAccessibility to true -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              EnableAccessibility="true">
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
