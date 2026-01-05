---
title: ParameterEditors
page_title: ParameterEditors property
description: "Gets or sets the parameter editors configuration that defines JavaScript functions for handling different parameter types in the HTML5 viewer. Enables customization of parameter input controls by specifying JavaScript editor functions for different parameter scenarios including single-select, multi-select, and type-specific editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/parametereditors
published: True
reportingArea: WebForms
---

# The `ParameterEditors` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the parameter editors configuration that defines JavaScript functions for handling different parameter types in the HTML5 viewer. Enables customization of parameter input controls by specifying JavaScript editor functions for different parameter scenarios including single-select, multi-select, and type-specific editors.

## Type

[`Telerik.ReportViewer.Html5.WebForms.ParameterEditors`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametereditors%})

## Examples

````XML
<!-- Example: Setting the ParameterEditors property of the ReportViewer in WebForms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Viewer ParameterEditors Demo</title>
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
            <ParameterEditors></ParameterEditors>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
* [ParameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametereditors%})
