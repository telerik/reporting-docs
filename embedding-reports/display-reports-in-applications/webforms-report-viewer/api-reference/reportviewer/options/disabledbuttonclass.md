---
title: DisabledButtonClass
page_title: DisabledButtonClass property
description: "Gets or sets the CSS class applied to toolbar buttons when they are in the disabled state. Enables custom styling of disabled buttons in the HTML5 viewer toolbar for consistent visual design and user experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/disabledbuttonclass
published: True
reportingArea: WebForms
---

# The `DisabledButtonClass` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the CSS class applied to toolbar buttons when they are in the disabled state. Enables custom styling of disabled buttons in the HTML5 viewer toolbar for consistent visual design and user experience.

## Type

`System.String`

## Examples

````XML
<!-- Example: Set the DisabledButtonClass property to apply a custom CSS class for disabled toolbar buttons in the ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo - DisabledButtonClass Property</title>
    <style>
        /* Example custom class for disabled buttons */
        .my-disabled-class {
            opacity: 0.5;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              DisabledButtonClass="my-disabled-class">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

