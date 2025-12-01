---
title: ParametersAreaPosition
page_title: ParametersAreaPosition property
description: "Gets or sets the positioning of the parameters area within the HTML5 viewer interface. <remarks>Controls the placement of parameter input controls relative to the report content area for optimal user experience and interface layout in HTML5 scenarios.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/parametersareaposition
published: True
reportingArea: WebFormsWrapper
---

# ParametersAreaPosition

Gets or sets the positioning of the parameters area within the HTML5 viewer interface. <remarks>Controls the placement of parameter input controls relative to the report content area for optimal user experience and interface layout in HTML5 scenarios.</remarks>

## Type

`Telerik.ReportViewer.Html5.WebForms.ParametersAreaPosition`

## Examples

````JavaScript
<!-- Example: Set the ParametersAreaPosition property of the ReportViewer in WebForms -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer - ParametersAreaPosition Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set ParametersAreaPosition to Top, positioning the parameters area above the report viewer -->
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ParametersAreaPosition="Top">
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
