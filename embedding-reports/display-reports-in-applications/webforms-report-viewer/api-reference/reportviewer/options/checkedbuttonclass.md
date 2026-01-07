---
title: CheckedButtonClass
page_title: CheckedButtonClass property
description: "Gets or sets the CSS class applied to toolbar buttons when they are in the checked or active state. Enables custom styling of checked buttons in the HTML5 viewer toolbar for consistent visual design and user experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/checkedbuttonclass
published: True
reportingArea: WebForms
---

# The `CheckedButtonClass` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the CSS class applied to toolbar buttons when they are in the checked or active state. Enables custom styling of checked buttons in the HTML5 viewer toolbar for consistent visual design and user experience.

## Type

`System.String`

## Examples

````XML
<!-- Example of setting the report viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Report Viewer CheckedButtonClass Example</title>
</head>
<body>
    <form runat="server">
       <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              CheckedButtonClass="my-checked-btn-class">
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

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/overview%})
* [Deferred]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/deferred%})
* [DisabledButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/disabledbuttonclass%})

