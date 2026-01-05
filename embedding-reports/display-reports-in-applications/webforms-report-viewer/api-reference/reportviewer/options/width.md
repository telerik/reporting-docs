---
title: Width
page_title: Width property
description: "Gets or sets the width of the HTML5 ReportViewer control."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/width
published: True
reportingArea: WebForms
---

# The `Width` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the width of the HTML5 ReportViewer control.

## Type

`System.Web.UI.WebControls.Unit`

## Examples

````XML
<!-- Example: Setting the Width property of the ReportViewer control -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo - Width Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set the Width property to 800px -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Width="800px">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

