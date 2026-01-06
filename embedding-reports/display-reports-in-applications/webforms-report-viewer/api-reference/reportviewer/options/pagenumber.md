---
title: PageNumber
page_title: PageNumber property
description: "Gets or sets the current page number of the report displayed in the HTML5 viewer. Determines which page is initially displayed when the report loads in the HTML5 viewer interface."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/pagenumber
published: True
reportingArea: WebForms
---

# The `PageNumber` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the current page number of the report displayed in the HTML5 viewer. Determines which page is initially displayed when the report loads in the HTML5 viewer interface.

## Type

`System.Int32`

## Examples

````XML
<!-- Example: Setting the PageNumber property of the Telerik HTML5 ReportViewer in Web Forms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer PageNumber Property Example</title>
</head>
<body>
    <form runat="server">
        <%-- Set initial page number to 2 --%>
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PageNumber="1">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````



