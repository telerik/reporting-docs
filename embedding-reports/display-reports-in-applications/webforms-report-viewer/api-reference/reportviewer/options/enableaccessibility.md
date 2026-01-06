---
title: EnableAccessibility
page_title: EnableAccessibility property
description: "Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents. When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/enableaccessibility
published: True
reportingArea: WebForms
---

# The `EnableAccessibility` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents. When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies.

## Type

`System.Boolean`

## Examples

````XML
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



