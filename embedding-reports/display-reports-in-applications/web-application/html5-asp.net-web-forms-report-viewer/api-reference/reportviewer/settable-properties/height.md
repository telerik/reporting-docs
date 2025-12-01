---
title: Height
page_title: Height property
description: "Gets or sets the height of the HTML5 ReportViewer control."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/height
published: True
reportingArea: WebFormsWrapper
---

# Height

Gets or sets the height of the HTML5 ReportViewer control.

## Type

`System.Web.UI.WebControls.Unit`

## Examples

````JavaScript
<!-- Example: Set the Height property of the Telerik HTML5 ReportViewer control in a WebForms page -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set ReportViewer Height Property Example</title>
</head>
<body>
    <form runat="server">
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Height="600px">
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
