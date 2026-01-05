---
title: ParametersAreaVisible
page_title: ParametersAreaVisible property
description: "Gets or sets a value indicating whether the parameters area is initially visible in the HTML5 viewer. Controls the initial visibility state of the parameters input area for reports that contain parameters requiring user input."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/parametersareavisible
published: True
reportingArea: WebForms
---

# The `ParametersAreaVisible` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets a value indicating whether the parameters area is initially visible in the HTML5 viewer. Controls the initial visibility state of the parameters input area for reports that contain parameters requiring user input.

## Type

`System.Boolean`

## Examples

````XML
<!-- Example: Set the ParametersAreaVisible property of the ReportViewer in WebForms -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer - ParametersAreaVisible Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set ParametersAreaVisible to true, making the parameters area visible above the report viewer -->
     <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ParametersAreaVisible="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

